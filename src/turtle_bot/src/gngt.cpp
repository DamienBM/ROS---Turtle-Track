#include "ros/ros.h"
#include <ctime>
#include <cstdlib>
#include <climits>
#include <cmath>
#include <vector>
#include <map>
#include <ctime>
#include <cstdlib>
#include <iterator>
#include <utility>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <opencv2/highgui.hpp>
#include <turtle_bot/ArenaPosition.h>
#include <turtle_bot/ArenaPositions.h>
#include <turtle_bot/Entity.h>
#include <turtle_bot/Entities.h>

/** From GNGT-DEMO::GNGT **/
#include <visualization_msgs/Marker.h>
#include <geometry_msgs/Point.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/point_types.h>
#include <vq2.h>
/**************************/

#define SEUIL 0.1
#define MINI 0.0
#define MAXI 3.6

/** GNGT ALGO **/

// This defines the graph
typedef vq2::algo::gngt::Unit<pcl::PointXYZ>         Unit;
typedef vq2::Graph<Unit,char,Unit::copy_constructor> GNGT;

float uniform(double min, double max) {
  return min + (max-min)*(std::rand()/(1.0+RAND_MAX));
}

float distanceEuclidienne(float x1, float y1, const float x2, const float y2){
  return std::sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
}

// For finding the winner in the GNGT algorithm, we need some
// similarity measure. Here, let us use the squared euclidian
// distance.

class Similarity {
public:
  typedef pcl::PointXYZ value_type;
  typedef pcl::PointXYZ sample_type;
  double operator()(const value_type& arg1,
		    const sample_type& arg2) {
    double dx = arg1.x - arg2.x;
    double dy = arg1.y - arg2.y;
    return dx*dx + dy*dy;
  }
};
typedef vq2::unit::Similarity<Unit,Similarity> UnitSimilarity;

// The learning process.
class Learn {
public:
  typedef pcl::PointXYZ sample_type;
  typedef pcl::PointXYZ weight_type;
  void operator()(double coef,
                  weight_type& prototype,
                  const sample_type& target) {
    prototype.x += coef * (target.x - prototype.x);
    prototype.y += coef * (target.y - prototype.y);
  }
};
typedef vq2::unit::Learn<Unit,Learn> UnitLearn;

// This is the parameter set for GNG-T
struct Params {
public:

  int age_max=20;
  int learning_rate=50;
  int learning_ratio=20;
  int lambdaz=10;
  // Evolution
  int targetz=10;
  int nb_samplez=80;
  int low_pass_coef=40;
  int deltaz=91;
  int marginz=3;
  
  // GNG-T
  int ageMax(void)           {return age_max;}
  double learningRate(void)  {return (learning_rate / 10000.0);}
  double learningRatio(void) {return (learning_ratio / 100.0);}
  double lambda(void)        {return (lambdaz / 1000.0);}
  // Evolution
  double target(void)        {return  (targetz / 50.0e5);}
  double nbSamples(void)     {return  (nb_samplez * 1000.0);}
  double lowPassCoef(void)   {return  (low_pass_coef / 100.0) ;}
  double delta(void)         {return  (deltaz / 100.0);}
  double margin(void)        {return  (marginz / 100.0);}
  };

/*struct Params {
public:
  // GNG-T
  int ageMax(void)           {return 20;}
  double learningRate(void)  {return .005;}
  double learningRatio(void) {return .2;}
  double lambda(void)        {return .001;}
  // Evolution
  double target(void)        {return 1e-5;}
  double nbSamples(void)     {return 10000;}
  double lowPassCoef(void)   {return .4;}
  double delta(void)         {return .75;}
  double margin(void)        {return .2;}
  };*/

// Some evolution class is required to control the GNG-T
// evolution. Let us use the default one here.
typedef vq2::by_default::gngt::Evolution<Params> Evolution;

// This functor collects vertices and edges.
class Get {
public:
  std::vector<pcl::PointXYZ>                             vertices;
  std::vector< std::pair<pcl::PointXYZ,pcl::PointXYZ> >  edges;
  
  bool operator()(GNGT::edge_type& e) { 
    if(e.stuff.efficient)
      edges.push_back(std::make_pair((*(e.n1)).value.prototype(),
				     (*(e.n2)).value.prototype()));
    return false;
  }

