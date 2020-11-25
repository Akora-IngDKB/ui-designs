import 'package:flutter/material.dart';

class Message {
  final String message;
  final TimeOfDay time;
  final bool isFromMe;

  const Message({this.message, this.time, this.isFromMe = false});
}
