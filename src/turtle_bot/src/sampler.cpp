#include <ros/ros.h>
#include <time.h>
#include <sstream>
#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>
#include <turtle_bot/PanTilts.h>
#include <turtle_bot/Record.h>

bool g_ligne_suivante = false;
bool g_recording = false;
turtle_bot::PanTilts g_tbList;

void thecallback (turtle_bot::PanTilts tbList){
  g_tbList.pts.resize(tbList.pts.size());
  g_tbList.pts.clear();
  g_tbList.pts.assign(tbList.pts.begin(),tbList.pts.end());
}

bool record_callback (turtle_bot::Record::Request req,turtle_bot::Record::Response resp){
  g_ligne_suivante = true;
}

void automate (void){
  typedef enum {WAITING,RECORDING} State;
  static State state = WAITING;

  switch (state){
    
  case WAITING:
    if(g_ligne_suivante){
      g_ligne_suivante = false;
      state = RECORDING;
    }
    else
      state = WAITING;
    break;

  case RECORDING:
    g_recording = true;
    state = WAITING;
    break;
    
  default: break;
  }


}


int main(int argc, char  **argv){

  /*if(argc >= 11) {
    ROS_INFO("Probleme !");
    return -1;
    }*/

  std::string path = "/usr/users/promo2018/billotmornet_dam/Documents/SIR/ros/ros-ws/src/turtle_bot/src/txt/";
  std::string file_in = argv[1];
  std::string file_out = "base_de_donnees.txt"; 
  std::string line;

  ros::init(argc,argv,"sampler");
  ros::NodeHandle n;

  ros::Subscriber theSub = n.subscribe("/visible_bot",1,thecallback);

  file_in = path+file_in;
  file_out = path+file_out;

  ROS_INFO_STREAM("file in : "<<file_in);
  ROS_INFO_STREAM("file out : "<<file_out);

  std::ifstream file_stream_in(file_in,std::ios::in);//lecture
  std::ofstream file_stream_out(file_out,std::ios::out|std::ios::trunc);//écriture

  ros::ServiceServer write_file = n.advertiseService<turtle_bot::Record::Request,turtle_bot::Record::Response>("record_serv",record_callback);

  if(file_stream_in.is_open());
  else {
    ROS_INFO("pb fichier in ouvert");
    return -1;
  }

  if(file_stream_out.is_open());
  else {
    ROS_INFO("pb fichier out ouvert");
    return -1;
  }
  
  while(ros::ok()){
    automate();
    if(g_recording){
      // R/W HERE
      ROS_INFO("R/W");
      if(getline(file_stream_in,line)){
	char * temp;
	temp =  strtok((char*)line.c_str()," ");
	double x(std::stof(temp));
	temp =  strtok(NULL," ");
	double y(std::stof(temp));
	ROS_INFO("Lecture okay !"); //Bon jusque là !
	
	ROS_INFO_STREAM(""<<g_tbList.pts[0].pan);
	
	file_stream_out << g_tbList.pts[0].pan << " " << g_tbList.pts[0].tilt << " " << x << " " << y << std::endl;
	ROS_INFO("Ecriture done !");
      }
      else
	break;

      g_recording = false;
    }
    ros::Duration(0.1).sleep();
    ros::spinOnce();
  }

  file_stream_in.close();
  file_stream_out.close();
  
  return 0;
}
