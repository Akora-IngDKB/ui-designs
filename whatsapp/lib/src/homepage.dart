import 'package:flutter/material.dart';
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
  final statuses = List<User>.generate(8, (i) {
    return User(name: 'DKB', image: 'assets/images/girl.jpg');
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            StatusList(statuses),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        tooltip: 'Increment',
        icon: Icon(Icons.message),
        label: Text('New Chat'),
        backgroundColor: GREEN_COLOR,
      ),
    );
  }
}
