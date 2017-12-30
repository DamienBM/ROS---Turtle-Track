#!/usr/bin/env python

import rospy
import tf
import message_filters
from sensor_msgs.msg import JointState
import numpy as np


wheel_distance = 0.165 # m
wheel_radius = 0.100 # m


class Odom:
    
    def __init__(self):
        rospy.init_node("odom")
        self.robot_pose = np.array([0, 0, 0], dtype=float) # x,y,theta
        self.prev_angular_pos = None
        self.prev_stamp = None
        self.broadcaster = tf.TransformBroadcaster()

        self.lw_sub = message_filters.Subscriber("/pioneer_p3dx/leftWheelEncoder", JointState)
        self.rw_sub = message_filters.Subscriber("/pioneer_p3dx/rightWheelEncoder", JointState)
        self.ts = message_filters.TimeSynchronizer([self.lw_sub, self.rw_sub], 10)
        self.ts.registerCallback(self.sync_odom_cb)


    def sync_odom_cb(self, lw, rw):
        angular_pos = [lw.position[0], rw.position[0]]

        if(self.prev_angular_pos == None):
            self.prev_angular_pos = angular_pos
            self.prev_stamp = lw.header.stamp
            return

        
        linear_vel = []
        for p, c in zip(self.prev_angular_pos, angular_pos):
            delta = (c - p) % (2*np.pi)
            if(delta > np.pi):
                delta -= 2*np.pi
            linear_vel.append(wheel_radius * delta * ((lw.header.stamp - self.prev_stamp).to_sec()))
            
        dx = (linear_vel[0] + linear_vel[1]) / 2.0
        dtheta = (linear_vel[1] - linear_vel[0]) / (2.0*wheel_distance)


        x,y,theta = self.robot_pose
        dpose = np.array([dx * np.cos(theta), dx * np.sin(theta), dtheta], dtype=float)
        self.robot_pose += dpose

        self.prev_angular_pos = angular_pos
        self.prev_stamp = lw.header.stamp
          
    def run(self):
        rate = rospy.Rate(10)
        while not rospy.is_shutdown():
            x,y,theta = self.robot_pose
            self.broadcaster.sendTransform((x, y, 0),
                                           tf.transformations.quaternion_from_euler(0, 0, theta),
                                           rospy.Time.now(), "/Pioneer_p3dx", "/Pioneer_p3dx/odom")

            rate.sleep()

  

odom = Odom()
odom.run()






