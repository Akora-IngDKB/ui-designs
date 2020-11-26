import 'package:flutter/material.dart';
import 'package:project_manager/src/util/theme_values.dart';

class Taskbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 44),
      decoration: BoxDecoration(
        color: ORANGE,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          IconButton(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.zero,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 24),
          Text(
            'Create new task',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: BLACK,
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            enabled: false,
            initialValue: 'Make tasks for the sport app',
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Title',
            ),
            style: TextStyle(color: BLACK, fontSize: 18),
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextFormField(
                  enabled: false,
                  initialValue: 'Wed, 8 April',
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Date',
                    suffix: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      ),
                    ),
                  ),
                  style: TextStyle(color: BLACK, fontSize: 18),
                ),
              ),
              SizedBox(width: 32),
              CircleAvatar(
                backgroundColor: GREEN,
                radius: 27,
                child: Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
