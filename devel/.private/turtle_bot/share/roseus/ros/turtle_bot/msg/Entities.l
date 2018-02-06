;; Auto-generated. Do not edit!


(when (boundp 'turtle_bot::Entities)
  (if (not (find-package "TURTLE_BOT"))
    (make-package "TURTLE_BOT"))
  (shadow 'Entities (find-package "TURTLE_BOT")))
(unless (find-package "TURTLE_BOT::ENTITIES")
  (make-package "TURTLE_BOT::ENTITIES"))

(in-package "ROS")
;;//! \htmlinclude Entities.msg.html


(defclass turtle_bot::Entities
  :super ros::object
  :slots (_ent ))

(defmethod turtle_bot::Entities
  (:init
   (&key
    ((:ent __ent) (let (r) (dotimes (i 0) (push (instance turtle_bot::Entity :init) r)) r))
    )
   (send-super :init)
   (setq _ent __ent)
   self)
  (:ent
   (&rest __ent)
   (if (keywordp (car __ent))
       (send* _ent __ent)
     (progn
       (if __ent (setq _ent (car __ent)))
       _ent)))
  (:serialization-length
   ()
   (+
    ;; turtle_bot/Entity[] _ent
    (apply #'+ (send-all _ent :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; turtle_bot/Entity[] _ent
     (write-long (length _ent) s)
     (dolist (elem _ent)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; turtle_bot/Entity[] _ent
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ent (let (r) (dotimes (i n) (push (instance turtle_bot::Entity :init) r)) r))
     (dolist (elem- _ent)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get turtle_bot::Entities :md5sum-) "59cc75e3d58b35a8ddd076389f747687")
(setf (get turtle_bot::Entities :datatype-) "turtle_bot/Entities")
(setf (get turtle_bot::Entities :definition-)
      "Entity[] ent
================================================================================
MSG: turtle_bot/Entity
uint16 label
ArenaPosition pose
================================================================================
MSG: turtle_bot/ArenaPosition
float64 x
float64 y
")



(provide :turtle_bot/Entities "59cc75e3d58b35a8ddd076389f747687")


