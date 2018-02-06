// Auto-generated. Do not edit!

// (in-package turtle_bot.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PanTilt = require('./PanTilt.js');

//-----------------------------------------------------------

class PanTilts {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pts = null;
    }
    else {
      if (initObj.hasOwnProperty('pts')) {
        this.pts = initObj.pts
      }
      else {
        this.pts = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PanTilts
    // Serialize message field [pts]
    // Serialize the length for message field [pts]
    bufferOffset = _serializer.uint32(obj.pts.length, buffer, bufferOffset);
    obj.pts.forEach((val) => {
      bufferOffset = PanTilt.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PanTilts
    let len;
    let data = new PanTilts(null);
    // Deserialize message field [pts]
    // Deserialize array length for message field [pts]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pts = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pts[i] = PanTilt.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 16 * object.pts.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'turtle_bot/PanTilts';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f0e1ea58904b4e3619dccf3c18f43f66';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    PanTilt[] pts
    ================================================================================
    MSG: turtle_bot/PanTilt
    float64 pan
    float64 tilt
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PanTilts(null);
    if (msg.pts !== undefined) {
      resolved.pts = new Array(msg.pts.length);
      for (let i = 0; i < resolved.pts.length; ++i) {
        resolved.pts[i] = PanTilt.Resolve(msg.pts[i]);
      }
    }
    else {
      resolved.pts = []
    }

    return resolved;
    }
};

module.exports = PanTilts;
