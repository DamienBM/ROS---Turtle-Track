; Auto-generated. Do not edit!


(cl:in-package turtle_bot-msg)


;//! \htmlinclude ArenaPositions.msg.html

(cl:defclass <ArenaPositions> (roslisp-msg-protocol:ros-message)
  ((aps
    :reader aps
    :initarg :aps
    :type (cl:vector turtle_bot-msg:ArenaPosition)
   :initform (cl:make-array 0 :element-type 'turtle_bot-msg:ArenaPosition :initial-element (cl:make-instance 'turtle_bot-msg:ArenaPosition))))
)

(cl:defclass ArenaPositions (<ArenaPositions>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ArenaPositions>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ArenaPositions)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-msg:<ArenaPositions> is deprecated: use turtle_bot-msg:ArenaPositions instead.")))

(cl:ensure-generic-function 'aps-val :lambda-list '(m))
(cl:defmethod aps-val ((m <ArenaPositions>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-msg:aps-val is deprecated.  Use turtle_bot-msg:aps instead.")
  (aps m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ArenaPositions>) ostream)
  "Serializes a message object of type '<ArenaPositions>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'aps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'aps))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ArenaPositions>) istream)
  "Deserializes a message object of type '<ArenaPositions>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'aps) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'aps)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'turtle_bot-msg:ArenaPosition))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ArenaPositions>)))
  "Returns string type for a message object of type '<ArenaPositions>"
  "turtle_bot/ArenaPositions")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ArenaPositions)))
  "Returns string type for a message object of type 'ArenaPositions"
  "turtle_bot/ArenaPositions")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ArenaPositions>)))
  "Returns md5sum for a message object of type '<ArenaPositions>"
  "30c3cea8e6a55c2b95a58ae9e7df0e43")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ArenaPositions)))
  "Returns md5sum for a message object of type 'ArenaPositions"
  "30c3cea8e6a55c2b95a58ae9e7df0e43")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ArenaPositions>)))
  "Returns full string definition for message of type '<ArenaPositions>"
  (cl:format cl:nil "ArenaPosition[] aps~%================================================================================~%MSG: turtle_bot/ArenaPosition~%float64 x~%float64 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ArenaPositions)))
  "Returns full string definition for message of type 'ArenaPositions"
  (cl:format cl:nil "ArenaPosition[] aps~%================================================================================~%MSG: turtle_bot/ArenaPosition~%float64 x~%float64 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ArenaPositions>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'aps) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ArenaPositions>))
  "Converts a ROS message object to a list"
  (cl:list 'ArenaPositions
    (cl:cons ':aps (aps msg))
))
