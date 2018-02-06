;; Auto-generated. Do not edit!


(when (boundp 'transform_pose::pose)
  (if (not (find-package "TRANSFORM_POSE"))
    (make-package "TRANSFORM_POSE"))
  (shadow 'pose (find-package "TRANSFORM_POSE")))
(unless (find-package "TRANSFORM_POSE::POSE")
  (make-package "TRANSFORM_POSE::POSE"))
(unless (find-package "TRANSFORM_POSE::POSEREQUEST")
  (make-package "TRANSFORM_POSE::POSEREQUEST"))
(unless (find-package "TRANSFORM_POSE::POSERESPONSE")
  (make-package "TRANSFORM_POSE::POSERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass transform_pose::poseRequest
  :super ros::object
  :slots (_pose ))

(defmethod transform_pose::poseRequest
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

(defclass transform_pose::poseResponse
  :super ros::object
  :slots (_pose ))

(defmethod transform_pose::poseResponse
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

(defclass transform_pose::pose
  :super ros::object
  :slots ())

(setf (get transform_pose::pose :md5sum-) "e87f7e096f6ac40f3431dc20e102fbb8")
(setf (get transform_pose::pose :datatype-) "transform_pose/pose")
(setf (get transform_pose::pose :request) transform_pose::poseRequest)
(setf (get transform_pose::pose :response) transform_pose::poseResponse)

(defmethod transform_pose::poseRequest
  (:response () (instance transform_pose::poseResponse :init)))

(setf (get transform_pose::poseRequest :md5sum-) "e87f7e096f6ac40f3431dc20e102fbb8")
(setf (get transform_pose::poseRequest :datatype-) "transform_pose/poseRequest")
(setf (get transform_pose::poseRequest :definition-)
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

(setf (get transform_pose::poseResponse :md5sum-) "e87f7e096f6ac40f3431dc20e102fbb8")
(setf (get transform_pose::poseResponse :datatype-) "transform_pose/poseResponse")
(setf (get transform_pose::poseResponse :definition-)
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



(provide :transform_pose/pose "e87f7e096f6ac40f3431dc20e102fbb8")


