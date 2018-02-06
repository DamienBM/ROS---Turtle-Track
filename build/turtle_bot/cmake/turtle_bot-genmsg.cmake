# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "turtle_bot: 7 messages, 5 services")

set(MSG_I_FLAGS "-Iturtle_bot:/home/damien/SIR/ros-ws/src/turtle_bot/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Iturtle_bot:/home/damien/SIR/ros-ws/src/turtle_bot/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(turtle_bot_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg" NAME_WE)
add_custom_target(_turtle_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtle_bot" "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg" ""
)

get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPositions.msg" NAME_WE)
add_custom_target(_turtle_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtle_bot" "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPositions.msg" "turtle_bot/ArenaPosition"
)

get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Axis.msg" NAME_WE)
add_custom_target(_turtle_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtle_bot" "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Axis.msg" ""
)

get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Mode.srv" NAME_WE)
add_custom_target(_turtle_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtle_bot" "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Mode.srv" "std_msgs/Empty"
)

get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Record.srv" NAME_WE)
add_custom_target(_turtle_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtle_bot" "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Record.srv" "std_msgs/Empty"
)

get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Go.srv" NAME_WE)
add_custom_target(_turtle_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtle_bot" "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Go.srv" "std_msgs/Empty"
)

get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg" NAME_WE)
add_custom_target(_turtle_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtle_bot" "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg" "turtle_bot/ArenaPosition"
)

get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg" NAME_WE)
add_custom_target(_turtle_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtle_bot" "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg" ""
)

get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entities.msg" NAME_WE)
add_custom_target(_turtle_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtle_bot" "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entities.msg" "turtle_bot/ArenaPosition:turtle_bot/Entity"
)

get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Abort.srv" NAME_WE)
add_custom_target(_turtle_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtle_bot" "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Abort.srv" "std_msgs/Empty"
)

get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilts.msg" NAME_WE)
add_custom_target(_turtle_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtle_bot" "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilts.msg" "turtle_bot/PanTilt"
)

get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Service1.srv" NAME_WE)
add_custom_target(_turtle_bot_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "turtle_bot" "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Service1.srv" "geometry_msgs/Pose2D"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
)
_generate_msg_cpp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPositions.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
)
_generate_msg_cpp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Axis.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
)
_generate_msg_cpp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
)
_generate_msg_cpp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
)
_generate_msg_cpp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entities.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg;/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
)
_generate_msg_cpp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilts.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
)

### Generating Services
_generate_srv_cpp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Mode.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
)
_generate_srv_cpp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Abort.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
)
_generate_srv_cpp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Record.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
)
_generate_srv_cpp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Go.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
)
_generate_srv_cpp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Service1.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
)

### Generating Module File
_generate_module_cpp(turtle_bot
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(turtle_bot_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(turtle_bot_generate_messages turtle_bot_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_cpp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPositions.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_cpp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Axis.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_cpp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Mode.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_cpp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Record.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_cpp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Go.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_cpp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_cpp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_cpp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entities.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_cpp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Abort.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_cpp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilts.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_cpp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Service1.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_cpp _turtle_bot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtle_bot_gencpp)
add_dependencies(turtle_bot_gencpp turtle_bot_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtle_bot_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
)
_generate_msg_eus(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPositions.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
)
_generate_msg_eus(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Axis.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
)
_generate_msg_eus(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
)
_generate_msg_eus(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
)
_generate_msg_eus(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entities.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg;/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
)
_generate_msg_eus(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilts.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
)

### Generating Services
_generate_srv_eus(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Mode.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
)
_generate_srv_eus(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Abort.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
)
_generate_srv_eus(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Record.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
)
_generate_srv_eus(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Go.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
)
_generate_srv_eus(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Service1.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
)

### Generating Module File
_generate_module_eus(turtle_bot
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(turtle_bot_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(turtle_bot_generate_messages turtle_bot_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_eus _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPositions.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_eus _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Axis.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_eus _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Mode.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_eus _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Record.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_eus _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Go.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_eus _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_eus _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_eus _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entities.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_eus _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Abort.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_eus _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilts.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_eus _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Service1.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_eus _turtle_bot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtle_bot_geneus)
add_dependencies(turtle_bot_geneus turtle_bot_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtle_bot_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
)
_generate_msg_lisp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPositions.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
)
_generate_msg_lisp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Axis.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
)
_generate_msg_lisp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
)
_generate_msg_lisp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
)
_generate_msg_lisp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entities.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg;/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
)
_generate_msg_lisp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilts.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
)

### Generating Services
_generate_srv_lisp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Mode.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
)
_generate_srv_lisp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Abort.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
)
_generate_srv_lisp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Record.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
)
_generate_srv_lisp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Go.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
)
_generate_srv_lisp(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Service1.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
)

