#include <ros/ros.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <time.h>
#include <geometry_msgs/Pose2D.h>
#include <geometry_msgs/PoseArray.h>
#include <turtle_bot/Service1.h>
#include <turtle_bot/Go.h>
#include <turtle_bot/Abort.h>
#include <angles/angles.h>
#include <math.h>
#include <std_msgs/String.h>
#include <sstream>
#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>

#define TOLERANCELIN 0.3
#define TOLERANCEANG 0.6
#define VITESSELIN 1.0
#define VITESSEANG 0.3

#ifndef M_PI
#define M_PI 3.141592
#endif

//not used yet 
//#define BASE_TF "/base_footprint"  // pb: we can't acces to this frame, however, we have acces to odom
#define BASE_TF "/turtle1"
#define WORLD_TF "world"
//#define WORLD_TF "/odom"

bool g_go=true,g_abort=false; //global varaibles for Go & Abort Services

bool transformPose2D(const geometry_msgs::Pose2D& pose_src,
		     std::string source_frame,
		     geometry_msgs::Pose2D& pose_dst,
		     std::string target_frame) {
  
  ros::Time now = ros::Time(0);

  // Build up a geometry_msgs::PoseStamped from a geometry_msgs::Pose2D
  geometry_msgs::PoseStamped pose_src_stamped;
  pose_src_stamped.header.seq = 0;
  pose_src_stamped.header.stamp = now;
  pose_src_stamped.header.frame_id = source_frame;
  pose_src_stamped.pose.position.x = pose_src.x;
  pose_src_stamped.pose.position.y = pose_src.y;
  pose_src_stamped.pose.position.z = 0;
  pose_src_stamped.pose.orientation = tf::createQuaternionMsgFromYaw(pose_src.theta);

  tf::Stamped<tf::Pose> tf_pose_src, tf_pose_dst;
  // Build up a tf::Stamped<Pose> from a geometry_msgs::PoseStamped
  tf::poseStampedMsgToTF(pose_src_stamped, tf_pose_src);
  
  tf::TransformListener tf_listener;
  try {
    // Let us wait for the frame transformation to be avaiable
    
    tf_listener.waitForTransform(source_frame, target_frame, now,  ros::Duration(60.0));
    ROS_INFO("WaitForTransform fct done !");
    
    // And compute the transformation
    tf_listener.transformPose(target_frame, tf_pose_src, tf_pose_dst);
  }
  catch (tf::TransformException ex) {
    ROS_ERROR("%s",ex.what());
    return false;
  }

  double useless_pitch, useless_roll, yaw;
  tf_pose_dst.getBasis().getEulerYPR(yaw, useless_pitch, useless_roll);
  // move the yaw in [-pi, pi]
  yaw = angles::normalize_angle(yaw);

  // Transform the tf::Pose back into the Pose2D
  pose_dst.x = tf_pose_dst.getOrigin().x();
  pose_dst.y = tf_pose_dst.getOrigin().y();
  pose_dst.theta = yaw;

  return true;
}



bool moveTo(const geometry_msgs::Pose2D& target_pose, geometry_msgs::Twist& cmd_vel){
  // CACSSSSSS
  
  cmd_vel.linear.y = 0;
  cmd_vel.linear.z = 0;
  cmd_vel.angular.x = 0;
  cmd_vel.angular.y = 0;
  double dist = sqrt(pow(target_pose.x, 2) + pow(target_pose.y, 2));
  
  if (dist < TOLERANCELIN){
    //you need to turn the robot to have the correct orientation
    cmd_vel.linear.x = 0;
    
    if (fabs(target_pose.theta) > TOLERANCEANG){
    // a little bit of rotation
      cmd_vel.angular.z = copysign(VITESSEANG,target_pose.theta);
    }
    else{
      cmd_vel.angular.z = 0;
      ROS_INFO("Point reached");
      return false;
    }
  }

  else{
    if (target_pose.x == 0){
      cmd_vel.angular.z = copysign(VITESSEANG,target_pose.y);}
    else{
      double angle = atan(target_pose.y / target_pose.x);
 
      if ((target_pose.y > 0) and (target_pose.x < 0))
	angle = angle + M_PI;
      if ((target_pose.y < 0) and (target_pose.x < 0))
	angle = angle - M_PI;

      if (fabs(angle) > TOLERANCEANG){
	cmd_vel.angular.z = copysign(VITESSEANG, angle);
	cmd_vel.linear.x = 0;
      }
      else{
	cmd_vel.linear.x = sqrt(dist)*0.5;  //TODO: faster when far
	cmd_vel.angular.z = 0; 
      }    
    }
  }
  return true;
}

