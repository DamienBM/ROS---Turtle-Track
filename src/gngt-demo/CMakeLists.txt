cmake_minimum_required(VERSION 2.8.3)
project(gngt_demo)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  pcl_conversions 
  pcl_ros
)

find_package(PkgConfig)

pkg_check_modules(VQ2 vq2 REQUIRED)

catkin_package(CATKIN_DEPENDS roscpp rospy std_msgs)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable       (input src/input.cpp)
target_link_libraries(input ${catkin_LIBRARIES})

add_executable       (gngt src/gngt.cpp)
target_link_libraries(gngt ${catkin_LIBRARIES})
set_property         (TARGET gngt APPEND PROPERTY INCLUDE_DIRECTORIES ${VQ2_INCLUDE_DIRS}   )
set_property         (TARGET gngt APPEND PROPERTY COMPILE_FLAGS       ${VQ2_CFLAGS_OTHER}   )
set_property         (TARGET gngt APPEND PROPERTY INCLUDE_DIRECTORIES ${catkin_INCLUDE_DIRS})
set_property         (TARGET gngt APPEND PROPERTY LINK_LIBRARIES      ${VQ2_LIBRARIES}      )

install(TARGETS input gngt         DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})
install(FILES   launch/gngt.launch DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
