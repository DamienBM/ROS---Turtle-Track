; Auto-generated. Do not edit!


(cl:in-package turtle_bot-srv)


;//! \htmlinclude Abort-request.msg.html

(cl:defclass <Abort-request> (roslisp-msg-protocol:ros-message)
  ((req
    :reader req
    :initarg :req
    :type std_msgs-msg:Empty
    :initform (cl:make-instance 'std_msgs-msg:Empty)))
)

(cl:defclass Abort-request (<Abort-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Abort-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Abort-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-srv:<Abort-request> is deprecated: use turtle_bot-srv:Abort-request instead.")))

(cl:ensure-generic-function 'req-val :lambda-list '(m))
(cl:defmethod req-val ((m <Abort-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-srv:req-val is deprecated.  Use turtle_bot-srv:req instead.")
  (req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Abort-request>) ostream)
  "Serializes a message object of type '<Abort-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'req) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Abort-request>) istream)
  "Deserializes a message object of type '<Abort-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'req) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Abort-request>)))
  "Returns string type for a service object of type '<Abort-request>"
  "turtle_bot/AbortRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Abort-request)))
  "Returns string type for a service object of type 'Abort-request"
  "turtle_bot/AbortRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Abort-request>)))
  "Returns md5sum for a message object of type '<Abort-request>"
  "ee74d6e9b57dcb99004ef8e8015741c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Abort-request)))
  "Returns md5sum for a message object of type 'Abort-request"
  "ee74d6e9b57dcb99004ef8e8015741c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Abort-request>)))
  "Returns full string definition for message of type '<Abort-request>"
  (cl:format cl:nil "std_msgs/Empty req~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Abort-request)))
  "Returns full string definition for message of type 'Abort-request"
  (cl:format cl:nil "std_msgs/Empty req~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Abort-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'req))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Abort-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Abort-request
    (cl:cons ':req (req msg))
))
;//! \htmlinclude Abort-response.msg.html

(cl:defclass <Abort-response> (roslisp-msg-protocol:ros-message)
  ((resp
    :reader resp
    :initarg :resp
    :type std_msgs-msg:Empty
    :initform (cl:make-instance 'std_msgs-msg:Empty)))
)

(cl:defclass Abort-response (<Abort-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Abort-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Abort-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-srv:<Abort-response> is deprecated: use turtle_bot-srv:Abort-response instead.")))

(cl:ensure-generic-function 'resp-val :lambda-list '(m))
(cl:defmethod resp-val ((m <Abort-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-srv:resp-val is deprecated.  Use turtle_bot-srv:resp instead.")
  (resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Abort-response>) ostream)
  "Serializes a message object of type '<Abort-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'resp) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Abort-response>) istream)
  "Deserializes a message object of type '<Abort-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'resp) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Abort-response>)))
  "Returns string type for a service object of type '<Abort-response>"
  "turtle_bot/AbortResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Abort-response)))
  "Returns string type for a service object of type 'Abort-response"
  "turtle_bot/AbortResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Abort-response>)))
  "Returns md5sum for a message object of type '<Abort-response>"
  "ee74d6e9b57dcb99004ef8e8015741c5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Abort-response)))
  "Returns md5sum for a message object of type 'Abort-response"
  "ee74d6e9b57dcb99004ef8e8015741c5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Abort-response>)))
  "Returns full string definition for message of type '<Abort-response>"
  (cl:format cl:nil "std_msgs/Empty resp~%~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Abort-response)))
  "Returns full string definition for message of type 'Abort-response"
  (cl:format cl:nil "std_msgs/Empty resp~%~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Abort-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'resp))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Abort-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Abort-response
    (cl:cons ':resp (resp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Abort)))
  'Abort-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Abort)))
  'Abort-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Abort)))
  "Returns string type for a service object of type '<Abort>"
  "turtle_bot/Abort")