  bool operator()(GNGT::vertex_type& v) { 
    if(v.stuff.efficient)
      vertices.push_back(v.value.prototype());
    return false;
  }
};

// This is a class for allocating a color to each graph component in a
// smart way.
struct Color {
  double r,g,b;
};

class Colormap {
private:
  std::map<unsigned int, Color> color_of;
  std::map<unsigned int, Color> tmp;

  Color new_color() {
    double a = uniform(0,1);
    double b = uniform(0,1);
    int idx = (int)(uniform(0,3));
    if(idx == 0) return {1.0,   a,   b};
    if(idx == 1) return {  a, 1.0,   b};
    else         return {  a,   b, 1.0};
  }

public:
  
  void remap() {
    tmp = color_of;
    color_of.clear();
  }
  
  void allocate(unsigned int label) {
    auto existing = tmp.find(label);
    if(existing != tmp.end())
      color_of[label] = existing->second;
    else
      color_of[label] = new_color();
  }
  
  Color operator()(unsigned int label) {
    return color_of[label];
  }
};

// This class helps to register marker idfs and clean unused ones.
class MarkerIdfs {
private:

  std::map<int,bool> idf_in_use;

public:

  void reset() {
    for(auto& key_val : idf_in_use) key_val.second = false;
  }

  void use(int idf) {
    idf_in_use[idf] = true;
  }

  void cleanup(ros::Publisher& pub) {
    std::vector<int> unused;
    visualization_msgs::Marker marker;

    marker.header.frame_id = "/odom";
    marker.header.stamp = ros::Time();
    marker.ns = "gngt";
    marker.action = visualization_msgs::Marker::DELETE;
    
    for(auto& key_val : idf_in_use)
      if(!(key_val.second)) {
	unused.push_back(key_val.first);
	marker.id = key_val.first;
	pub.publish(marker);
      }
    
    for(auto idf : unused)idf_in_use.erase(idf);
  }

};

void draw_vertices(ros::Publisher& pub,const Color color, int id, const std::vector<pcl::PointXYZ>& vertices);
void draw_edges(ros::Publisher& pub, const Color color, int id, const std::vector< std::pair<pcl::PointXYZ,pcl::PointXYZ> >& edges);


#define NB_EPOCHS 10
std::map<unsigned int,GNGT::Component*>  gngt_epoch_cb(
		   ros::Publisher&                         pub,
		   GNGT&                                    gngt,
		   Params&                                  params,
		   UnitSimilarity&                          distance,
		   UnitLearn&                               learn,
		   Evolution&                               evolution,
		   Colormap&                                cmap,
		   MarkerIdfs&                              marker_idfs,
		   pcl::PointCloud<pcl::PointXYZ>&         points) {

  // Update the graph (add or remove egdes and vertices)
  for(int e = 0; e < NB_EPOCHS; ++e) {
    vq2::algo::gngt::open_epoch(gngt,evolution);
    for(auto& pt : points) 
      vq2::algo::gngt::submit(params,gngt,
			      distance,learn,
			      pt,true);
    vq2::algo::gngt::close_epoch(params,gngt,
				 learn,
				 evolution,true);
  }

  
  // Update the connected components and their labels.
  std::map<unsigned int,GNGT::Component*> components;
  gngt.computeConnectedComponents(components,true);
  cmap.remap();
  for(auto& key_val : components) cmap.allocate(key_val.first);

  // Let us now send the graph to Rviz, component by component.
  marker_idfs.reset();
  for(auto& key_val : components) {
    Get get;
    int idf;
    auto label    = key_val.first;
    auto comp_ptr = key_val.second;
    comp_ptr->for_each_vertex(get);
    comp_ptr->for_each_edge(get);
    
    auto color = cmap(label);
    idf = 2*label; draw_vertices(pub,color,idf,get.vertices); marker_idfs.use(idf);
    ++idf;         draw_edges   (pub,color,idf,get.edges);    marker_idfs.use(idf);
  }
  marker_idfs.cleanup(pub);
  return components;
}

