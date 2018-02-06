;; Auto-generated. Do not edit!


(when (boundp 'turtle_bot::Record)
  (if (not (find-package "TURTLE_BOT"))
    (make-package "TURTLE_BOT"))
  (shadow 'Record (find-package "TURTLE_BOT")))
(unless (find-package "TURTLE_BOT::RECORD")
  (make-package "TURTLE_BOT::RECORD"))
(unless (find-package "TURTLE_BOT::RECORDREQUEST")
  (make-package "TURTLE_BOT::RECORDREQUEST"))
(unless (find-package "TURTLE_BOT::RECORDRESPONSE")
  (make-package "TURTLE_BOT::RECORDRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass turtle_bot::RecordRequest
  :super ros::object
  :slots (_req ))

(defmethod turtle_bot::RecordRequest
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

(defclass turtle_bot::RecordResponse
  :super ros::object
  :slots (_resp ))

(defmethod turtle_bot::RecordResponse
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

(defclass turtle_bot::Record
  :super ros::object
  :slots ())

(setf (get turtle_bot::Record :md5sum-) "ee74d6e9b57dcb99004ef8e8015741c5")
(setf (get turtle_bot::Record :datatype-) "turtle_bot/Record")
(setf (get turtle_bot::Record :request) turtle_bot::RecordRequest)
(setf (get turtle_bot::Record :response) turtle_bot::RecordResponse)

(defmethod turtle_bot::RecordRequest
  (:response () (instance turtle_bot::RecordResponse :init)))

(setf (get turtle_bot::RecordRequest :md5sum-) "ee74d6e9b57dcb99004ef8e8015741c5")
(setf (get turtle_bot::RecordRequest :datatype-) "turtle_bot/RecordRequest")
(setf (get turtle_bot::RecordRequest :definition-)
      "std_msgs/Empty req

================================================================================
MSG: std_msgs/Empty
---
std_msgs/Empty resp

================================================================================
MSG: std_msgs/Empty
")

(setf (get turtle_bot::RecordResponse :md5sum-) "ee74d6e9b57dcb99004ef8e8015741c5")
(setf (get turtle_bot::RecordResponse :datatype-) "turtle_bot/RecordResponse")
(setf (get turtle_bot::RecordResponse :definition-)
      "std_msgs/Empty req

================================================================================
MSG: std_msgs/Empty
---
std_msgs/Empty resp

================================================================================
MSG: std_msgs/Empty
")



(provide :turtle_bot/Record "ee74d6e9b57dcb99004ef8e8015741c5")


