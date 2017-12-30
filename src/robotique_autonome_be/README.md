In order to execute the autonomous exploration of the environment, you must:

1- start roscore
2- start VREP and play the scene
3- roslaunch robotique_autonome_be move_base.launch
The previous step executes the gmapping node for the SLAM as well as the navigation stack for planning and executing an action
4- rosrun robotique_autonome_be pioneer_explorer.py

This will execute the exploration of the environment
You can visualize the map, plan, location of the robot within RVIZ.