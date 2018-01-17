# Install script for directory: /usr/users/promo2018/billotmornet_dam/Documents/SIR/ros/ros-ws/src/turtle_bot/svm/gaml-libsvm/examples

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "binary")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM RENAME "gaml-libsvm-example-001-basics" FILES "/usr/users/promo2018/billotmornet_dam/Documents/SIR/ros/ros-ws/src/turtle_bot/svm/gaml-libsvm/build/examples/example-001-basics")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "binary")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM RENAME "gaml-libsvm-example-002-unsupervized" FILES "/usr/users/promo2018/billotmornet_dam/Documents/SIR/ros/ros-ws/src/turtle_bot/svm/gaml-libsvm/build/examples/example-002-unsupervized")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "binary")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM RENAME "gaml-libsvm-example-003-3D" FILES "/usr/users/promo2018/billotmornet_dam/Documents/SIR/ros/ros-ws/src/turtle_bot/svm/gaml-libsvm/build/examples/example-003-3D")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "binary")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM RENAME "gaml-libsvm-example-004-grid-search" FILES "/usr/users/promo2018/billotmornet_dam/Documents/SIR/ros/ros-ws/src/turtle_bot/svm/gaml-libsvm/build/examples/example-004-grid-search")
endif()

