
#include "ros/ros.h"
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>

#include <opencv2/opencv.hpp>

#include <sstream>


// This processes an image and publishes the result.
void on_image(image_transport::Publisher& pub, 
	      const sensor_msgs::ImageConstPtr& msg) {

  cv_bridge::CvImageConstPtr bridge_input;
  try {
    bridge_input = cv_bridge::toCvShare(msg,sensor_msgs::image_encodings::RGB8);
  }
  catch (cv::Exception& e) {
    std::ostringstream errstr;
    errstr << "cv_bridge exception caught: " << e.what();
    return;
  }
  
  const cv::Mat& input  = bridge_input->image;
  cv::Mat        output   (input.rows, input.cols, CV_8UC3);

  unsigned int size           = input.rows * input.cols * 3;
  unsigned char* begin_input  = (unsigned char*)(input.data);
  unsigned char* end_input    = (unsigned char*)(input.data) + size;
  unsigned char* out          = (unsigned char*)(output.data);
  unsigned char* in           = begin_input;

  // This is an efficient way to process each channel in each pixel,
  // with an iterator taste.
  while(in != end_input) *(out++) = 255 - *(in++);

  pub.publish(cv_bridge::CvImage(msg->header, "rgb8", output).toImageMsg());
  // bridge_input is handled by a smart-pointer. No explicit delete needed.
}

int main(int argc, char **argv)
{				
  ros::init(argc, argv, "test_opencv");
  ros::NodeHandle n;
		
  image_transport::ImageTransport it(n);
  image_transport::Publisher      pub = it.advertise("/image_out", 1);
  image_transport::Subscriber     sub = it.subscribe("/image_in", 1, 
						     boost::bind(on_image,
								 boost::ref(pub),
								 _1));
  ros::spin();

  return 0;
}
