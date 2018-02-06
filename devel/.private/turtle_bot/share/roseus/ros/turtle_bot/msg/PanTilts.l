;; Auto-generated. Do not edit!


(when (boundp 'turtle_bot::PanTilts)
  (if (not (find-package "TURTLE_BOT"))
    (make-package "TURTLE_BOT"))
  (shadow 'PanTilts (find-package "TURTLE_BOT")))
(unless (find-package "TURTLE_BOT::PANTILTS")
  (make-package "TURTLE_BOT::PANTILTS"))

(in-package "ROS")
;;//! \htmlinclude PanTilts.msg.html


(defclass turtle_bot::PanTilts
  :super ros::object
  :slots (_pts ))

(defmethod turtle_bot::PanTilts
  (:init
   (&key
    ((:pts __pts) (let (r) (dotimes (i 0) (push (instance turtle_bot::PanTilt :init) r)) r))
    )
   (send-super :init)
   (setq _pts __pts)
   self)
  (:pts
   (&rest __pts)
   (if (keywordp (car __pts))
       (send* _pts __pts)
     (progn
       (if __pts (setq _pts (car __pts)))
       _pts)))
  (:serialization-length
   ()
   (+
    ;; turtle_bot/PanTilt[] _pts
    (apply #'+ (send-all _pts :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; turtle_bot/PanTilt[] _pts
     (write-long (length _pts) s)
     (dolist (elem _pts)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; turtle_bot/PanTilt[] _pts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pts (let (r) (dotimes (i n) (push (instance turtle_bot::PanTilt :init) r)) r))
     (dolist (elem- _pts)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get turtle_bot::PanTilts :md5sum-) "f0e1ea58904b4e3619dccf3c18f43f66")
(setf (get turtle_bot::PanTilts :datatype-) "turtle_bot/PanTilts")
(setf (get turtle_bot::PanTilts :definition-)
      "PanTilt[] pts
================================================================================
MSG: turtle_bot/PanTilt
float64 pan
float64 tilt
")



(provide :turtle_bot/PanTilts "f0e1ea58904b4e3619dccf3c18f43f66")


