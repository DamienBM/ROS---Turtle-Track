;; Auto-generated. Do not edit!


(when (boundp 'turtle_bot::Abort)
  (if (not (find-package "TURTLE_BOT"))
    (make-package "TURTLE_BOT"))
  (shadow 'Abort (find-package "TURTLE_BOT")))
(unless (find-package "TURTLE_BOT::ABORT")
  (make-package "TURTLE_BOT::ABORT"))
(unless (find-package "TURTLE_BOT::ABORTREQUEST")
  (make-package "TURTLE_BOT::ABORTREQUEST"))
(unless (find-package "TURTLE_BOT::ABORTRESPONSE")
  (make-package "TURTLE_BOT::ABORTRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass turtle_bot::AbortRequest
  :super ros::object
  :slots (_req ))

(defmethod turtle_bot::AbortRequest
  (:init
   (&key
    ((:req __req) (instance std_msgs::Empty :init))
    )
   (send-super :init)
   (setq _req __req)
   self)
  (:req
   (&rest __req)
   (if (keywordp (car __req))
       (send* _req __req)
     (progn
       (if __req (setq _req (car __req)))
       _req)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Empty _req
    (send _req :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Empty _req
       (send _req :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Empty _req
     (send _req :deserialize buf ptr-) (incf ptr- (send _req :serialization-length))
   ;;
   self)
  )

(defclass turtle_bot::AbortResponse
  :super ros::object
  :slots (_resp ))

(defmethod turtle_bot::AbortResponse
  (:init
   (&key
    ((:resp __resp) (instance std_msgs::Empty :init))
    )
   (send-super :init)
   (setq _resp __resp)
   self)
  (:resp
   (&rest __resp)
   (if (keywordp (car __resp))
       (send* _resp __resp)
     (progn
       (if __resp (setq _resp (car __resp)))
       _resp)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Empty _resp
    (send _resp :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Empty _resp
       (send _resp :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Empty _resp
     (send _resp :deserialize buf ptr-) (incf ptr- (send _resp :serialization-length))
   ;;
   self)
  )

(defclass turtle_bot::Abort
  :super ros::object
  :slots ())

(setf (get turtle_bot::Abort :md5sum-) "ee74d6e9b57dcb99004ef8e8015741c5")
(setf (get turtle_bot::Abort :datatype-) "turtle_bot/Abort")
(setf (get turtle_bot::Abort :request) turtle_bot::AbortRequest)
(setf (get turtle_bot::Abort :response) turtle_bot::AbortResponse)

(defmethod turtle_bot::AbortRequest
  (:response () (instance turtle_bot::AbortResponse :init)))

(setf (get turtle_bot::AbortRequest :md5sum-) "ee74d6e9b57dcb99004ef8e8015741c5")
(setf (get turtle_bot::AbortRequest :datatype-) "turtle_bot/AbortRequest")
(setf (get turtle_bot::AbortRequest :definition-)
      "std_msgs/Empty req

================================================================================
MSG: std_msgs/Empty
---
std_msgs/Empty resp


================================================================================
MSG: std_msgs/Empty
")

(setf (get turtle_bot::AbortResponse :md5sum-) "ee74d6e9b57dcb99004ef8e8015741c5")
(setf (get turtle_bot::AbortResponse :datatype-) "turtle_bot/AbortResponse")
(setf (get turtle_bot::AbortResponse :definition-)
      "std_msgs/Empty req

================================================================================
MSG: std_msgs/Empty
---
std_msgs/Empty resp


================================================================================
MSG: std_msgs/Empty
")



(provide :turtle_bot/Abort "ee74d6e9b57dcb99004ef8e8015741c5")


