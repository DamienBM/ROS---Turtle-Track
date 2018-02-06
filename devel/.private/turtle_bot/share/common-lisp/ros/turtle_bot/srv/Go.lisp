; Auto-generated. Do not edit!


(cl:in-package turtle_bot-srv)


;//! \htmlinclude Go-request.msg.html

(cl:defclass <Go-request> (roslisp-msg-protocol:ros-message)
  ((req
    :reader req
    :initarg :req
    :type std_msgs-msg:Empty
    :initform (cl:make-instance 'std_msgs-msg:Empty)))
)

(cl:defclass Go-request (<Go-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Go-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Go-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-srv:<Go-request> is deprecated: use turtle_bot-srv:Go-request instead.")))

(cl:ensure-generic-function 'req-val :lambda-list '(m))
(cl:defmethod req-val ((m <Go-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-srv:req-val is deprecated.  Use turtle_bot-srv:req instead.")
  (req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Go-request>) ostream)
  "Serializes a message object of type '<Go-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'req) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Go-request>) istream)
  "Deserializes a message object of type '<Go-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'req) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Go-request>)))
  "Returns string type for a service object of type '<Go-request>"
  "turtle_bot/GoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Go-request)))
  "Returns string type for a service object of type 'Go-request"
  "turtle_bot/GoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Go-request>)))
  "Returns md5sum for a message object of type '<Go-request>"
  "ee74d6e9b57dcb99004ef8e8015741c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Go-request)))
  "Returns md5sum for a message object of type 'Go-request"
  "ee74d6e9b57dcb99004ef8e8015741c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Go-request>)))
  "Returns full string definition for message of type '<Go-request>"
  (cl:format cl:nil "std_msgs/Empty req~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Go-request)))
  "Returns full string definition for message of type 'Go-request"
  (cl:format cl:nil "std_msgs/Empty req~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Go-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'req))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Go-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Go-request
    (cl:cons ':req (req msg))
))
;//! \htmlinclude Go-response.msg.html

(cl:defclass <Go-response> (roslisp-msg-protocol:ros-message)
  ((resp
    :reader resp
    :initarg :resp
    :type std_msgs-msg:Empty
    :initform (cl:make-instance 'std_msgs-msg:Empty)))
)

(cl:defclass Go-response (<Go-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Go-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Go-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-srv:<Go-response> is deprecated: use turtle_bot-srv:Go-response instead.")))

(cl:ensure-generic-function 'resp-val :lambda-list '(m))
(cl:defmethod resp-val ((m <Go-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-srv:resp-val is deprecated.  Use turtle_bot-srv:resp instead.")
  (resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Go-response>) ostream)
  "Serializes a message object of type '<Go-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'resp) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Go-response>) istream)
  "Deserializes a message object of type '<Go-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'resp) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Go-response>)))
  "Returns string type for a service object of type '<Go-response>"
  "turtle_bot/GoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Go-response)))
  "Returns string type for a service object of type 'Go-response"
  "turtle_bot/GoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Go-response>)))
  "Returns md5sum for a message object of type '<Go-response>"
  "ee74d6e9b57dcb99004ef8e8015741c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Go-response)))
  "Returns md5sum for a message object of type 'Go-response"
  "ee74d6e9b57dcb99004ef8e8015741c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Go-response>)))
  "Returns full string definition for message of type '<Go-response>"
  (cl:format cl:nil "std_msgs/Empty resp~%~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Go-response)))
  "Returns full string definition for message of type 'Go-response"
  (cl:format cl:nil "std_msgs/Empty resp~%~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Go-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'resp))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Go-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Go-response
    (cl:cons ':resp (resp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Go)))
  'Go-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Go)))
  'Go-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Go)))
  "Returns string type for a service object of type '<Go>"
  "turtle_bot/Go")