import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/src/chat/conversation.dart';
import 'package:whatsapp/src/models/user.dart';
import 'package:whatsapp/src/utils/theme_values.dart';

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
          trailing = CircleAvatar(
            radius: 12,
            backgroundColor: GREEN_COLOR,
            child: Text(
              '$i',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          );
        } else {
          trailing = Icon(Icons.done_all, color: Colors.blue);
        }

        return ListTile(
          leading: Hero(
            tag: Key(users[i].image),
            child: CircleAvatar(
              backgroundImage: AssetImage(users[i].image),
              radius: 25,
            ),
          ),
          title: Text(
            users[i].name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (_) => ConversationScreen(users[i]),
              ),
            );
          },
          subtitle: Text('Some subtitle message bi like that.'),
          trailing: trailing,
        );
      },
    );
  }
}
