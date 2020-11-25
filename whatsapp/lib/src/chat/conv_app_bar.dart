import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/src/calls/video_call.dart';
import 'package:whatsapp/src/utils/theme_values.dart';
import 'package:whatsapp/src/utils/user.dart';

class ConvAppBar extends StatelessWidget implements PreferredSizeWidget {
  final User user;

  const ConvAppBar(this.user);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CircleAvatar(
            backgroundImage: AssetImage(user.image),
          ),
          SizedBox(width: 24),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 2),
              Text(
                'online',
                style: TextStyle(color: GREEN_COLOR),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.phone_outlined),
            color: GREEN_COLOR,
            iconSize: 26,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.videocam_outlined),
            color: GREEN_COLOR,
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => VideoCallScreen(user),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            color: GREEN_COLOR,
            iconSize: 28,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
