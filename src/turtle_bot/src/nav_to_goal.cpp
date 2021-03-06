#include <ros/ros.h>
#include <tf/tf.h>
#include <tf/transform_listener.h>
#include <time.h>
#include <geometry_msgs/Pose2D.h>
#include <turtle_bot/Service1.h>
#include <angles/angles.h>
#include <math.h>
#include <std_msgs/String.h>
#include <sstream>
#include <cstdlib>


//not used yet 
#define BASE_TF "turtle1"
#define WORLD_TF "world"

#ifndef M_PI
#define M_PI 3.141592
#endif


#define TOLERANCELIN 0.3
#define TOLERANCEANG 0.1
#define VITESSELIN 0.8
#define VITESSEANG 0.1

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
    tf_listener.waitForTransform(source_frame, target_frame, now,  ros::Duration(1.0));

    
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
    ROS_INFO("première boucle if");
    cmd_vel.linear.x = 0;
    
    if (fabs(target_pose.theta) > TOLERANCEANG){
    // a little bit of rotation
      ROS_INFO("deuxième boucle if");
      cmd_vel.angular.z = copysign(VITESSEANG,target_pose.theta);
    }
    else{
      cmd_vel.angular.z = 0;
      return false;
    }
  }

  else{
    //ROS_INFO("premiere boucle else");
    if (target_pose.x == 0){
      ROS_INFO("hhhf");
      cmd_vel.angular.z = copysign(VITESSEANG,target_pose.y);}
    else{
      double angle = atan(target_pose.y / target_pose.x);
      ROS_INFO("premier angle%f", angle);
      ROS_INFO("y %f", target_pose.y);
      ROS_INFO("x %f", target_pose.x);
      if ((target_pose.y > 0) and (target_pose.x < 0))
	angle = angle + M_PI;
      if ((target_pose.y < 0) and (target_pose.x < 0))
	angle = angle - M_PI;
      ROS_INFO("deuxième angle %f", fabs(angle));
      if (fabs(angle) > TOLERANCEANG){
	//ROS_INFO("jooh454546514npremière boucle if");
	cmd_vel.angular.z = copysign(VITESSEANG, angle);
	cmd_vel.linear.x = 0;
      }
      else{
	//ROS_INFO("joohnpremière boucle if");
	cmd_vel.linear.x = dist+0.1;  //TODO: faster when far
	cmd_vel.angular.z = 0; 
      }    
    }
  }
  return true;
}

bool move_callback(turtle_bot::Service1::Request& request, ros::Publisher& thePublisher, turtle_bot::Service1::Response& response){
  geometry_msgs::Pose2D goal = request.pose;
  //geometry_msgs::Pose2D target_pose;
  geometry_msgs::Twist cmd_vel;
  
  // Let us transform the current goal from the world to the 
  // base frame
  transformPose2D(goal, WORLD_TF, response.pose, BASE_TF);

  while (moveTo(response.pose, cmd_vel)){
    transformPose2D(goal, WORLD_TF, response.pose, BASE_TF);
    thePublisher.publish(cmd_vel);
  }
  return true;
    
 
  
}

int main(int argc, char  **argv){

  if(argc != 4) {
    std::cout << "Usage : " << argv[0] << " x y theta" << std::endl;
    return -1;
  }
  
  ros::init(argc, argv, "cmd_talker"); //node name  : cmd_talker
  ros::NodeHandle n;
  ros::Publisher thePublisher = n.advertise<geometry_msgs::Twist>("turtle1/cmd_vel", 10); //chatter is the topic name //no queue (hence the 0)
  /*ros::ServiceServer theService = n.advertiseService<turtle_bot::Service1::Request, turtle_bot::Service1::Response>
  ("move_the_bot", std::bind(&move_callback, std::placeholders::_1 , std::ref(thePublisher), std::placeholders::_3));*/
  turtle_bot::Service1::Response response;
  //construct request
  turtle_bot::Service1::Request request;
  request.pose.x  = std::atof(argv[1]);
  request.pose.y  = std::atof(argv[2]);
  request.pose.theta = std::atof(argv[3]);
  ROS_INFO("request created with x= %f", request.pose.x  );
  move_callback(request, thePublisher, response);
  
  ROS_INFO("Ready to move (call nav_to_go)");
  //ros::spin();
  return 0;
}
