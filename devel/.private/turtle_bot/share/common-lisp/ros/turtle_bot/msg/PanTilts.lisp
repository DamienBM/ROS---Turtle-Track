; Auto-generated. Do not edit!


(cl:in-package turtle_bot-msg)


;//! \htmlinclude PanTilts.msg.html

(cl:defclass <PanTilts> (roslisp-msg-protocol:ros-message)
  ((pts
    :reader pts
    :initarg :pts
    :type (cl:vector turtle_bot-msg:PanTilt)
   :initform (cl:make-array 0 :element-type 'turtle_bot-msg:PanTilt :initial-element (cl:make-instance 'turtle_bot-msg:PanTilt))))
)

(cl:defclass PanTilts (<PanTilts>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PanTilts>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PanTilts)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-msg:<PanTilts> is deprecated: use turtle_bot-msg:PanTilts instead.")))

(cl:ensure-generic-function 'pts-val :lambda-list '(m))
(cl:defmethod pts-val ((m <PanTilts>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-msg:pts-val is deprecated.  Use turtle_bot-msg:pts instead.")
  (pts m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PanTilts>) ostream)
  "Serializes a message object of type '<PanTilts>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pts))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pts))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PanTilts>) istream)
  "Deserializes a message object of type '<PanTilts>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pts) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pts)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'turtle_bot-msg:PanTilt))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PanTilts>)))
  "Returns string type for a message object of type '<PanTilts>"
  "turtle_bot/PanTilts")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PanTilts)))
  "Returns string type for a message object of type 'PanTilts"
  "turtle_bot/PanTilts")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PanTilts>)))
  "Returns md5sum for a message object of type '<PanTilts>"
  "f0e1ea58904b4e3619dccf3c18f43f66")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PanTilts)))
  "Returns md5sum for a message object of type 'PanTilts"
  "f0e1ea58904b4e3619dccf3c18f43f66")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PanTilts>)))
  "Returns full string definition for message of type '<PanTilts>"
  (cl:format cl:nil "PanTilt[] pts~%================================================================================~%MSG: turtle_bot/PanTilt~%float64 pan~%float64 tilt~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PanTilts)))
  "Returns full string definition for message of type 'PanTilts"
  (cl:format cl:nil "PanTilt[] pts~%================================================================================~%MSG: turtle_bot/PanTilt~%float64 pan~%float64 tilt~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PanTilts>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pts) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PanTilts>))
  "Converts a ROS message object to a list"
  (cl:list 'PanTilts
    (cl:cons ':pts (pts msg))
))
