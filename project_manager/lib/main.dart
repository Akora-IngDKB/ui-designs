import 'package:flutter/material.dart';
import 'package:project_manager/src/home/homepage.dart';
import 'package:project_manager/src/util/theme_values.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        iconTheme: IconThemeData(color: BLACK),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: BLACK),
          color: Colors.transparent,
        ),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: LIGHT_ORANGE,
      ),
      home: Homepage(),
    );
  }
}
