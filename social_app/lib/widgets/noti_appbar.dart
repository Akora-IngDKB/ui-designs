import 'package:flutter/material.dart';

class NotiAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey[700],
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
    );
  }
}
