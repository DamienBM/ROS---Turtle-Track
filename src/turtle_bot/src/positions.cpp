#include <ros/ros.h>
#include <iostream>
#include <string>
#include <cstdlib>
#include <chrono>
#include <thread>
#include <iomanip>
#include <vector>
#include <iterator>
#include <functional>
#include <vector>
#include <utility>
#include <cmath>

#include <boost/bind.hpp>
#include <boost/asio.hpp>

#include <turtle_bot/ArenaPosition.h>
#include <turtle_bot/ArenaPositions.h>

int main(int argc,char* argv[]) {
  
  std::string hostname = argv[1];
  std::string port     = argv[2];
  
  ros::init(argc, argv, "positions");
  ros::NodeHandle nh;

  try {
    turtle_bot::ArenaPositions res;
    turtle_bot::ArenaPosition tab_tmp;
    boost::asio::ip::tcp::iostream socket;
    ros::Publisher thePub = nh.advertise<turtle_bot::ArenaPositions>("/Cluster",1);
    unsigned int nb;

    socket.exceptions(std::ios::failbit | std::ios::badbit | std::ios::eofbit);
    socket.connect(hostname,port);

    socket << "persistance " << 1 << std::endl;
    
    while (ros::ok()){
      //ROS_INFO_STREAM("ROS OK !");
      socket << "get" << std::endl;
      socket >> nb;
      //ROS_INFO_STREAM("nb : "<<nb);
      double x,y;
      for(unsigned int i = 0; i < nb; ++i) {
	socket >> x >> y;
	//ROS_INFO_STREAM("x : "<<x<<" y : "<<y);
	tab_tmp.x = x;
	tab_tmp.y = y;
	res.aps.push_back(tab_tmp);
	//ROS_INFO_STREAM("nb : "<<nb);
      }
      //res.aps.resize(0);
      //ROS_INFO_STREAM("PUBLISHER !");
      thePub.publish(res);
      res.aps.clear();
      ros::Duration(0.1).sleep();
      ros::spinOnce();
    }
 
  }catch(std::exception& e) {
    std::cerr << "Exception caught : " << e.what() << std::endl;
  }

}
