cmake_minimum_required(VERSION 2.8.3)
project(test_opencv)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  image_transport
  cv_bridge
)
find_package(OpenCV)

catkin_package(CATKIN_DEPENDS 
  roscpp
  std_msgs
  image_transport
  cv_bridge
)

include_directories  (${catkin_INCLUDE_DIRS})

add_executable       (test_opencv src/test-opencv.cpp)
target_link_libraries(test_opencv ${catkin_LIBRARIES})
set_property         (TARGET test_opencv APPEND PROPERTY INCLUDE_DIRECTORIES ${OpenCV_INCLUDE_DIRS})
set_property         (TARGET test_opencv APPEND PROPERTY INCLUDE_DIRECTORIES ${catkin_INCLUDE_DIRS})
set_property         (TARGET test_opencv APPEND PROPERTY LINK_LIBRARIES      ${OpenCV_LIBRARIES})


install(TARGETS test_opencv DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})