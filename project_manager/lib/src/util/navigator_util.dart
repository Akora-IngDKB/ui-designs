import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class AppNavigator {
  static Future goToPage(BuildContext context, Widget page) async {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (_) => page),
    );
  }
}
