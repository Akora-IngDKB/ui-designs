import 'package:flutter/material.dart';
import 'package:whatsapp/src/homepage.dart';
import 'package:whatsapp/src/utils/theme_values.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
          primaryColor: Colors.white,
          appBarTheme:
              AppBarTheme(iconTheme: IconThemeData(color: GREEN_COLOR)),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Montserrat'),
      home: Homepage(title: 'WhatsApp'),
    );
  }
}
