# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "transform_pose: 0 messages, 1 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(transform_pose_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/damien/SIR/ros-ws/src/transform_pose/srv/pose.srv" NAME_WE)
add_custom_target(_transform_pose_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "transform_pose" "/home/damien/SIR/ros-ws/src/transform_pose/srv/pose.srv" "geometry_msgs/Pose2D"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(transform_pose
  "/home/damien/SIR/ros-ws/src/transform_pose/srv/pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/transform_pose
)

### Generating Module File
_generate_module_cpp(transform_pose
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/transform_pose
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(transform_pose_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(transform_pose_generate_messages transform_pose_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/transform_pose/srv/pose.srv" NAME_WE)
add_dependencies(transform_pose_generate_messages_cpp _transform_pose_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(transform_pose_gencpp)
add_dependencies(transform_pose_gencpp transform_pose_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS transform_pose_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(transform_pose
  "/home/damien/SIR/ros-ws/src/transform_pose/srv/pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/transform_pose
)

### Generating Module File
_generate_module_eus(transform_pose
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/transform_pose
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(transform_pose_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(transform_pose_generate_messages transform_pose_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/transform_pose/srv/pose.srv" NAME_WE)
add_dependencies(transform_pose_generate_messages_eus _transform_pose_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(transform_pose_geneus)
add_dependencies(transform_pose_geneus transform_pose_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS transform_pose_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(transform_pose
  "/home/damien/SIR/ros-ws/src/transform_pose/srv/pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/transform_pose
)

### Generating Module File
_generate_module_lisp(transform_pose
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/transform_pose
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(transform_pose_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(transform_pose_generate_messages transform_pose_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/transform_pose/srv/pose.srv" NAME_WE)
add_dependencies(transform_pose_generate_messages_lisp _transform_pose_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(transform_pose_genlisp)
add_dependencies(transform_pose_genlisp transform_pose_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS transform_pose_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(transform_pose
  "/home/damien/SIR/ros-ws/src/transform_pose/srv/pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/transform_pose
)

### Generating Module File
_generate_module_nodejs(transform_pose
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/transform_pose
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(transform_pose_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(transform_pose_generate_messages transform_pose_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/transform_pose/srv/pose.srv" NAME_WE)
add_dependencies(transform_pose_generate_messages_nodejs _transform_pose_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(transform_pose_gennodejs)
add_dependencies(transform_pose_gennodejs transform_pose_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS transform_pose_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(transform_pose
  "/home/damien/SIR/ros-ws/src/transform_pose/srv/pose.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/transform_pose
)

### Generating Module File
_generate_module_py(transform_pose
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/transform_pose
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(transform_pose_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(transform_pose_generate_messages transform_pose_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/transform_pose/srv/pose.srv" NAME_WE)
add_dependencies(transform_pose_generate_messages_py _transform_pose_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(transform_pose_genpy)
add_dependencies(transform_pose_genpy transform_pose_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS transform_pose_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/transform_pose)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/transform_pose
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(transform_pose_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/transform_pose)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/transform_pose
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(transform_pose_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/transform_pose)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/transform_pose
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(transform_pose_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/transform_pose)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/transform_pose
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(transform_pose_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/transform_pose)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/transform_pose\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/transform_pose
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(transform_pose_generate_messages_py geometry_msgs_generate_messages_py)
endif()
