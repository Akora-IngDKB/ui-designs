import 'package:flutter/material.dart';
import 'package:project_manager/src/today/today.dart';
import 'package:project_manager/src/util/navigator_util.dart';
import 'package:project_manager/src/util/theme_values.dart';

class MyTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            'My Tasks',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          trailing: FloatingActionButton(
            child: Icon(Icons.calendar_today_outlined),
            elevation: 0,
            heroTag: Key('calendar'),
            onPressed: () {
              AppNavigator.goToPage(context, TodayPage());
            },
            backgroundColor: GREEN,
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: RED_ORANGE,
            child: Icon(
              Icons.access_time_outlined,
              size: 20,
              color: Colors.white,
            ),
          ),
          title: Text(
            'To Do',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          subtitle: Text('5 tasks now • 1 started'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: ORANGE,
            child: Icon(
              Icons.ac_unit_outlined,
              size: 20,
              color: Colors.white,
            ),
          ),
          title: Text(
            'In Progress',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          subtitle: Text('1 task now • 1 started'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: LIGHT_BLUE,
            child: Icon(
              Icons.fast_forward_outlined,
              size: 20,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Done',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          subtitle: Text('1 task now • 1 started'),
        ),
      ],
    );
  }
}
