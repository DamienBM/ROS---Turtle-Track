execute_process(COMMAND "/home/damien/SIR/ros-ws/build/axis_camera/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/damien/SIR/ros-ws/build/axis_camera/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
