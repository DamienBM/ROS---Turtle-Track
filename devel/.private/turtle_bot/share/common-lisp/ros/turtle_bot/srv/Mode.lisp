; Auto-generated. Do not edit!


(cl:in-package turtle_bot-srv)


;//! \htmlinclude Mode-request.msg.html

(cl:defclass <Mode-request> (roslisp-msg-protocol:ros-message)
  ((mode
    :reader mode
    :initarg :mode
    :type cl:string
    :initform ""))
)

(cl:defclass Mode-request (<Mode-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Mode-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Mode-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-srv:<Mode-request> is deprecated: use turtle_bot-srv:Mode-request instead.")))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <Mode-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-srv:mode-val is deprecated.  Use turtle_bot-srv:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Mode-request>) ostream)
  "Serializes a message object of type '<Mode-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mode))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mode))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Mode-request>) istream)
  "Deserializes a message object of type '<Mode-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mode) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Mode-request>)))
  "Returns string type for a service object of type '<Mode-request>"
  "turtle_bot/ModeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mode-request)))
  "Returns string type for a service object of type 'Mode-request"
  "turtle_bot/ModeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Mode-request>)))
  "Returns md5sum for a message object of type '<Mode-request>"
  "4082b788d7dd11d8b86a9ae69035eccf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Mode-request)))
  "Returns md5sum for a message object of type 'Mode-request"
  "4082b788d7dd11d8b86a9ae69035eccf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Mode-request>)))
  "Returns full string definition for message of type '<Mode-request>"
  (cl:format cl:nil "string mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Mode-request)))
  "Returns full string definition for message of type 'Mode-request"
  (cl:format cl:nil "string mode~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Mode-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'mode))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Mode-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Mode-request
    (cl:cons ':mode (mode msg))
))
;//! \htmlinclude Mode-response.msg.html

(cl:defclass <Mode-response> (roslisp-msg-protocol:ros-message)
  ((resp
    :reader resp
    :initarg :resp
    :type std_msgs-msg:Empty
    :initform (cl:make-instance 'std_msgs-msg:Empty)))
)

(cl:defclass Mode-response (<Mode-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Mode-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Mode-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-srv:<Mode-response> is deprecated: use turtle_bot-srv:Mode-response instead.")))

(cl:ensure-generic-function 'resp-val :lambda-list '(m))
(cl:defmethod resp-val ((m <Mode-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-srv:resp-val is deprecated.  Use turtle_bot-srv:resp instead.")
  (resp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Mode-response>) ostream)
  "Serializes a message object of type '<Mode-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'resp) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Mode-response>) istream)
  "Deserializes a message object of type '<Mode-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'resp) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Mode-response>)))
  "Returns string type for a service object of type '<Mode-response>"
  "turtle_bot/ModeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mode-response)))
  "Returns string type for a service object of type 'Mode-response"
  "turtle_bot/ModeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Mode-response>)))
  "Returns md5sum for a message object of type '<Mode-response>"
  "4082b788d7dd11d8b86a9ae69035eccf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Mode-response)))
  "Returns md5sum for a message object of type 'Mode-response"
  "4082b788d7dd11d8b86a9ae69035eccf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Mode-response>)))
  "Returns full string definition for message of type '<Mode-response>"
  (cl:format cl:nil "std_msgs/Empty resp~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Mode-response)))
  "Returns full string definition for message of type 'Mode-response"
  (cl:format cl:nil "std_msgs/Empty resp~%~%================================================================================~%MSG: std_msgs/Empty~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Mode-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'resp))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Mode-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Mode-response
    (cl:cons ':resp (resp msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Mode)))
  'Mode-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Mode)))
  'Mode-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mode)))
  "Returns string type for a service object of type '<Mode>"
  "turtle_bot/Mode")