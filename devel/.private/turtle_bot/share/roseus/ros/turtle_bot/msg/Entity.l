;; Auto-generated. Do not edit!


(when (boundp 'turtle_bot::Entity)
  (if (not (find-package "TURTLE_BOT"))
    (make-package "TURTLE_BOT"))
  (shadow 'Entity (find-package "TURTLE_BOT")))
(unless (find-package "TURTLE_BOT::ENTITY")
  (make-package "TURTLE_BOT::ENTITY"))

(in-package "ROS")
;;//! \htmlinclude Entity.msg.html


(defclass turtle_bot::Entity
  :super ros::object
  :slots (_label _pose ))

(defmethod turtle_bot::Entity
  (:init
   (&key
    ((:label __label) 0)
    ((:pose __pose) (instance turtle_bot::ArenaPosition :init))
    )
   (send-super :init)
   (setq _label (round __label))
   (setq _pose __pose)
   self)
  (:label
   (&optional __label)
   (if __label (setq _label __label)) _label)
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
    ;; uint16 _label
    2
    ;; turtle_bot/ArenaPosition _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _label
       (write-word _label s)
     ;; turtle_bot/ArenaPosition _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _label
     (setq _label (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; turtle_bot/ArenaPosition _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(setf (get turtle_bot::Entity :md5sum-) "5179d64c5df761205b0c7adb36fa91b0")
(setf (get turtle_bot::Entity :datatype-) "turtle_bot/Entity")
(setf (get turtle_bot::Entity :definition-)
      "uint16 label
ArenaPosition pose
================================================================================
MSG: turtle_bot/ArenaPosition
float64 x
float64 y
")



(provide :turtle_bot/Entity "5179d64c5df761205b0c7adb36fa91b0")


