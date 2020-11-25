import 'package:flutter/material.dart';
import 'package:whatsapp/src/utils/theme_values.dart';
import 'package:whatsapp/src/utils/user.dart';

class ChatList extends StatelessWidget {
  final List<User> users;

  const ChatList(this.users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, i) {
        final isRead = i % 3 == 2;
        final isSent = i % 3 == 1;

        Widget trailing;
        if (isSent) {
          trailing = Icon(Icons.check, color: Colors.grey);
        } else if (isRead) {
          trailing = Icon(Icons.done_all, color: Colors.blue);
        } else {
          trailing = CircleAvatar(
            radius: 12,
            backgroundColor: GREEN_COLOR,
            child: Text(
              '$i',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          );
        }

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(users[i].image),
            radius: 25,
          ),
          title: Text(
            users[i].name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Some subtitle message bi like that.'),
          trailing: trailing,
        );
      },
    );
  }
}
