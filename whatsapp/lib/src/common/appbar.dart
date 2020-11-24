import 'package:flutter/material.dart';
import 'package:whatsapp/src/utils/theme_values.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'WhatsApp',
        style: TextStyle(color: GREEN_COLOR),
      ),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          color: GREEN_COLOR,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          color: GREEN_COLOR,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
