import 'package:flutter/material.dart';
import 'package:social_app/widgets/appbar.dart';
import 'package:social_app/widgets/feed_widgets.dart';
import 'package:social_app/widgets/page_header.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 8),
          MyAppBar(),
          PageHeader('Feed'),
          SizedBox(height: 16),
          TopCategories(),
          SizedBox(height: 30),
          TopicList(),
          PhotoList(),
          VideoList(),
        ],
      ),
    );
  }
}
