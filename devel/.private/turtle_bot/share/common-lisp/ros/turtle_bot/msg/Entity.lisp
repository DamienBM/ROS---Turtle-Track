; Auto-generated. Do not edit!


(cl:in-package turtle_bot-msg)


;//! \htmlinclude Entity.msg.html

(cl:defclass <Entity> (roslisp-msg-protocol:ros-message)
  ((label
    :reader label
    :initarg :label
    :type cl:fixnum
    :initform 0)
   (pose
    :reader pose
    :initarg :pose
    :type turtle_bot-msg:ArenaPosition
    :initform (cl:make-instance 'turtle_bot-msg:ArenaPosition)))
)

(cl:defclass Entity (<Entity>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Entity>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Entity)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-msg:<Entity> is deprecated: use turtle_bot-msg:Entity instead.")))

(cl:ensure-generic-function 'label-val :lambda-list '(m))
(cl:defmethod label-val ((m <Entity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-msg:label-val is deprecated.  Use turtle_bot-msg:label instead.")
  (label m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <Entity>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-msg:pose-val is deprecated.  Use turtle_bot-msg:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Entity>) ostream)
  "Serializes a message object of type '<Entity>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'label)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'label)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Entity>) istream)
  "Deserializes a message object of type '<Entity>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'label)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'label)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Entity>)))
  "Returns string type for a message object of type '<Entity>"
  "turtle_bot/Entity")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Entity)))
  "Returns string type for a message object of type 'Entity"
  "turtle_bot/Entity")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Entity>)))
  "Returns md5sum for a message object of type '<Entity>"
  "5179d64c5df761205b0c7adb36fa91b0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Entity)))
  "Returns md5sum for a message object of type 'Entity"
  "5179d64c5df761205b0c7adb36fa91b0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Entity>)))
  "Returns full string definition for message of type '<Entity>"
  (cl:format cl:nil "uint16 label~%ArenaPosition pose~%================================================================================~%MSG: turtle_bot/ArenaPosition~%float64 x~%float64 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Entity)))
  "Returns full string definition for message of type 'Entity"
  (cl:format cl:nil "uint16 label~%ArenaPosition pose~%================================================================================~%MSG: turtle_bot/ArenaPosition~%float64 x~%float64 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Entity>))
  (cl:+ 0
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Entity>))
  "Converts a ROS message object to a list"
  (cl:list 'Entity
    (cl:cons ':label (label msg))
    (cl:cons ':pose (pose msg))
))
