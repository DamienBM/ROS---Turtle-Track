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

class Entity {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.label = null;
      this.pose = null;
    }
    else {
      if (initObj.hasOwnProperty('label')) {
        this.label = initObj.label
      }
      else {
        this.label = 0;
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new ArenaPosition();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Entity
    // Serialize message field [label]
    bufferOffset = _serializer.uint16(obj.label, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = ArenaPosition.serialize(obj.pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Entity
    let len;
    let data = new Entity(null);
    // Deserialize message field [label]
    data.label = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = ArenaPosition.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'turtle_bot/Entity';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5179d64c5df761205b0c7adb36fa91b0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 label
    ArenaPosition pose
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
    const resolved = new Entity(null);
    if (msg.label !== undefined) {
      resolved.label = msg.label;
    }
    else {
      resolved.label = 0
    }

    if (msg.pose !== undefined) {
      resolved.pose = ArenaPosition.Resolve(msg.pose)
    }
    else {
      resolved.pose = new ArenaPosition()
    }

    return resolved;
    }
};

module.exports = Entity;
