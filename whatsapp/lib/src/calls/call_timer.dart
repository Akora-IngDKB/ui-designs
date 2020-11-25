import 'dart:async';

import 'package:flutter/material.dart';

class CallTimer extends StatefulWidget {
  final Color textColor;

  CallTimer({this.textColor = Colors.white});

  @override
  _CallTimerState createState() => _CallTimerState();
}

class _CallTimerState extends State<CallTimer> {
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  Timer timer;
  int timeElapsedSecs = 0;

  void evaluateTime() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      timeElapsedSecs++;

      if (mounted) {
        setState(() {
          if (timeElapsedSecs == 60) {
            minutes++;
            timeElapsedSecs = 0;
          }
          if (minutes == 60) {
            hours++;
            minutes = 0;
          }
          if (timeElapsedSecs == 60) {
            minutes++;
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    evaluateTime();
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String h = '';
    String m;
    String s;

    // Don't show 0 hours
    if (hours > 0) {
      h = '$hours:';
    }

    // Add leading 0 for single digits
    if (minutes < 10) {
      m = '0$minutes';
    } else {
      m = '$minutes';
    }

    if (timeElapsedSecs < 10) {
      s = '0$timeElapsedSecs';
    } else {
      s = '$timeElapsedSecs';
    }

    return Text(
      "$h$m:$s".trim(),
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: widget.textColor,
      ),
    );
  }
}
