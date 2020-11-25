import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/src/common/whatsapp_web.dart';
import 'package:whatsapp/src/settings/settings.dart';
import 'package:whatsapp/src/utils/theme_values.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final options = ['WhatsApp Web', 'Settings'];

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
        PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, color: GREEN_COLOR),
          onSelected: (value) {
            switch (value) {
              case 'Settings':
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (_) => SettingsScreen(),
                  ),
                );
                break;
              case 'WhatsApp Web':
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (_) => WhatsAppWebScreen(),
                  ),
                );
                break;
              default:
            }
          },
          itemBuilder: (context) {
            return options.map<PopupMenuEntry<String>>((item) {
              return PopupMenuItem(child: Text(item), value: item);
            }).toList();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
