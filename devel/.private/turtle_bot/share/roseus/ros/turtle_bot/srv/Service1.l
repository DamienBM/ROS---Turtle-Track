;; Auto-generated. Do not edit!


(when (boundp 'turtle_bot::Service1)
  (if (not (find-package "TURTLE_BOT"))
    (make-package "TURTLE_BOT"))
  (shadow 'Service1 (find-package "TURTLE_BOT")))
(unless (find-package "TURTLE_BOT::SERVICE1")
  (make-package "TURTLE_BOT::SERVICE1"))
(unless (find-package "TURTLE_BOT::SERVICE1REQUEST")
  (make-package "TURTLE_BOT::SERVICE1REQUEST"))
(unless (find-package "TURTLE_BOT::SERVICE1RESPONSE")
  (make-package "TURTLE_BOT::SERVICE1RESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass turtle_bot::Service1Request
  :super ros::object
  :slots (_pose ))

(defmethod turtle_bot::Service1Request
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose2D :init))
    )
   (send-super :init)
   (setq _pose __pose)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose2D _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose2D _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose2D _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass turtle_bot::Service1Response
  :super ros::object
  :slots (_pose ))

(defmethod turtle_bot::Service1Response
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose2D :init))
    )
   (send-super :init)
   (setq _pose __pose)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose2D _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose2D _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose2D _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass turtle_bot::Service1
  :super ros::object
  :slots ())

(setf (get turtle_bot::Service1 :md5sum-) "e87f7e096f6ac40f3431dc20e102fbb8")
(setf (get turtle_bot::Service1 :datatype-) "turtle_bot/Service1")
(setf (get turtle_bot::Service1 :request) turtle_bot::Service1Request)
(setf (get turtle_bot::Service1 :response) turtle_bot::Service1Response)

(defmethod turtle_bot::Service1Request
  (:response () (instance turtle_bot::Service1Response :init)))

(setf (get turtle_bot::Service1Request :md5sum-) "e87f7e096f6ac40f3431dc20e102fbb8")
(setf (get turtle_bot::Service1Request :datatype-) "turtle_bot/Service1Request")
(setf (get turtle_bot::Service1Request :definition-)
      "geometry_msgs/Pose2D pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---
geometry_msgs/Pose2D pose


================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
")

(setf (get turtle_bot::Service1Response :md5sum-) "e87f7e096f6ac40f3431dc20e102fbb8")
(setf (get turtle_bot::Service1Response :datatype-) "turtle_bot/Service1Response")
(setf (get turtle_bot::Service1Response :definition-)
      "geometry_msgs/Pose2D pose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---
geometry_msgs/Pose2D pose


================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
")



(provide :turtle_bot/Service1 "e87f7e096f6ac40f3431dc20e102fbb8")


