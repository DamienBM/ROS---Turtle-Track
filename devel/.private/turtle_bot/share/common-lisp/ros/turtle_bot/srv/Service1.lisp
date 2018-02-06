; Auto-generated. Do not edit!


(cl:in-package turtle_bot-srv)


;//! \htmlinclude Service1-request.msg.html

(cl:defclass <Service1-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass Service1-request (<Service1-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Service1-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Service1-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-srv:<Service1-request> is deprecated: use turtle_bot-srv:Service1-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <Service1-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-srv:pose-val is deprecated.  Use turtle_bot-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Service1-request>) ostream)
  "Serializes a message object of type '<Service1-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Service1-request>) istream)
  "Deserializes a message object of type '<Service1-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Service1-request>)))
  "Returns string type for a service object of type '<Service1-request>"
  "turtle_bot/Service1Request")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Service1-request)))
  "Returns string type for a service object of type 'Service1-request"
  "turtle_bot/Service1Request")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Service1-request>)))
  "Returns md5sum for a message object of type '<Service1-request>"
  "e87f7e096f6ac40f3431dc20e102fbb8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Service1-request)))
  "Returns md5sum for a message object of type 'Service1-request"
  "e87f7e096f6ac40f3431dc20e102fbb8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Service1-request>)))
  "Returns full string definition for message of type '<Service1-request>"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Service1-request)))
  "Returns full string definition for message of type 'Service1-request"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Service1-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Service1-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Service1-request
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude Service1-response.msg.html

(cl:defclass <Service1-response> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass Service1-response (<Service1-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Service1-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Service1-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name turtle_bot-srv:<Service1-response> is deprecated: use turtle_bot-srv:Service1-response instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <Service1-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader turtle_bot-srv:pose-val is deprecated.  Use turtle_bot-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Service1-response>) ostream)
  "Serializes a message object of type '<Service1-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Service1-response>) istream)
  "Deserializes a message object of type '<Service1-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Service1-response>)))
  "Returns string type for a service object of type '<Service1-response>"
  "turtle_bot/Service1Response")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Service1-response)))
  "Returns string type for a service object of type 'Service1-response"
  "turtle_bot/Service1Response")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Service1-response>)))
  "Returns md5sum for a message object of type '<Service1-response>"
  "e87f7e096f6ac40f3431dc20e102fbb8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Service1-response)))
  "Returns md5sum for a message object of type 'Service1-response"
  "e87f7e096f6ac40f3431dc20e102fbb8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Service1-response>)))
  "Returns full string definition for message of type '<Service1-response>"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Service1-response)))
  "Returns full string definition for message of type 'Service1-response"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Service1-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Service1-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Service1-response
    (cl:cons ':pose (pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Service1)))
  'Service1-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Service1)))
  'Service1-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Service1)))
  "Returns string type for a service object of type '<Service1>"
  "turtle_bot/Service1")