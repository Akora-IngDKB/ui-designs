import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String title;

  PageHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: (title == 'Feed') ? _feedHeader() : _notificationHeader(),
    );
  }

  Widget _feedHeader() => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Feed',
            style: TextStyle(
              color: Colors.indigo[900],
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Your daily feed...',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          )
        ],
      );

  Widget _notificationHeader() => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Notification',
            style: TextStyle(
              color: Colors.indigo[900],
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.orangeAccent[400].withOpacity(0.2),
            child: Text('8', style: TextStyle(color: Colors.orange)),
          ),
        ],
      );
}
