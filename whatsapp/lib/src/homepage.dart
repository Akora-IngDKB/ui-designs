import 'package:flutter/material.dart';
import 'package:whatsapp/src/calls/call_list.dart';
import 'package:whatsapp/src/chat/chat_list.dart';
import 'package:whatsapp/src/chat/chats_calls_header.dart';
import 'package:whatsapp/src/common/appbar.dart';
import 'package:whatsapp/src/status/status.dart';
import 'package:whatsapp/src/utils/theme_values.dart';
import 'package:whatsapp/src/utils/user.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;

  final users = List<User>.generate(8, (i) {
    return User(name: 'DKB', image: 'assets/images/girl.jpg');
  });

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      ChatList(users),
      Calls(users),
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          StatusList(users),
          SizedBox(height: 30),
          ChatCallHeader(isChatSelected: currentIndex == 0),
          SizedBox(height: 30),
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
        onPressed: null,
        tooltip: 'Increment',
        icon: Icon(currentIndex == 0 ? Icons.message : Icons.phone),
        label: Text(currentIndex == 0 ? 'New Chat' : 'New Call'),
        backgroundColor: GREEN_COLOR,
      ),
    );
  }
}
