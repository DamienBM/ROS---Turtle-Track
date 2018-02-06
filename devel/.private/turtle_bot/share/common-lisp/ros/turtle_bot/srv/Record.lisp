; Auto-generated. Do not edit!


(cl:in-package turtle_bot-srv)


;//! \htmlinclude Record-request.msg.html

(cl:defclass <Record-request> (roslisp-msg-protocol:ros-message)
  ((req
    :reader req
    :initarg :req
    :type std_msgs-msg:Empty
    :initform (cl:make-instance 'std_msgs-msg:Empty)))
)

(cl:defclass Record-request (<Record-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Record-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Record-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-srv:<Record-request> is deprecated: use turtle_bot-srv:Record-request instead.")))

(cl:ensure-generic-function 'req-val :lambda-list '(m))
(cl:defmethod req-val ((m <Record-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-srv:req-val is deprecated.  Use turtle_bot-srv:req instead.")
  (req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Record-request>) ostream)
  "Serializes a message object of type '<Record-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'req) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Record-request>) istream)
  "Deserializes a message object of type '<Record-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'req) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Record-request>)))
  "Returns string type for a service object of type '<Record-request>"
  "turtle_bot/RecordRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Record-request)))
  "Returns string type for a service object of type 'Record-request"
  "turtle_bot/RecordRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Record-request>)))
  "Returns md5sum for a message object of type '<Record-request>"
  "ee74d6e9b57dcb99004ef8e8015741c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Record-request)))
  "Returns md5sum for a message object of type 'Record-request"
  "ee74d6e9b57dcb99004ef8e8015741c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Record-request>)))
  "Returns full string definition for message of type '<Record-request>"
  (cl:format cl:nil "std_msgs/Empty req~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Record-request)))
  "Returns full string definition for message of type 'Record-request"
  (cl:format cl:nil "std_msgs/Empty req~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Record-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'req))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Record-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Record-request
    (cl:cons ':req (req msg))
))
;//! \htmlinclude Record-response.msg.html

(cl:defclass <Record-response> (roslisp-msg-protocol:ros-message)
  ((resp
    :reader resp
    :initarg :resp
    :type std_msgs-msg:Empty
    :initform (cl:make-instance 'std_msgs-msg:Empty)))
)

(cl:defclass Record-response (<Record-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Record-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Record-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-srv:<Record-response> is deprecated: use turtle_bot-srv:Record-response instead.")))

(cl:ensure-generic-function 'resp-val :lambda-list '(m))
(cl:defmethod resp-val ((m <Record-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-srv:resp-val is deprecated.  Use turtle_bot-srv:resp instead.")
  (resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Record-response>) ostream)
  "Serializes a message object of type '<Record-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'resp) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Record-response>) istream)
  "Deserializes a message object of type '<Record-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'resp) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Record-response>)))
  "Returns string type for a service object of type '<Record-response>"
  "turtle_bot/RecordResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Record-response)))
  "Returns string type for a service object of type 'Record-response"
  "turtle_bot/RecordResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Record-response>)))
  "Returns md5sum for a message object of type '<Record-response>"
  "ee74d6e9b57dcb99004ef8e8015741c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Record-response)))
  "Returns md5sum for a message object of type 'Record-response"
  "ee74d6e9b57dcb99004ef8e8015741c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Record-response>)))
  "Returns full string definition for message of type '<Record-response>"
  (cl:format cl:nil "std_msgs/Empty resp~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Record-response)))
  "Returns full string definition for message of type 'Record-response"
  (cl:format cl:nil "std_msgs/Empty resp~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Record-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'resp))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Record-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Record-response
    (cl:cons ':resp (resp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Record)))
  'Record-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Record)))
  'Record-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Record)))
  "Returns string type for a service object of type '<Record>"
  "turtle_bot/Record")