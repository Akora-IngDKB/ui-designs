import 'package:flutter/material.dart';
import 'package:social_app/widgets/noti_appbar.dart';
import 'package:social_app/widgets/noti_widgets.dart';
import 'package:social_app/widgets/page_header.dart';
import 'package:social_app/widgets/search_bar.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 8),
          NotiAppBar(),
          PageHeader('Notification'),
          SizedBox(height: 16),
          SearchBox(),
          TimeTabs(),
          NotiList(),
        ],
      ),
    );
  }
}
