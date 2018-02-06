;; Auto-generated. Do not edit!


(when (boundp 'turtle_bot::Go)
  (if (not (find-package "TURTLE_BOT"))
    (make-package "TURTLE_BOT"))
  (shadow 'Go (find-package "TURTLE_BOT")))
(unless (find-package "TURTLE_BOT::GO")
  (make-package "TURTLE_BOT::GO"))
(unless (find-package "TURTLE_BOT::GOREQUEST")
  (make-package "TURTLE_BOT::GOREQUEST"))
(unless (find-package "TURTLE_BOT::GORESPONSE")
  (make-package "TURTLE_BOT::GORESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass turtle_bot::GoRequest
  :super ros::object
  :slots (_req ))

(defmethod turtle_bot::GoRequest
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

(defclass turtle_bot::GoResponse
  :super ros::object
  :slots (_resp ))

(defmethod turtle_bot::GoResponse
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

(defclass turtle_bot::Go
  :super ros::object
  :slots ())

(setf (get turtle_bot::Go :md5sum-) "ee74d6e9b57dcb99004ef8e8015741c5")
(setf (get turtle_bot::Go :datatype-) "turtle_bot/Go")
(setf (get turtle_bot::Go :request) turtle_bot::GoRequest)
(setf (get turtle_bot::Go :response) turtle_bot::GoResponse)

(defmethod turtle_bot::GoRequest
  (:response () (instance turtle_bot::GoResponse :init)))

(setf (get turtle_bot::GoRequest :md5sum-) "ee74d6e9b57dcb99004ef8e8015741c5")
(setf (get turtle_bot::GoRequest :datatype-) "turtle_bot/GoRequest")
(setf (get turtle_bot::GoRequest :definition-)
      "std_msgs/Empty req

================================================================================
MSG: std_msgs/Empty
---
std_msgs/Empty resp


================================================================================
MSG: std_msgs/Empty
")

(setf (get turtle_bot::GoResponse :md5sum-) "ee74d6e9b57dcb99004ef8e8015741c5")
(setf (get turtle_bot::GoResponse :datatype-) "turtle_bot/GoResponse")
(setf (get turtle_bot::GoResponse :definition-)
      "std_msgs/Empty req

================================================================================
MSG: std_msgs/Empty
---
std_msgs/Empty resp


================================================================================
MSG: std_msgs/Empty
")



(provide :turtle_bot/Go "ee74d6e9b57dcb99004ef8e8015741c5")


