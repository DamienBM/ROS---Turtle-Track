#include <gaml-libsvm.hpp>
#include <ros/ros.h>
#include <turtle_bot/PanTilts.h>
#include <iostream>
#include <vector>
#include <cmath>
#include <utility>
#include <turtle_bot/Axis.h>
#include <turtle_bot/ArenaPositions.h>
#include <functional>

typedef std::pair<double,double> XY;
typedef double                   Z;
typedef std::pair<XY,Z>          Data;
typedef std::vector<Data>        DataSet;

// x y are stored with 3 nodes...
int nb_nodes_of(const XY& xy) {
  return 3;
}

// ... as follows.
void fill_nodes(const XY& xy,struct svm_node* nodes) {
  nodes[0].index = 1;
  nodes[0].value = xy.first;  // x 
  nodes[1].index = 2;
  nodes[1].value = xy.second; // y
  nodes[2].index = -1;        // end
}


void callback(const turtle_bot::PanTilts::ConstPtr& panTiltList,
	       gaml::libsvm::Predictor<XY,Z> & gX,
		 gaml::libsvm::Predictor<XY,Z> & gY,
		 ros::Publisher & pub){
  turtle_bot::ArenaPositions tab;
  tab.aps.resize(panTiltList->pts.size());
  for (int i = 0; i < (int) panTiltList->pts.size(); i++){
    //std::vector<struct svm_node> nodes;
    struct svm_node nodes[3];
    nodes[0].index = 1;
    nodes[0].value = (panTiltList->pts[i].pan+180)/180 - 1 ;
    nodes[1].index = 2;
    nodes[1].value = (panTiltList->pts[i].tilt + 90) / 45 - 1;
    nodes[2].index = -1;        // end
    tab.aps[i].x = gX.predict(nodes);
    tab.aps[i].y = gY.predict(nodes);
        
  }
  pub.publish(tab); 
}



int main(int argc, char * argv[]) {

  ros::init(argc, argv, "localize");
  ros::NodeHandle nh;
  ros::Publisher pub = nh.advertise<turtle_bot::ArenaPositions>("/ArenaPosition", 1); 
  gaml::libsvm::Predictor<XY,Z> gX(nb_nodes_of, fill_nodes);
  gX.load_model("/usr/users/promo2018/billotmornet_dam/Documents/SIR/ros/ros-ws/src/turtle_bot/src/txt/fX.pred");

  gaml::libsvm::Predictor<XY,Z> gY(nb_nodes_of, fill_nodes);
  gY.load_model("/usr/users/promo2018/billotmornet_dam/Documents/SIR/ros/ros-ws/src/turtle_bot/src/txt/fY.pred");   

  ros::Subscriber currentState = nh.subscribe<turtle_bot::PanTilts>("/visible_bot", 1, std::bind(callback, std::placeholders::_1, std::ref(gX), std::ref(gY), std::ref(pub)));
  //ros::Subscriber currentState = nh.subscribe("/visible_bot", 1, &callback);
  ros::spin();
  
  return 0;
}
