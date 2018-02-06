// Auto-generated. Do not edit!

// (in-package turtle_bot.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class RecordRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.req = null;
    }
    else {
      if (initObj.hasOwnProperty('req')) {
        this.req = initObj.req
      }
      else {
        this.req = new std_msgs.msg.Empty();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RecordRequest
    // Serialize message field [req]
    bufferOffset = std_msgs.msg.Empty.serialize(obj.req, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RecordRequest
    let len;
    let data = new RecordRequest(null);
    // Deserialize message field [req]
    data.req = std_msgs.msg.Empty.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtle_bot/RecordRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e470da16a00a40cddd225949002a7485';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Empty req
    
    ================================================================================
    MSG: std_msgs/Empty
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RecordRequest(null);
    if (msg.req !== undefined) {
      resolved.req = std_msgs.msg.Empty.Resolve(msg.req)
    }
    else {
      resolved.req = new std_msgs.msg.Empty()
    }

    return resolved;
    }
};

class RecordResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.resp = null;
    }
    else {
      if (initObj.hasOwnProperty('resp')) {
        this.resp = initObj.resp
      }
      else {
        this.resp = new std_msgs.msg.Empty();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RecordResponse
    // Serialize message field [resp]
    bufferOffset = std_msgs.msg.Empty.serialize(obj.resp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RecordResponse
    let len;
    let data = new RecordResponse(null);
    // Deserialize message field [resp]
    data.resp = std_msgs.msg.Empty.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtle_bot/RecordResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9f2b402bcb064339495caf4c14031ad6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Empty resp
    
    ================================================================================
    MSG: std_msgs/Empty
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RecordResponse(null);
    if (msg.resp !== undefined) {
      resolved.resp = std_msgs.msg.Empty.Resolve(msg.resp)
    }
    else {
      resolved.resp = new std_msgs.msg.Empty()
    }

    return resolved;
    }
};

module.exports = {
  Request: RecordRequest,
  Response: RecordResponse,
  md5sum() { return 'ee74d6e9b57dcb99004ef8e8015741c5'; },
  datatype() { return 'turtle_bot/Record'; }
};
