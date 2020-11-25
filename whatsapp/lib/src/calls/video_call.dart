import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/src/utils/data.dart';
import 'package:whatsapp/src/utils/theme_values.dart';
import 'package:whatsapp/src/utils/user.dart';

class VideoCallScreen extends StatefulWidget {
  final User user;

  const VideoCallScreen(this.user);

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen>
    with TickerProviderStateMixin {
  bool showToolbar = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showToolbar = !showToolbar;
        });
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(widget.user.image, fit: BoxFit.cover),
            Positioned(
              left: 0,
              bottom: 20,
              right: 20,
              child: AnimatedSize(
                vsync: this,
                duration: VIDEO_TOOLS_ANIM_DURATION,
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 200,
                        width: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          child: Image.asset(
                            CURRENT_USER.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    if (showToolbar) _CallControls()
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 8,
              right: 16,
              child: AnimatedSize(
                vsync: this,
                duration: VIDEO_TOOLS_ANIM_DURATION,
                alignment: Alignment.topCenter,
                child: showToolbar ? _NameToolbar(widget.user) : Offstage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NameToolbar extends StatelessWidget {
  final User user;

  const _NameToolbar(this.user);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            iconSize: 28,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'WHATSAPP VIDEO CALL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  user.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            color: Colors.white,
            iconSize: 28,
            icon: Icon(Icons.person_add_outlined),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _CallControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 16),
        FloatingActionButton(
          child: Icon(Icons.call_end_outlined),
          backgroundColor: Colors.red,
          heroTag: Key('end-call'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              child: Icon(
                Icons.flip_camera_ios_outlined,
                color: GREEN_COLOR,
              ),
              backgroundColor: Colors.white,
              heroTag: Key('flip-camera'),
              onPressed: () {},
            ),
            FloatingActionButton(
              child: Icon(
                Icons.videocam_off_outlined,
                color: GREEN_COLOR,
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
      ],
    );
  }
}
