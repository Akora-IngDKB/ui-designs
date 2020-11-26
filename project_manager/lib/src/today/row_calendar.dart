import 'package:flutter/material.dart';
import 'package:project_manager/src/util/theme_values.dart';

class RowCalendar extends StatelessWidget {
  String parseWeekday(int weekday) {
    String name = '';

    switch (weekday) {
      case DateTime.sunday:
        name = 'Sun';
        break;
      case DateTime.monday:
        name = 'Mon';
        break;
      case DateTime.tuesday:
        name = 'Tue';
        break;
      case DateTime.wednesday:
        name = 'Wed';
        break;
      case DateTime.thursday:
        name = 'Thu';
        break;
      case DateTime.friday:
        name = 'Fri';
        break;
      case DateTime.saturday:
        name = 'Sat';
        break;
      default:
    }

    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(6, (i) {
        final date = DateTime(2020, 4, 5 + i);
        final isSunday = date.weekday == DateTime.sunday;

        return Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                parseWeekday(date.weekday),
                style: TextStyle(
                  color: isSunday ? RED_ORANGE : BLACK,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '${date.day}',
                style: TextStyle(
                  color: isSunday ? RED_ORANGE : BLACK,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
