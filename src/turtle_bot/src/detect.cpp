#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/opencv.hpp>
#include <sensor_msgs/CompressedImage.h>
#include <turtle_bot/PanTilts.h>
#include <opencv2/highgui.hpp>
#include "opencv2/imgcodecs.hpp"
#include "opencv2/imgproc.hpp"
#include <iostream>
#include <vector>
#include <cmath>
#include <utility>
#include <turtle_bot/Axis.h>

int hsv_min_couleur=128;
int hsv_max_couleur=159;
int hsv_min_saturation=87;
int hsv_max_saturation=256;
int hsv_min_luminosite=147;
int hsv_max_luminosite=256;
turtle_bot::Axis theCurrState;
turtle_bot::Axis theDesireState;
bool isMoving = false;



using namespace cv; 

std::pair<double,double> pantiltzoom(double u,   double v,
				     double u0,  double v0,
				     double pan, double tilt, double zoom)
{
  double focale,theta,alpha0,beta0,alpha,beta;
  double x,y,z,X,Y,Z,norme;
  theta=4.189301e+001-6.436043e-003*zoom+2.404497e-007*zoom*zoom;
  focale=u0/std::tan((M_PI*theta/180.0)/2);

  x=u-u0;y=v-v0;z=focale;
  norme=std::sqrt(x*x+y*y+z*z);
  x/=norme;y/=norme;z/=norme;

  beta0=-(M_PI*pan/180.0);
  alpha0=-(M_PI*tilt/180.0);
  X=std::cos(beta0)*x+std::sin(alpha0)*std::sin(beta0)*y-std::cos(alpha0)*std::sin(beta0)*z;
  Y=std::cos(alpha0)*y+std::sin(alpha0)*z;
  Z=std::sin(beta0)*x-std::sin(alpha0)*std::cos(beta0)*y+std::cos(alpha0)*std::cos(beta0)*z;
  alpha=std::atan2(Y,sqrt(X*X+Z*Z));
  beta=-std::atan2(X,Z);

  return {-(180.0*beta/M_PI), -(180.0*alpha/M_PI)};
}




