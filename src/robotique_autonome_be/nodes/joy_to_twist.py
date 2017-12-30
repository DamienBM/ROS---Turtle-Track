#!/usr/bin/env python 

import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import Joy

def joy_cb(pub, joy_msg):
    linear = joy_msg.axes[1]
    angular = joy_msg.axes[3]
    t = Twist()
    t.linear.x = 3*linear
    t.angular.z = 3*angular
    pub.publish(t)



rospy.init_node('joy_to_twist')
twist_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
joy_sub = rospy.Subscriber('/joy', Joy, lambda x:joy_cb(twist_pub, x))

rate = rospy.Rate(10)
while not rospy.is_shutdown():
    rate.sleep()
