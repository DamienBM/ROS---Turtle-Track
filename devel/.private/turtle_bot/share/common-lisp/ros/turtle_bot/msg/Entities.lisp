; Auto-generated. Do not edit!


(cl:in-package turtle_bot-msg)


;//! \htmlinclude Entities.msg.html

(cl:defclass <Entities> (roslisp-msg-protocol:ros-message)
  ((ent
    :reader ent
    :initarg :ent
    :type (cl:vector turtle_bot-msg:Entity)
   :initform (cl:make-array 0 :element-type 'turtle_bot-msg:Entity :initial-element (cl:make-instance 'turtle_bot-msg:Entity))))
)

(cl:defclass Entities (<Entities>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Entities>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Entities)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-msg:<Entities> is deprecated: use turtle_bot-msg:Entities instead.")))

(cl:ensure-generic-function 'ent-val :lambda-list '(m))
(cl:defmethod ent-val ((m <Entities>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-msg:ent-val is deprecated.  Use turtle_bot-msg:ent instead.")
  (ent m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Entities>) ostream)
  "Serializes a message object of type '<Entities>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ent))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ent))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Entities>) istream)
  "Deserializes a message object of type '<Entities>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ent) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ent)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'turtle_bot-msg:Entity))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Entities>)))
  "Returns string type for a message object of type '<Entities>"
  "turtle_bot/Entities")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Entities)))
  "Returns string type for a message object of type 'Entities"
  "turtle_bot/Entities")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Entities>)))
  "Returns md5sum for a message object of type '<Entities>"
  "59cc75e3d58b35a8ddd076389f747687")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Entities)))
  "Returns md5sum for a message object of type 'Entities"
  "59cc75e3d58b35a8ddd076389f747687")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Entities>)))
  "Returns full string definition for message of type '<Entities>"
  (cl:format cl:nil "Entity[] ent~%================================================================================~%MSG: turtle_bot/Entity~%uint16 label~%ArenaPosition pose~%================================================================================~%MSG: turtle_bot/ArenaPosition~%float64 x~%float64 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Entities)))
  "Returns full string definition for message of type 'Entities"
  (cl:format cl:nil "Entity[] ent~%================================================================================~%MSG: turtle_bot/Entity~%uint16 label~%ArenaPosition pose~%================================================================================~%MSG: turtle_bot/ArenaPosition~%float64 x~%float64 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Entities>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ent) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Entities>))
  "Converts a ROS message object to a list"
  (cl:list 'Entities
    (cl:cons ':ent (ent msg))
))