### Generating Module File
_generate_module_lisp(turtle_bot
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(turtle_bot_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(turtle_bot_generate_messages turtle_bot_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_lisp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPositions.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_lisp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Axis.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_lisp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Mode.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_lisp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Record.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_lisp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Go.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_lisp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_lisp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_lisp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entities.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_lisp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Abort.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_lisp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilts.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_lisp _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Service1.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_lisp _turtle_bot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtle_bot_genlisp)
add_dependencies(turtle_bot_genlisp turtle_bot_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtle_bot_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
)
_generate_msg_nodejs(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPositions.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
)
_generate_msg_nodejs(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Axis.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
)
_generate_msg_nodejs(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
)
_generate_msg_nodejs(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
)
_generate_msg_nodejs(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entities.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg;/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
)
_generate_msg_nodejs(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilts.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
)

### Generating Services
_generate_srv_nodejs(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Mode.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
)
_generate_srv_nodejs(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Abort.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
)
_generate_srv_nodejs(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Record.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
)
_generate_srv_nodejs(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Go.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
)
_generate_srv_nodejs(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Service1.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
)

### Generating Module File
_generate_module_nodejs(turtle_bot
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(turtle_bot_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(turtle_bot_generate_messages turtle_bot_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_nodejs _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPositions.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_nodejs _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Axis.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_nodejs _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Mode.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_nodejs _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Record.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_nodejs _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Go.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_nodejs _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_nodejs _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_nodejs _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entities.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_nodejs _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Abort.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_nodejs _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilts.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_nodejs _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Service1.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_nodejs _turtle_bot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtle_bot_gennodejs)
add_dependencies(turtle_bot_gennodejs turtle_bot_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtle_bot_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
)
_generate_msg_py(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPositions.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
)
_generate_msg_py(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Axis.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
)
_generate_msg_py(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
)
_generate_msg_py(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
)
_generate_msg_py(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entities.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg;/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
)
_generate_msg_py(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilts.msg"
  "${MSG_I_FLAGS}"
  "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
)

### Generating Services
_generate_srv_py(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Mode.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
)
_generate_srv_py(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Abort.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
)
_generate_srv_py(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Record.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
)
_generate_srv_py(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Go.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Empty.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
)
_generate_srv_py(turtle_bot
  "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Service1.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose2D.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
)

### Generating Module File
_generate_module_py(turtle_bot
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(turtle_bot_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(turtle_bot_generate_messages turtle_bot_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPosition.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_py _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/ArenaPositions.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_py _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Axis.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_py _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Mode.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_py _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Record.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_py _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Go.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_py _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entity.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_py _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilt.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_py _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/Entities.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_py _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Abort.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_py _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/msg/PanTilts.msg" NAME_WE)
add_dependencies(turtle_bot_generate_messages_py _turtle_bot_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/damien/SIR/ros-ws/src/turtle_bot/srv/Service1.srv" NAME_WE)
add_dependencies(turtle_bot_generate_messages_py _turtle_bot_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(turtle_bot_genpy)
add_dependencies(turtle_bot_genpy turtle_bot_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS turtle_bot_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/turtle_bot
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(turtle_bot_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(turtle_bot_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_srvs_generate_messages_cpp)
  add_dependencies(turtle_bot_generate_messages_cpp std_srvs_generate_messages_cpp)
endif()
if(TARGET turtle_bot_generate_messages_cpp)
  add_dependencies(turtle_bot_generate_messages_cpp turtle_bot_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/turtle_bot
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(turtle_bot_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(turtle_bot_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET std_srvs_generate_messages_eus)
  add_dependencies(turtle_bot_generate_messages_eus std_srvs_generate_messages_eus)
endif()
if(TARGET turtle_bot_generate_messages_eus)
  add_dependencies(turtle_bot_generate_messages_eus turtle_bot_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/turtle_bot
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(turtle_bot_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(turtle_bot_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_srvs_generate_messages_lisp)
  add_dependencies(turtle_bot_generate_messages_lisp std_srvs_generate_messages_lisp)
endif()
if(TARGET turtle_bot_generate_messages_lisp)
  add_dependencies(turtle_bot_generate_messages_lisp turtle_bot_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/turtle_bot
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(turtle_bot_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(turtle_bot_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET std_srvs_generate_messages_nodejs)
  add_dependencies(turtle_bot_generate_messages_nodejs std_srvs_generate_messages_nodejs)
endif()
if(TARGET turtle_bot_generate_messages_nodejs)
  add_dependencies(turtle_bot_generate_messages_nodejs turtle_bot_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/turtle_bot
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(turtle_bot_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(turtle_bot_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_srvs_generate_messages_py)
  add_dependencies(turtle_bot_generate_messages_py std_srvs_generate_messages_py)
endif()
if(TARGET turtle_bot_generate_messages_py)
  add_dependencies(turtle_bot_generate_messages_py turtle_bot_generate_messages_py)
endif()
