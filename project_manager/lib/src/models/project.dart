import 'package:flutter/material.dart' show Color;

class Project {
  final String label;
  final double percentComplete;
  final int hoursProgress;
  final Color color;

  const Project({
    this.label,
    this.percentComplete,
    this.hoursProgress,
    this.color,
  });
}
