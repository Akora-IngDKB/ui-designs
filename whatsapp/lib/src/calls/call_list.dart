import 'package:flutter/material.dart';
import 'package:whatsapp/src/utils/theme_values.dart';
import 'package:whatsapp/src/utils/user.dart';

class Calls extends StatelessWidget {
  final List<User> users;

  const Calls(this.users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, i) {
        final isSecond = i % 3 == 2;
        final isFirst = i % 3 == 1;
        final iconSize = 18.0;

        Widget subIcon;
        if (isFirst) {
          subIcon = Icon(
            Icons.call_received,
            color: Colors.blue,
            size: iconSize,
          );
        } else if (isSecond) {
          subIcon = Icon(
            Icons.call_made,
            color: GREEN_COLOR,
            size: iconSize,
          );
        } else {
          subIcon = Icon(
            Icons.call_missed,
            color: Colors.red,
            size: iconSize,
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
          subtitle: Row(
            children: [
              subIcon,
              SizedBox(width: 4),
              Text('25 November 2020, 00:00am'),
            ],
          ),
          trailing: Icon(
            isFirst ? Icons.videocam_outlined : Icons.phone_outlined,
            color: GREEN_COLOR,
          ),
        );
      },
    );
  }
}
