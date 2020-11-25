import 'package:flutter/material.dart';
import 'package:whatsapp/src/models/user.dart';
import 'package:whatsapp/src/utils/theme_values.dart';

import 'call_timer.dart';

class VoiceCallScreen extends StatefulWidget {
  final User user;

  const VoiceCallScreen(this.user);

  @override
  _VoiceCallScreenState createState() => _VoiceCallScreenState();
}

class _VoiceCallScreenState extends State<VoiceCallScreen> {
  bool isIncoming = true;

  List<Widget> getIncomingBody() {
    return [
      TextButton.icon(
        label: Text(
          'Incoming call',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        icon: Icon(
          Icons.call_received_outlined,
          color: Colors.grey,
        ),
        onPressed: null,
      ),
      Spacer(),
      RotatedBox(
        quarterTurns: 3,
        child: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
      SizedBox(height: 16),
      _FadingCallIcon(
        onTap: () {
          setState(() {
            isIncoming = false;
          });
        },
      ),
      SizedBox(height: 36),
      Text(
        'Tap to answer',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: GREEN_COLOR,
        ),
      ),
      SizedBox(height: 72),
    ];
  }

  List<Widget> getOngoingBody() {
    return [
      Text(
        widget.user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      SizedBox(height: 24),
      CallTimer(textColor: Colors.grey),
      Spacer(),
      Text(
        'On-going call',
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: !isIncoming
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.grey,
                iconSize: 28,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        title: Text(
          'WhatsApp Voice Call',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(height: 36),
          if (isIncoming) ...[
            Text(
              widget.user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 24),
          ],
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
          if (isIncoming) ...getIncomingBody(),
          if (!isIncoming) ...getOngoingBody()
        ],
      ),
    );
  }
}

class _GreenContainer extends StatelessWidget {
  final Widget child;
  final double opacity;
  final double size;

  const _GreenContainer({this.child, this.opacity = 1.0, this.size = 80.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: GREEN_COLOR.withOpacity(opacity),
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}

class _FadingCallIcon extends StatelessWidget {
  final VoidCallback onTap;

  const _FadingCallIcon({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _GreenContainer(
            opacity: 0.4,
            size: 120.0,
          ),
          _GreenContainer(
            opacity: 0.6,
            size: 100.0,
          ),
          _GreenContainer(
            child: Icon(
              Icons.phone_outlined,
              color: Colors.white,
              size: 36,
            ),
          ),
        ],
      ),
    );
  }
}
