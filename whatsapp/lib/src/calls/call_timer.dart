import 'dart:async';

import 'package:flutter/material.dart';

class CallTimer extends StatefulWidget {
  final Color textColor;

  CallTimer({this.textColor = Colors.white});

  @override
  _CallTimerState createState() => _CallTimerState();
}

class _CallTimerState extends State<CallTimer> {
  static int hours = 0;
  static int minutes = 0;
  Timer timer;
  static int seconds = 0;

  void evaluateTime() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      seconds++;

      if (mounted) {
        setState(() {
          if (seconds == 60) {
            minutes++;
            seconds = 0;
          }
          if (minutes == 60) {
            hours++;
            minutes = 0;
          }
          if (seconds == 60) {
            minutes++;
          }
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    evaluateTime();
  }

  @override
  void dispose() {
    timer.cancel();

    hours = 0;
    minutes = 0;
    seconds = 0;

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

    if (seconds < 10) {
      s = '0$seconds';
    } else {
      s = '$seconds';
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
