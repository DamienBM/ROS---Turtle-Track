#!/usr/bin/env python 

import rospy
from std_msgs.msg import Float64
from geometry_msgs.msg import Twist

wheel_distance = 0.165 # m
wheel_radius = 0.100 # m

def twist_callback(lw_pub, rw_pub, twist):
    lw_speed = (twist.linear.x - twist.angular.z * wheel_distance)/wheel_radius
    rw_speed = (twist.linear.x + twist.angular.z * wheel_distance)/wheel_radius
    lw_pub.publish(lw_speed)
    rw_pub.publish(rw_speed)

rospy.init_node('pioneer_driver')

lw_pub = rospy.Publisher("/pioneer_p3dx/leftWheelCommand", Float64, queue_size=1)
rw_pub = rospy.Publisher("/pioneer_p3dx/rightWheelCommand", Float64, queue_size=1)
twist_sub = rospy.Subscriber('/cmd_vel', Twist, lambda t: twist_callback(lw_pub, rw_pub, t))

#rate = rospy.Rate(10)
while not rospy.is_shutdown():
    pass
