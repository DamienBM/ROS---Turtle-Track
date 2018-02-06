#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/damien/SIR/ros-ws/src/axis_camera"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/damien/SIR/ros-ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/damien/SIR/ros-ws/install/lib/python2.7/dist-packages:/home/damien/SIR/ros-ws/build/axis_camera/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/damien/SIR/ros-ws/build/axis_camera" \
    "/usr/bin/python" \
    "/home/damien/SIR/ros-ws/src/axis_camera/setup.py" \
    build --build-base "/home/damien/SIR/ros-ws/build/axis_camera" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/damien/SIR/ros-ws/install" --install-scripts="/home/damien/SIR/ros-ws/install/bin"
