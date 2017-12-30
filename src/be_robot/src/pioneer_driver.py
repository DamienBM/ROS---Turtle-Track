#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg      import String
from std_msgs.msg      import Float64
from geometry_msgs.msg import Twist


def callback(msg, pub_d, pub_g):
    #print("x lin =" + (String) msg.linear.x)

    left_speed = Float64()
    right_speed = Float64()

    right_speed.data = (msg.linear.x + msg.angular.x*0.33/2)/0.10
    left_speed.data  = (msg.linear.x - msg.angular.x*0.33/2)/0.10
    
    pub_g.publish(left_speed)
    pub_d.publish(right_speed)
    
def listener():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # node are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    
    pub_g = rospy.Publisher('pioneer_p3dx/leftWheelCommand', Float64, queue_size=0)
    pub_d = rospy.Publisher('pioneer_p3dx/rightWheelCommand', Float64, queue_size=0)

    rospy.Subscriber("cmd_vel", Twist, lambda msg : callback(msg, pub_d, pub_g))

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    rospy.init_node('pioneer_driver', anonymous=True)

    print("Coucou je suis le noeud !")
    
    while not rospy.is_shutdown():
        try:
            listener()
        except rospy.ROSInterruptException:
            pass
        
