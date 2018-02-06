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

#define PERSIST 5
#define SLEEP_TIME 1

boost::asio::ip::tcp::iostream theSocket;

void ArenaCallback(const turtle_bot::ArenaPositions::ConstPtr& msg){
  
  for(auto ptr = msg->aps.begin(); ptr!=msg->aps.end();++ptr) {  
      double x = ptr->x;
      double y = ptr->y;
      theSocket << "put " << x << ' ' << y << std::endl << std::flush;
  }
  
}

int main(int argc,char* argv[]) {

  std::string hostname = argv[1];
  std::string port     = argv[2]; // port is a string like "10000"

  ros::init(argc, argv, "share");
  ros::NodeHandle nh;

  try {
    
      ROS_INFO_STREAM("Try it !");
      // Let us create a stream and handle it with exceptions.
      theSocket.exceptions(std::ios::failbit | std::ios::badbit | std::ios::eofbit);
    
      // Let us connect the client socket.
      theSocket.connect(hostname,port);

      std::cout << "I set persistance to 60s" << std::endl;
      theSocket << "persistance " << PERSIST << std::endl;
    
      ros::Subscriber theSub = nh.subscribe<turtle_bot::ArenaPositions>("/ArenaPosition", 1,ArenaCallback);
      
      while (ros::ok()){
      ros::Duration(SLEEP_TIME).sleep();
      ros::spinOnce();
      }
    
  } catch(std::exception& e) {
    std::cerr << "Exception caught : " << e.what() << std::endl;
    return -1;
  }  
  								    
  return 0;

}
