import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/src/calls/call_list.dart';
import 'package:whatsapp/src/chat/chat_list.dart';
import 'package:whatsapp/src/chat/new_chat.dart';
import 'package:whatsapp/src/common/appbar.dart';
import 'package:whatsapp/src/common/chats_calls_header.dart';
import 'package:whatsapp/src/status/status.dart';
import 'package:whatsapp/src/utils/data.dart';
import 'package:whatsapp/src/utils/theme_values.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      ChatList(ALL_USERS),
      Calls(ALL_USERS),
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          StatusList(ALL_USERS),
          SizedBox(height: 24),
          ChatCallHeader(isChatSelected: currentIndex == 0),
          SizedBox(height: 24),
          Expanded(
            child: PageView.builder(
              onPageChanged: onPageChanged,
              itemCount: pages.length,
              itemBuilder: (_, i) => pages[i],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: currentIndex == 0
            ? () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (_) => NewChatScreen(ALL_USERS),
                  ),
                );
              }
            : null,
        tooltip: 'Increment',
        icon: Icon(currentIndex == 0 ? Icons.message : Icons.phone),
        label: Text(currentIndex == 0 ? 'New Chat' : 'New Call'),
        backgroundColor: GREEN_COLOR,
      ),
    );
  }
}
