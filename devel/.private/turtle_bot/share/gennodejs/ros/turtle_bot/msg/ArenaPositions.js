// Auto-generated. Do not edit!

// (in-package turtle_bot.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ArenaPosition = require('./ArenaPosition.js');

//-----------------------------------------------------------

class ArenaPositions {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.aps = null;
    }
    else {
      if (initObj.hasOwnProperty('aps')) {
        this.aps = initObj.aps
      }
      else {
        this.aps = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ArenaPositions
    // Serialize message field [aps]
    // Serialize the length for message field [aps]
    bufferOffset = _serializer.uint32(obj.aps.length, buffer, bufferOffset);
    obj.aps.forEach((val) => {
      bufferOffset = ArenaPosition.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ArenaPositions
    let len;
    let data = new ArenaPositions(null);
    // Deserialize message field [aps]
    // Deserialize array length for message field [aps]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.aps = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.aps[i] = ArenaPosition.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 16 * object.aps.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'turtle_bot/ArenaPositions';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '30c3cea8e6a55c2b95a58ae9e7df0e43';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ArenaPosition[] aps
    ================================================================================
    MSG: turtle_bot/ArenaPosition
    float64 x
    float64 y
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ArenaPositions(null);
    if (msg.aps !== undefined) {
      resolved.aps = new Array(msg.aps.length);
      for (let i = 0; i < resolved.aps.length; ++i) {
        resolved.aps[i] = ArenaPosition.Resolve(msg.aps[i]);
      }
    }
    else {
      resolved.aps = []
    }

    return resolved;
    }
};

module.exports = ArenaPositions;