bool move_callback(turtle_bot::Service1::Request& request, ros::Publisher& thePublisher, ros::Publisher& rviz_CurrentPoseStampedGoal_Publisher, turtle_bot::Service1::Response& response){
  geometry_msgs::Pose2D goal = request.pose;
  //geometry_msgs::Pose2D target_pose;
  geometry_msgs::Twist cmd_vel;
  geometry_msgs::PoseStamped current_pose_goal;; //Construct the PoseStamped point for RVIZ
 
  
  // Let us transform the current goal from the world to the 
  // base frame
  transformPose2D(goal, WORLD_TF, response.pose, BASE_TF);

  current_pose_goal.pose.position.x  = goal.x;
  current_pose_goal.pose.position.y  = goal.y;
  current_pose_goal.pose.position.z  = 0;
  current_pose_goal.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(0.0,0.0,goal.theta);
  current_pose_goal.header.seq = 1;
  current_pose_goal.header.stamp = ros::Time::now();
  current_pose_goal.header.frame_id = WORLD_TF;

  if(moveTo(response.pose, cmd_vel)){
    transformPose2D(goal, WORLD_TF, response.pose, BASE_TF);
    

    current_pose_goal.pose.position.x  = goal.x;
    current_pose_goal.pose.position.y  = goal.y;
    current_pose_goal.pose.position.z  = 0;
    current_pose_goal.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw (0.0,0.0,goal.theta);
    current_pose_goal.header.seq = 1;
    current_pose_goal.header.stamp = ros::Time::now();
    current_pose_goal.header.frame_id = WORLD_TF;
    
    rviz_CurrentPoseStampedGoal_Publisher.publish(current_pose_goal);
    thePublisher.publish(cmd_vel);
  }
  
  else
    return false;
  
  return true;
}

bool go_callback (turtle_bot::Go::Request& request, turtle_bot::Go::Response& response){
  std::cout << "Go_callback" << std::endl;
  g_go=false;
  return true;
}

