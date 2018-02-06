;; Auto-generated. Do not edit!


(when (boundp 'turtle_bot::Mode)
  (if (not (find-package "TURTLE_BOT"))
    (make-package "TURTLE_BOT"))
  (shadow 'Mode (find-package "TURTLE_BOT")))
(unless (find-package "TURTLE_BOT::MODE")
  (make-package "TURTLE_BOT::MODE"))
(unless (find-package "TURTLE_BOT::MODEREQUEST")
  (make-package "TURTLE_BOT::MODEREQUEST"))
(unless (find-package "TURTLE_BOT::MODERESPONSE")
  (make-package "TURTLE_BOT::MODERESPONSE"))

(in-package "ROS")



(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass turtle_bot::ModeRequest
  :super ros::object
  :slots (_mode ))

(defmethod turtle_bot::ModeRequest
  (:init
   (&key
    ((:mode __mode) "")
    )
   (send-super :init)
   (setq _mode (string __mode))
   self)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; string _mode
    4 (length _mode)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _mode
       (write-long (length _mode) s) (princ _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _mode
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mode (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass turtle_bot::ModeResponse
  :super ros::object
  :slots (_resp ))

(defmethod turtle_bot::ModeResponse
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

(defclass turtle_bot::Mode
  :super ros::object
  :slots ())

(setf (get turtle_bot::Mode :md5sum-) "4082b788d7dd11d8b86a9ae69035eccf")
(setf (get turtle_bot::Mode :datatype-) "turtle_bot/Mode")
(setf (get turtle_bot::Mode :request) turtle_bot::ModeRequest)
(setf (get turtle_bot::Mode :response) turtle_bot::ModeResponse)

(defmethod turtle_bot::ModeRequest
  (:response () (instance turtle_bot::ModeResponse :init)))

(setf (get turtle_bot::ModeRequest :md5sum-) "4082b788d7dd11d8b86a9ae69035eccf")
(setf (get turtle_bot::ModeRequest :datatype-) "turtle_bot/ModeRequest")
(setf (get turtle_bot::ModeRequest :definition-)
      "string mode
---
std_msgs/Empty resp

================================================================================
MSG: std_msgs/Empty
")

(setf (get turtle_bot::ModeResponse :md5sum-) "4082b788d7dd11d8b86a9ae69035eccf")
(setf (get turtle_bot::ModeResponse :datatype-) "turtle_bot/ModeResponse")
(setf (get turtle_bot::ModeResponse :definition-)
      "string mode
---
std_msgs/Empty resp

================================================================================
MSG: std_msgs/Empty
")



(provide :turtle_bot/Mode "4082b788d7dd11d8b86a9ae69035eccf")


