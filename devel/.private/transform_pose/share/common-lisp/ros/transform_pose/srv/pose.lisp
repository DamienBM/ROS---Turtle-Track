; Auto-generated. Do not edit!


(cl:in-package transform_pose-srv)


;//! \htmlinclude pose-request.msg.html

(cl:defclass <pose-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass pose-request (<pose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name transform_pose-srv:<pose-request> is deprecated: use transform_pose-srv:pose-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <pose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader transform_pose-srv:pose-val is deprecated.  Use transform_pose-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pose-request>) ostream)
  "Serializes a message object of type '<pose-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pose-request>) istream)
  "Deserializes a message object of type '<pose-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pose-request>)))
  "Returns string type for a service object of type '<pose-request>"
  "transform_pose/poseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pose-request)))
  "Returns string type for a service object of type 'pose-request"
  "transform_pose/poseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pose-request>)))
  "Returns md5sum for a message object of type '<pose-request>"
  "e87f7e096f6ac40f3431dc20e102fbb8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pose-request)))
  "Returns md5sum for a message object of type 'pose-request"
  "e87f7e096f6ac40f3431dc20e102fbb8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pose-request>)))
  "Returns full string definition for message of type '<pose-request>"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pose-request)))
  "Returns full string definition for message of type 'pose-request"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pose-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'pose-request
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude pose-response.msg.html

(cl:defclass <pose-response> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass pose-response (<pose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name transform_pose-srv:<pose-response> is deprecated: use transform_pose-srv:pose-response instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <pose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader transform_pose-srv:pose-val is deprecated.  Use transform_pose-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pose-response>) ostream)
  "Serializes a message object of type '<pose-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pose-response>) istream)
  "Deserializes a message object of type '<pose-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pose-response>)))
  "Returns string type for a service object of type '<pose-response>"
  "transform_pose/poseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pose-response)))
  "Returns string type for a service object of type 'pose-response"
  "transform_pose/poseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pose-response>)))
  "Returns md5sum for a message object of type '<pose-response>"
  "e87f7e096f6ac40f3431dc20e102fbb8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pose-response)))
  "Returns md5sum for a message object of type 'pose-response"
  "e87f7e096f6ac40f3431dc20e102fbb8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pose-response>)))
  "Returns full string definition for message of type '<pose-response>"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pose-response)))
  "Returns full string definition for message of type 'pose-response"
  (cl:format cl:nil "geometry_msgs/Pose2D pose~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pose-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'pose-response
    (cl:cons ':pose (pose msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'pose)))
  'pose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'pose)))
  'pose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pose)))
  "Returns string type for a service object of type '<pose>"
  "transform_pose/pose")