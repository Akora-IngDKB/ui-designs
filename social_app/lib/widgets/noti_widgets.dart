import 'package:flutter/material.dart';

class TimeTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Row(
        children: <Widget>[
          OutlineButton(
            onPressed: () {},
            shape: StadiumBorder(),
            child: Text(
              'TODAY',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 16),
          Text(
            'LAST WEEK',
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class NotiList extends StatelessWidget {
  final String message =
      "Jenny Smith commented on your status: 'Brilliant!!! :)'";
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
        maxHeight: double.infinity,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1E2637),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: ListView.builder(
        itemCount: 7,
        shrinkWrap: true,
        itemBuilder: (context, index) => Row(
          children: <Widget>[
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/images/motor.jpg'),
                ),
              ),
            ),
            SizedBox(width: 30),
            Expanded(
              child: Text(message, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
