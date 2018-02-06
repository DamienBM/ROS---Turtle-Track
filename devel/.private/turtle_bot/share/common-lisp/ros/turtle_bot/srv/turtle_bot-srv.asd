
(cl:in-package :asdf)

(defsystem "turtle_bot-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Abort" :depends-on ("_package_Abort"))
    (:file "_package_Abort" :depends-on ("_package"))
    (:file "Go" :depends-on ("_package_Go"))
    (:file "_package_Go" :depends-on ("_package"))
    (:file "Mode" :depends-on ("_package_Mode"))
    (:file "_package_Mode" :depends-on ("_package"))
    (:file "Record" :depends-on ("_package_Record"))
    (:file "_package_Record" :depends-on ("_package"))
    (:file "Service1" :depends-on ("_package_Service1"))
    (:file "_package_Service1" :depends-on ("_package"))
  ))