void draw_vertices(ros::Publisher& pub, const Color color, int id, const std::vector<pcl::PointXYZ>& vertices) {
  visualization_msgs::Marker marker;

  marker.header.frame_id = "/odom";
  marker.header.stamp = ros::Time();
  marker.ns = "gngt";
  marker.id = id;
  marker.type = visualization_msgs::Marker::SPHERE_LIST;
  marker.action = visualization_msgs::Marker::ADD;
  marker.pose.position.x = 0;
  marker.pose.position.y = 0;
  marker.pose.position.z = 0;
  marker.pose.orientation.x = 0.0;
  marker.pose.orientation.y = 0.0;
  marker.pose.orientation.z = 0.0;
  marker.pose.orientation.w = 1.0;
  marker.scale.x = 0.1;
  marker.scale.y = 0.1;
  marker.scale.z = 0.1;
  marker.color.a = 1.0; 
  marker.color.r = color.r;
  marker.color.g = color.g;
  marker.color.b = color.b;
  
  auto out = std::back_inserter(marker.points);
  for(auto& pt : vertices) {
    geometry_msgs::Point p;
    p.x = pt.x;
    p.y = pt.y;
    *(out++) = p;
  }
  pub.publish(marker);
}

#define EDGE_DARKEN_COEF .5
void draw_edges(ros::Publisher& pub, const Color color, int id, const std::vector< std::pair<pcl::PointXYZ,pcl::PointXYZ> >& edges) {
  visualization_msgs::Marker marker;


  marker.header.frame_id = "/odom";
  //marker.header.stamp = ros::Time();
  marker.header.stamp = ros::Time();
  marker.ns = "gngt";
  marker.id = id;
  marker.type = visualization_msgs::Marker::LINE_LIST;
  marker.action = visualization_msgs::Marker::ADD;
  marker.pose.position.x = 0;
  marker.pose.position.y = 0;
  marker.pose.position.z = 0;
  marker.pose.orientation.x = 0.0;
  marker.pose.orientation.y = 0.0;
  marker.pose.orientation.z = 0.0;
  marker.pose.orientation.w = 1.0;
  marker.scale.x = 0.02;
  marker.scale.y = 0.02;
  marker.scale.z = 0.02;
  marker.color.a = 1.0; 
  marker.color.r = color.r*EDGE_DARKEN_COEF;
  marker.color.g = color.g*EDGE_DARKEN_COEF;
  marker.color.b = color.b*EDGE_DARKEN_COEF;
  
  auto out = std::back_inserter(marker.points);
  for(auto& e : edges) {
    geometry_msgs::Point p;
    p.x = e.first.x;
    p.y = e.first.y;
    *(out++) = p;
    p.x = e.second.x;
    p.y = e.second.y;
    *(out++) = p;
  }
  pub.publish(marker);
}

/***************/

struct algo_data{
  GNGT             gngt;
  Params           params;
  Similarity       distance;
  UnitSimilarity   unit_distance;
  Learn            learn;
  UnitLearn        unit_learn;
  Evolution        evolution;
  Colormap         cmap;
  MarkerIdfs       marker_idfs;
  algo_data()
    : gngt(),
      params(),
      distance(),
      unit_distance(distance),
      learn(),
      unit_learn(learn),
      evolution(params),
      cmap(),
      marker_idfs()
  {}

  algo_data(const algo_data &)=delete;
  algo_data & operator=(const algo_data &)=delete;
  
  algo_data(algo_data &&)=delete;
  algo_data & operator=(algo_data &&)=delete;
  
};

