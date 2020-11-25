import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/src/settings/profile.dart';
import 'package:whatsapp/src/utils/data.dart';
import 'package:whatsapp/src/utils/theme_values.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(color: GREEN_COLOR),
        ),
        iconTheme: IconThemeData(color: GREEN_COLOR),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => ProfileScreen(),
                ),
              );
            },
            child: Row(
              children: [
                SizedBox(width: 16),
                Hero(
                  tag: Key('user-avatar'),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(CURRENT_USER.image),
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Akora Ing. DKB',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Hey there! I'm using WhatsApp.",
                        style: TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.qr_code_outlined),
                  iconSize: 32,
                  onPressed: null,
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.vpn_key_outlined),
                  ),
                  title: Text(
                    'Account',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Privacy, security, change number'),
                ),
                ListTile(
                  leading: Icon(Icons.chat_outlined),
                  title: Text(
                    'Chat',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Theme, wallpapers, chat history'),
                ),
                ListTile(
                  leading: Icon(Icons.notifications_outlined),
                  title: Text(
                    'Notifications',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Message, group & call tones'),
                ),
                ListTile(
                  leading: Icon(Icons.data_usage_outlined),
                  title: Text(
                    'Storage and data',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Network usage, auto-download'),
                ),
                ListTile(
                  leading: Icon(Icons.help_outline_outlined),
                  title: Text(
                    'Help',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Help center, contact us, privacy policy'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.group_outlined),
                  title: Text(
                    'Invite a friend',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Cloned by Akora Ing. DKB',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
