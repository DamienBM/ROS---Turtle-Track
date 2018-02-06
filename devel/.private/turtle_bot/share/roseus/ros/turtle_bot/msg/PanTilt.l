;; Auto-generated. Do not edit!


(when (boundp 'turtle_bot::PanTilt)
  (if (not (find-package "TURTLE_BOT"))
    (make-package "TURTLE_BOT"))
  (shadow 'PanTilt (find-package "TURTLE_BOT")))
(unless (find-package "TURTLE_BOT::PANTILT")
  (make-package "TURTLE_BOT::PANTILT"))

(in-package "ROS")
;;//! \htmlinclude PanTilt.msg.html


(defclass turtle_bot::PanTilt
  :super ros::object
  :slots (_pan _tilt ))

(defmethod turtle_bot::PanTilt
  (:init
   (&key
    ((:pan __pan) 0.0)
    ((:tilt __tilt) 0.0)
    )
   (send-super :init)
   (setq _pan (float __pan))
   (setq _tilt (float __tilt))
   self)
  (:pan
   (&optional __pan)
   (if __pan (setq _pan __pan)) _pan)
  (:tilt
   (&optional __tilt)
   (if __tilt (setq _tilt __tilt)) _tilt)
  (:serialization-length
   ()
   (+
    ;; float64 _pan
    8
    ;; float64 _tilt
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _pan
       (sys::poke _pan (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _tilt
       (sys::poke _tilt (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _pan
     (setq _pan (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _tilt
     (setq _tilt (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get turtle_bot::PanTilt :md5sum-) "da61f3d6b381bd4af7a066f22fdfa441")
(setf (get turtle_bot::PanTilt :datatype-) "turtle_bot/PanTilt")
(setf (get turtle_bot::PanTilt :definition-)
      "float64 pan
float64 tilt
")



(provide :turtle_bot/PanTilt "da61f3d6b381bd4af7a066f22fdfa441")


