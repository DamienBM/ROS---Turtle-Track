// Auto-generated. Do not edit!

// (in-package turtle_bot.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ModeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mode = null;
    }
    else {
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ModeRequest
    // Serialize message field [mode]
    bufferOffset = _serializer.string(obj.mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ModeRequest
    let len;
    let data = new ModeRequest(null);
    // Deserialize message field [mode]
    data.mode = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.mode.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtle_bot/ModeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e84dc3ad5dc323bb64f0aca01c2d1eef';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string mode
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ModeRequest(null);
    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = ''
    }

    return resolved;
    }
};

class ModeResponse {
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
    // Serializes a message object of type ModeResponse
    // Serialize message field [resp]
    bufferOffset = std_msgs.msg.Empty.serialize(obj.resp, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ModeResponse
    let len;
    let data = new ModeResponse(null);
    // Deserialize message field [resp]
    data.resp = std_msgs.msg.Empty.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'turtle_bot/ModeResponse';
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
    const resolved = new ModeResponse(null);
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
  Request: ModeRequest,
  Response: ModeResponse,
  md5sum() { return '4082b788d7dd11d8b86a9ae69035eccf'; },
  datatype() { return 'turtle_bot/Mode'; }
};
