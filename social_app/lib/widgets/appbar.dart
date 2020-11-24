import 'package:flutter/material.dart';
import 'package:social_app/screens/notification.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.short_text,
            color: Colors.grey[700],
          ),
          onPressed: () {},
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.orange,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => NotificationScreen(),
                ));
              },
            ),
            SizedBox(width: 5),
            Container(
              width: 28,
              height: 28,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/dp.jpg'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
