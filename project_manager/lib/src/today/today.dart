import 'package:flutter/material.dart';
import 'package:project_manager/src/today/row_calendar.dart';
import 'package:project_manager/src/today/timeline.dart';
import 'package:project_manager/src/util/theme_values.dart';

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: BLACK,
                  ),
                ),
                ElevatedButton(
                  child: Text('Add Task'),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(GREEN),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(StadiumBorder()),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                  ),
                )
              ],
            ),
            Text(
              'Productive day, Akora',
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 48),
            Text(
              'April, 2020',
              style: TextStyle(
                fontSize: 18,
                color: BLACK,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 24),
            RowCalendar(),
            SizedBox(height: 32),
            Timeline(),
          ],
        ),
      ),
    );
  }
}
