import 'dart:math';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/src/chat/conv_app_bar.dart';
import 'package:whatsapp/src/utils/data.dart';
import 'package:whatsapp/src/utils/theme_values.dart';
import 'package:whatsapp/src/utils/user.dart';

class ConversationScreen extends StatelessWidget {
  final User user;
  final bool isNewChat;

  const ConversationScreen(this.user, {this.isNewChat = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ConvAppBar(user),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              if (!isNewChat)
                Expanded(
                  child: ListView.builder(
                    itemCount: MESSAGES.length,
                    itemBuilder: (_, i) {
                      return Bubble(
                        nip: MESSAGES[i].isFromMe
                            ? BubbleNip.rightTop
                            : BubbleNip.leftTop,
                        color: MESSAGES[i].isFromMe
                            ? GREEN_COLOR.withOpacity(0.95)
                            : Colors.white,
                        alignment: MESSAGES[i].isFromMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text(
                          MESSAGES[i].message,
                          style: TextStyle(
                            color: MESSAGES[i].isFromMe
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        padding: const BubbleEdges.all(12),
                        margin: const BubbleEdges.symmetric(
                          vertical: 8,
                          horizontal: 4,
                        ),
                      );
                    },
                  ),
                ),
              if (isNewChat) Spacer(),
              _InputArea(),
              SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }
}

class _InputArea extends StatelessWidget {
  final height = 44.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: height,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: GREEN_COLOR,
                  size: 28,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    cursorColor: GREEN_COLOR,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type a message',
                    ),
                  ),
                ),
                SizedBox(width: 4),
                Transform.rotate(
                  angle: pi * 1.75,
                  child: Icon(
                    Icons.attach_file,
                    color: GREEN_COLOR,
                    size: 28,
                  ),
                ),
                SizedBox(width: 16),
                Icon(
                  Icons.camera_alt_rounded,
                  color: GREEN_COLOR,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 8),
        Container(
          width: height,
          height: height,
          margin: const EdgeInsets.only(right: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: GREEN_COLOR,
          ),
          child: Icon(Icons.mic, color: Colors.white),
        ),
      ],
    );
  }
}
