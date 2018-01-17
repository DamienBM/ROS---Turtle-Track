#include <ros/ros.h>
#include <turtle_bot/PanTilts.h>
#include <iostream>
#include <vector>
#include <cmath>
#include <utility>
#include <turtle_bot/Axis.h>
#include <turtle_bot/Mode.h>


turtle_bot::Axis theCurrState;
turtle_bot::Axis theDesireState;
turtle_bot::PanTilts g_tbList;
bool isMoving = false;
bool camera_available = false;
std::string chosenMode="search";
std::vector<std::pair<double, double> > positionsScan{  {-45,-25},
                                                        {0, -25},
							{45, -25},
							{45, -45},
							{0, -45},
							{-45, -45},
							{-45, -65},
							{0, -65},
							{45, -65}};
int compteur = 0;

bool mode_callback(turtle_bot::Mode::Request& request, turtle_bot::Mode::Response& response){
  chosenMode = request.mode;
  return true;
}

void theModeCallback(turtle_bot::PanTilts tbList){
  g_tbList.pts.resize(tbList.pts.size());
  g_tbList.pts.clear();
  g_tbList.pts.assign(tbList.pts.begin(),tbList.pts.end());
}

void modeUpdate(ros::Publisher & pub){
  
  if (isMoving && !camera_available)
    return;
  
  if (chosenMode ==  "search"){
    if (!g_tbList.pts.empty()){
      chosenMode = "track";
    }
  }
    
  else if (chosenMode == "scan"){
    camera_available = false; 
    std::pair<double, double> pos = positionsScan[compteur];
    theDesireState.pan = pos.first;
    theDesireState.tilt = pos.second; 
    compteur++;
    compteur%=9;

    pub.publish(theDesireState);
    isMoving = true;
  }

  else if (chosenMode == "track"){
    camera_available = false;
    turtle_bot::Axis thePan(theCurrState);
    std::pair<double, double> thePair;
    try{
      double dist = 1000000000000;
      for(auto ptr = g_tbList.pts.begin(); ptr != g_tbList.pts.end(); ptr++){
	if (dist >= ((ptr->pan - theCurrState.pan)*(ptr->pan - theCurrState.pan)
		     + (ptr->tilt - theCurrState.tilt)*(ptr->tilt - theCurrState.tilt))){
	  dist = (ptr->pan - theCurrState.pan)*(ptr->pan - theCurrState.pan)
	    + (ptr->tilt - theCurrState.tilt)*(ptr->tilt - theCurrState.tilt);
	  theDesireState.pan  = ptr->pan;
	  theDesireState.tilt = ptr->tilt;
	}
	      
      }
    }catch (std::exception& e) {
      return;
    }

    theDesireState.autofocus = true;
    pub.publish(theDesireState);
    isMoving = true;
            
  }

  else
    chosenMode = "search";
     
}


void theStateCallback(const turtle_bot::Axis & theState){
  camera_available = true;
  if (((theDesireState.pan - theState.pan)*(theDesireState.pan - theState.pan)<10) && ((theDesireState.tilt - theState.tilt)*(theDesireState.tilt - theState.tilt)<10)){
    isMoving = false;
  }  
  theCurrState = theState;
}

int main(int argc, char * argv[]) {
  ros::init(argc, argv, "tracker");
  
  ros::NodeHandle nh;

  ros::ServiceServer ServiceMode = nh.advertiseService<turtle_bot::Mode::Request,turtle_bot::Mode::Response>("Mode_service", mode_callback);

  ros::Subscriber currentState = nh.subscribe("/state", 1, theStateCallback);

  ros::Publisher pub = nh.advertise<turtle_bot::Axis>("/cmd", 1);
  
  ros::Subscriber visible_bot = nh.subscribe("/visible_bot", 1, theModeCallback);

  while (ros::ok()){
      modeUpdate(pub);
      ros::Duration(0.1).sleep();
      ros::spinOnce();
  }
}
