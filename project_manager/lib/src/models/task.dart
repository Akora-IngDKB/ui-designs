import 'package:flutter/material.dart';

class Task {
  final String label;
  final String description;
  final Color color;
  final TimeOfDay time;

  const Task({this.label, this.description, this.color, this.time});
}
