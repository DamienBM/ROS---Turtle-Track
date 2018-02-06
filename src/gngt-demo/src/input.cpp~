
#include <ctime>
#include <cstdlib>
#include <cmath>

#include "ros/ros.h"

#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>

double                         uniform(double min, double max); 
pcl::PointCloud<pcl::PointXYZ> sampleInput(double t);

int main(int argc, char **argv)
{
  std::srand(std::time(0));

  ros::init(argc, argv, "input");
  ros::NodeHandle n;

  ros::Rate loop_rate(100);
  ros::Publisher pub;
  double t = 0;
  
  pub = n.advertise<sensor_msgs::PointCloud2> ("input", 1);

  while (ros::ok()) {

    
    pcl::PointCloud<pcl::PointXYZ> data = sampleInput(t);

    pcl::PCLPointCloud2 data_2;
    pcl::toPCLPointCloud2 (data, data_2);

    sensor_msgs::PointCloud2 output;
    pcl_conversions::fromPCL(data_2,output);
    output.header.stamp    = ros::Time::now();
    output.header.frame_id = "/map"; // This is the default frame in RViz
    pub.publish(output);
    
    ros::spinOnce();
    ++t;
    loop_rate.sleep();
  }

  return 0;
}


double uniform(double min, double max) {
  return min + (max-min)*(std::rand()/(1.0+RAND_MAX));
}



#define NB_SAMPLES 10000
#define RMIN       .6
#define RMAX       1
#define OMEGA      .003
#define RADIUS     4

struct Crown {
  double center_x;
  double center_y;

  Crown(double x, double y) : center_x(x), center_y(y) {}

  bool inside(const pcl::PointXYZ& pt) {
    double dx = pt.x - center_x;
    double dy = pt.y - center_y;
    double r2 = dx*dx + dy*dy;
    return r2 > RMIN*RMIN && r2 < RMAX*RMAX;
  }
};

struct Square {
  double center_x;
  double center_y;

  Square(double x, double y) : center_x(x), center_y(y) {}

  bool inside(const pcl::PointXYZ& pt) {
    double dx = std::fabs(pt.x - center_x);
    double dy = std::fabs( pt.y - center_y);
    return dx < RMAX && dy < RMAX;
  }
};

pcl::PointCloud<pcl::PointXYZ> sampleInput(double t) {
  pcl::PointCloud<pcl::PointXYZ> samples;
  Crown  c1(RADIUS*std::cos(OMEGA*t), RADIUS*std::sin(OMEGA*t));
  Crown  c2(RADIUS*std::cos(OMEGA*t),                        0);
  Square s1(                       0, RADIUS*std::sin(OMEGA*t));

  samples.clear();
  for(unsigned int i=0; i < NB_SAMPLES; ++i) {
    pcl::PointXYZ pt;
    pt.x = uniform(-RADIUS-RMAX,RADIUS+RMAX);
    pt.y = uniform(-RADIUS-RMAX,RADIUS+RMAX);
    pt.z = 0;
    if(s1.inside(pt) || c1.inside(pt) || c2.inside(pt))
      samples.push_back(pt);
  }
  
  return samples;
}
