import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp/src/utils/theme_values.dart';
import 'package:whatsapp/src/utils/user.dart';

class VoiceCallScreen extends StatefulWidget {
  final User user;

  const VoiceCallScreen(this.user);

  @override
  _VoiceCallScreenState createState() => _VoiceCallScreenState();
}

class _VoiceCallScreenState extends State<VoiceCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.grey,
          iconSize: 28,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'WHATSAPP VOICE CALL',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 36),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundImage: AssetImage(widget.user.image),
                  radius: 120,
                ),
              ),
              Positioned(
                bottom: 0,
                right: (MediaQuery.of(context).size.width * 0.5) - 120,
                child: Container(
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 8),
                    color: GREEN_COLOR,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.question_answer_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 48),
          Text(
            widget.user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 24),
          _CallTimer(),
          Spacer(),
          Text(
            'ON-GOING CALL',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: GREEN_COLOR,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                child: Icon(
                  Icons.volume_up_outlined,
                  color: GREEN_COLOR,
                ),
                backgroundColor: Colors.white,
                heroTag: Key('speaker'),
                onPressed: () {},
              ),
              FloatingActionButton(
                child: Icon(
                  Icons.videocam_outlined,
                  color: Colors.grey,
                ),
                backgroundColor: Colors.white,
                heroTag: Key('cam-off'),
                onPressed: () {},
              ),
              FloatingActionButton(
                child: Icon(
                  Icons.mic_off_outlined,
                  color: GREEN_COLOR,
                ),
                backgroundColor: Colors.white,
                heroTag: Key('mic-off'),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 36),
          FloatingActionButton(
            child: Icon(Icons.call_end_outlined),
            backgroundColor: Colors.red,
            heroTag: Key('end-call'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 36),
        ],
      ),
    );
  }
}

class _CallTimer extends StatefulWidget {
  @override
  __CallTimerState createState() => __CallTimerState();
}

class __CallTimerState extends State<_CallTimer> {
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
        color: Colors.grey,
      ),
    );
  }
}
