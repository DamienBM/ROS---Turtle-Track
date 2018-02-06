;; Auto-generated. Do not edit!


(when (boundp 'turtle_bot::ArenaPositions)
  (if (not (find-package "TURTLE_BOT"))
    (make-package "TURTLE_BOT"))
  (shadow 'ArenaPositions (find-package "TURTLE_BOT")))
(unless (find-package "TURTLE_BOT::ARENAPOSITIONS")
  (make-package "TURTLE_BOT::ARENAPOSITIONS"))

(in-package "ROS")
;;//! \htmlinclude ArenaPositions.msg.html


(defclass turtle_bot::ArenaPositions
  :super ros::object
  :slots (_aps ))

(defmethod turtle_bot::ArenaPositions
  (:init
   (&key
    ((:aps __aps) (let (r) (dotimes (i 0) (push (instance turtle_bot::ArenaPosition :init) r)) r))
    )
   (send-super :init)
   (setq _aps __aps)
   self)
  (:aps
   (&rest __aps)
   (if (keywordp (car __aps))
       (send* _aps __aps)
     (progn
       (if __aps (setq _aps (car __aps)))
       _aps)))
  (:serialization-length
   ()
   (+
    ;; turtle_bot/ArenaPosition[] _aps
    (apply #'+ (send-all _aps :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; turtle_bot/ArenaPosition[] _aps
     (write-long (length _aps) s)
     (dolist (elem _aps)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; turtle_bot/ArenaPosition[] _aps
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _aps (let (r) (dotimes (i n) (push (instance turtle_bot::ArenaPosition :init) r)) r))
     (dolist (elem- _aps)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get turtle_bot::ArenaPositions :md5sum-) "30c3cea8e6a55c2b95a58ae9e7df0e43")
(setf (get turtle_bot::ArenaPositions :datatype-) "turtle_bot/ArenaPositions")
(setf (get turtle_bot::ArenaPositions :definition-)
      "ArenaPosition[] aps
================================================================================
MSG: turtle_bot/ArenaPosition
float64 x
float64 y
")



(provide :turtle_bot/ArenaPositions "30c3cea8e6a55c2b95a58ae9e7df0e43")