void callbackCluster(const turtle_bot::ArenaPositionsConstPtr& posList,
		     ros::Publisher&   thePub,
		     ros::Publisher&   pubEntities,
		     ros::Publisher&   pubCloud,
		     algo_data&        data){
  
  //struct turtle_wrap t_wrap;
 
  
  pcl::PointCloud<pcl::PointXYZ> points;
  for (int i = 0; i < data.params.nbSamples(); ++i){
    float x = uniform(MINI, MAXI);
    float y = uniform(MINI, MAXI);
    for (int j = 0; j < posList->aps.size(); ++j){
      float theDistance = distanceEuclidienne(x, y, posList->aps[j].x, posList->aps[j].y);
      if (theDistance < SEUIL){
	pcl::PointXYZ point(x, y, 0);
	points.push_back(point);
	break;
      }
    }
  }

  points.header.frame_id = "/odom";
  points.header.stamp = ros::Time::now().toSec();
  pubCloud.publish(points);
  
  turtle_bot::Entity dummy;
  turtle_bot::Entities ents;
  turtle_bot::ArenaPosition pose;
  int min_lbl=INT_MAX; 

  std::map<unsigned int,GNGT::Component*> components = 
     gngt_epoch_cb(thePub,data.gngt,data.params,data.unit_distance,data.unit_learn,data.evolution,data.cmap,data.marker_idfs,points);
   
   for(auto& key_val : components) {
     Get get;
     dummy.label     = key_val.first;
     
     if(dummy.label < min_lbl)
       min_lbl = dummy.label;
     
      auto comp_ptr  = key_val.second;
     comp_ptr->for_each_vertex(get);
     for(auto& v : get.vertices){
       pose.x += v.x;
       pose.y += v.y;
     }
     pose.x /= get.vertices.size();
     pose.y /= get.vertices.size();
     dummy.pose = pose;
     ents.ent.push_back(dummy);
   }
   pubEntities.publish(ents);
}



int main(int argc, char **argv)
{  
  std::srand(std::time(0));

  ros::init(argc, argv, "gngt");
  ros::NodeHandle n;

  algo_data data;

  //ros::Rate loop_rate(100);
  ros::Publisher pubEntities = n.advertise<turtle_bot::Entities> ("/entities", 1);
  ros::Publisher  thePub = n.advertise<visualization_msgs::Marker>("/markers", 0);
  ros::Publisher  pubCloud = n.advertise<pcl::PointCloud<pcl::PointXYZ>>("/Cloud", 0);
  ros::Subscriber theSubCluster = n.subscribe<turtle_bot::ArenaPositions>("/Cluster", 1,
  									  boost::bind(callbackCluster,
  										      _1,
										      boost::ref(thePub),							
										      boost::ref(pubEntities),
										      boost::ref(pubCloud),
										      boost::ref(data)));

  cv::namedWindow("Params GNGT", 1);
  cv::createTrackbar("Age Max", "Params GNGT", &data.params.age_max, 100, NULL);
  cv::createTrackbar("learning rate", "Params GNGT", &data.params.learning_rate, 100, NULL);
  cv::createTrackbar("learning ratio", "Params GNGT", &data.params.learning_ratio, 100, NULL);
  cv::createTrackbar("lambda", "Params GNGT", &data.params.lambdaz, 100, NULL);
  cv::createTrackbar("target", "Params GNGT", &data.params.targetz, 100, NULL);
  cv::createTrackbar("nb samples", "Params GNGT", &data.params.nb_samplez, 100, NULL);
  cv::createTrackbar("low pass coef", "Params GNGT", &data.params.low_pass_coef, 100, NULL);
  cv::createTrackbar("delta", "Params GNGT", &data.params.deltaz, 100, NULL);
  cv::createTrackbar("margin", "Params GNGT", &data.params.marginz, 100, NULL);

  
  ros::Duration(0.1).sleep();
 
  while (ros::ok()) {
    ros::spinOnce();
    cv::waitKey(1);
    /*pcl::PCLPointCloud2 data_2;
    pcl::toPCLPointCloud2 (data, data_2);
    sensor_msgs::PointCloud2 output;
    pcl_conversions::fromPCL(data_2,output);
    output.header.stamp    = ros::Time::now();
    output.header.frame_id = "/odom";*/ // This is the default frame in RViz
    /*ROS_INFO_STREAM("age_max : " << data.params.ageMax() << std::endl <<
		    "learning_rate : " << data.params.learningRate() << std::endl <<
		    "learning_ratio : " << data.params.learningRatio() << std::endl <<
		    "lambdaz : " << data.params.lambda() << std::endl <<
		    "targetz : " << data.params.target() << std::endl <<
		    "nb_samplez : " << data.params.nbSamples() << std::endl <<
		    "low_pass_coef : " << data.params.lowPassCoef() << std::endl <<
		    "deltaz : " << data.params.delta() << std::endl <<
		    "marginz : " << data.params.margin() << std::endl 
		    );*/
    
    ros::Duration(0.1).sleep();
  }
  
  cv::destroyAllWindows();
  return 0;
}