bool abort_callback(turtle_bot::Abort::Request& request, turtle_bot::Abort::Response& response){ g_abort = true;return g_abort;} 



		   
int main(int argc, char  **argv){
  /*
  if(argc != 4) {
    std::cout << "Probleme dans le launch file ! "<< argc << std::endl;
    return -1;
  }
  */
  int i=0;
  //std::string path ="/usr/users/promo2018/billotmornet_dam/Documents/SIR/ros/ros-ws/src/turtle_bot/src/txt/";
  std::string path ="/home/damien/SIR/ros-ws/src/turtle_bot/src/txt/";
  std::string file = argv[1];
  std::string line;
  double x=5.54;
  double y=5.54;
  double theta=0.1;
  bool destination_achieved = true;

  ros::init(argc,argv,"nav_points"); //node name : nav_points
  ros::NodeHandle n;

  
  geometry_msgs::PoseArray pose_array;
  geometry_msgs::Pose tmp_pose;

  
  //ros::Publisher thePublisher = n.advertise<geometry_msgs::Twist>("/mobile_base/commands/velocity", 0); //turtle1/cmd_vel is the topic name
  ros::Publisher thePublisher = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 0);

  ros::Publisher rviz_PoseArray_Publisher = n.advertise<geometry_msgs::PoseArray>("turtle_bot/PoseArray_topic", 0); //PoseArray_topic is the topic name
  
  ros::Publisher rviz_CurrentPoseStampedGoal_Publisher = n.advertise<geometry_msgs::PoseStamped>("turtle_bot/PoseStamped_topic", 0); //PoseStamped_topic is the topic name for RVIZ

  
  ros::ServiceServer go_Service = n.advertiseService<turtle_bot::Go::Request,turtle_bot::Go::Response>("go_bot", go_callback);
  ros::ServiceServer abort_Service = n.advertiseService<turtle_bot::Abort::Request,turtle_bot::Abort::Response>("abort_bot", abort_callback);    
  
  turtle_bot::Service1::Response response;
  //construct request
  turtle_bot::Service1::Request request;

  pose_array.header.seq = 0;
  pose_array.header.frame_id = WORLD_TF;
  pose_array.header.stamp = ros::Time::now();

  path += file; //full path file

  std::cout << path << std::endl;

  std::ifstream file_stream(path);
  std::cout << "bloup" << std::endl;
  ROS_INFO("Wait for Go !");

  while(g_go && ros::ok()) {
    // Wait for Go service
    ros::spinOnce();
  }

  ROS_INFO("Go !");
  std::vector<double> theta_vect;
  
  if(file_stream){  //if file opened correctly
    while(getline(file_stream,line)){
      char * temp;
      temp =  strtok((char*)line.c_str()," ");
      
      tmp_pose.position.x = std::stof(temp);
      temp =  strtok(NULL," ");
      tmp_pose.position.y = std::stof(temp);
      temp =  strtok(NULL," ");
      theta = std::stof(temp);
      theta_vect.push_back(theta);
      tmp_pose.position.z = 0;
      tmp_pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(0.0,0.0,theta);

      pose_array.poses.push_back(tmp_pose);
    }
    file_stream.close();
  }

  else{
    std::cout << "Probleme lors de l'ouverture du fichier 1" << std::endl;
    return -1;
  }

  //Publish the PoseArray to RVIZ here
  /*while(ros::ok())
    rviz_PoseArray_Publisher.publish(pose_array);*/
  
  auto it_theta = theta_vect.begin();
  
  for ( auto iter = pose_array.poses.begin(); iter != pose_array.poses.end(); ++iter,++it_theta){
      request.pose.x = iter->position.x;
      request.pose.y = iter->position.y;
      request.pose.theta = *it_theta;

      ROS_INFO("Ready to move to point : (%f , %f , %f)", iter->position.x, iter->position.y,*it_theta);
      while(move_callback(request, thePublisher, rviz_CurrentPoseStampedGoal_Publisher,response)){
	rviz_PoseArray_Publisher.publish(pose_array);
	ros::spinOnce();
	if(g_abort){  //Service Abort
	  std::cout << "Service Abort received !" << std::endl;
	  return -1;
	}
      }
  }

      /***    
  std::ifstream file_stream_part2(path);

  
  
  if(file_stream_part2){  //if file opened correctly
    while(getline(file_stream_part2,line)){
      char * temp;
      temp =  strtok((char*)line.c_str()," ");
      
      x = std::stof(temp);
      temp =  strtok(NULL," ");
      y = std::stof(temp);
      temp =  strtok(NULL," ");
      theta = std::stof(temp);

      request.pose.x = x;
      request.pose.y = y;
      request.pose.theta = theta;

      ROS_INFO("Ready to move to point : (%f , %f , %f)", x,y,theta  );
      while(move_callback(request, thePublisher, rviz_CurrentPoseStampedGoal_Publisher,response)){
	rviz_PoseArray_Publisher.publish(pose_array);
	ros::spinOnce();
	if(g_abort){  //Service Abort
	  std::cout << "Service Abort received !" << std::endl;
	  return -1;
	}
      }
    }
    file_stream_part2.close();
  }
  
  else{
    std::cout << "Probleme lors de l'ouverture du fichier 2" << std::endl;
    return -1;
  }
      ****/
      
  while(ros::ok());

  return 0;
}