void image_callback(const sensor_msgs::ImageConstPtr& theImage, ros::Publisher & pub2, ros::Publisher& pub) {
  
  ROS_INFO("I'm in the callback function");
  
  //if( !((theFormerState.pan == theCurrState.pan)&&(theFormerState.tilt==theCurrState.tilt)))
  //  return;
  if (isMoving)
   return;
      
  cv_bridge::CvImageConstPtr bridge_input;
  try {
    bridge_input = cv_bridge::toCvShare(theImage,sensor_msgs::image_encodings::RGB8);
  }
  catch (Exception& e) {
    std::ostringstream errstr;
    errstr << "cv_bridge exception caught: " << e.what();
    std::cout << "Exception" << std::endl; 
    ROS_INFO("C'est la merde");
    return;
  }
  
  const Mat& input  = bridge_input->image;

  
  Mat hsvimg;
  Mat detection_img; 
  cvtColor(input, hsvimg, CV_BGR2HSV);
  
  // This is a "red" color range (#2)
  ROS_INFO("Couleur" );
  Scalar hsv_min(hsv_min_couleur, hsv_min_saturation,  hsv_min_luminosite);
  Scalar hsv_max(hsv_max_couleur, hsv_max_saturation,  hsv_max_luminosite);
  //Scalar hsv_min(170, 100,50);
  //Scalar hsv_max(180, 256, 256);
  inRange(hsvimg,hsv_min,hsv_max,detection_img); // select in-range pixels
  imshow("Test", input);
  waitKey(1);
  //(#3)

  
  Mat open_elem  = getStructuringElement(MORPH_RECT,Size(3,3));
  Mat close_elem = getStructuringElement(MORPH_RECT,Size(9,9));
  
  erode (detection_img,detection_img,open_elem);  // opening...
  dilate(detection_img,detection_img,open_elem);  // ...
  dilate(detection_img,detection_img,close_elem); // closing...
  erode (detection_img,detection_img,close_elem); // ...

  //(#4)
  
  imshow("clean-up", detection_img);
  waitKey(1);

  std::vector<std::vector<Point> > contours;
  std::vector<Vec4i> hierarchy;
  findContours(detection_img, contours, hierarchy, RETR_TREE, CHAIN_APPROX_SIMPLE, Point(0, 0) );
  std::vector<std::vector<Point> > contours_poly( contours.size() );
  std::vector<Rect> boundRect( contours.size() );
  std::vector<Point2f>center( contours.size() );
  std::vector<float>radius( contours.size() );
  for( size_t i = 0; i < contours.size(); i++ )
  {
    approxPolyDP( Mat(contours[i]), contours_poly[i], 3, true );
    boundRect[i] = boundingRect( Mat(contours_poly[i]) );
    minEnclosingCircle( contours_poly[i], center[i], radius[i] );
  }

  //start of the display window
  Mat drawing = Mat::zeros(detection_img.size(), CV_8UC3 );
  RNG rng(12345);
  for( size_t i = 0; i< contours.size(); i++ )
  {
    Scalar color = Scalar( rng.uniform(0, 255), rng.uniform(0,255), rng.uniform(0,255) );
    drawContours( drawing, contours_poly, (int)i, color, 1, 8, std::vector<Vec4i>(), 0, Point() );
    rectangle( drawing, boundRect[i].tl(), boundRect[i].br(), color, 2, 8, 0 );
    circle( drawing, center[i], (int)radius[i], color, 2, 8, 0 );
  }
  namedWindow( "Contours", WINDOW_AUTOSIZE );
  imshow( "Contours", drawing );
  //end of the display window

  //(#5)

  /*turtle_bot::Axis thePan(theCurrState);
  std::pair<double, double> thePair;
  try{
  thePair = pantiltzoom(center[0].x, center[0].y,
  			drawing.size().width / 2.0, drawing.size().height / 2.0,
  			(double) theCurrState.pan, (double) theCurrState.tilt, (double) theCurrState.zoom);
  }catch (std::exception& e) {
    return;
  }
  thePan.pan = thePair.first;
  thePan.tilt = thePair.second;  
  //cv::waitKey(0);
  pub2.publish(thePan);
  isMoving = true;
  theDesireState = thePan;*/
  
  //(#6)
  
  turtle_bot::PanTilts visible_bot;
  std::pair<double, double> tempPair;
  turtle_bot::PanTilt test;
  //visible_bot.pts.reserve( center.size() );
  for (auto i = 0; i < center.size(); ++i){
   tempPair = pantiltzoom(center[i].x, center[i].y,drawing.size().width / 2.0, drawing.size().height / 2.0,
			  (double) theCurrState.pan, (double) theCurrState.tilt, (double) theCurrState.zoom);
   test.pan = tempPair.first;
   test.tilt = tempPair.second;
   visible_bot.pts.push_back(test);
  
  }

   pub.publish(visible_bot);
  
}


void callback(int a, void*){}

void theStateCallback(const turtle_bot::Axis & theState){
  if (((theDesireState.pan - theState.pan)*(theDesireState.pan - theState.pan)<100) && ((theDesireState.tilt - theState.tilt)*(theDesireState.tilt - theState.tilt)<100)){
    isMoving = false;
    //cv::waitKey(200);
  }
  theCurrState  = theState;
}

int main(int argc, char * argv[]) {

  ros::init(argc, argv, "detect");
  ros::NodeHandle nh;
  image_transport::ImageTransport it(nh);

  ros::Publisher pub = nh.advertise<turtle_bot::PanTilts>("/visible_bot", 1);  //add the name
  ros::Subscriber currentState = nh.subscribe("/state", 1, theStateCallback);
  ros::Publisher pub2 = nh.advertise<turtle_bot::Axis>("/cmd", 1);
  // track bar creation
  namedWindow("windows", 1);
  createTrackbar("Couleur min", "windows", &hsv_min_couleur, 180, callback);
  createTrackbar("Couleur max", "windows", &hsv_max_couleur, 180, callback);
  createTrackbar("Saturation min", "windows", &hsv_min_saturation, 256, callback);
  createTrackbar("Saturation max", "windows", &hsv_max_saturation, 256, callback);
  createTrackbar("Luminosite min", "windows", &hsv_min_luminosite, 256, callback);
  createTrackbar("Luminosite max", "windows", &hsv_max_luminosite, 256, callback);
  // end

  cv::waitKey(5000); //until here : no pb 
  
  image_transport::Subscriber sub = it.subscribe("/image_in", 1, std::bind(&image_callback, std::placeholders::_1, std::ref(pub2), std::ref(pub)));
  ros::spin();

  cv::destroyAllWindows();
  
  return 0;
  
}
