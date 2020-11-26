import 'package:flutter/material.dart';
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
            child: Icon(Icons.event),
            elevation: 0,
            heroTag: Key('calendar'),
            onPressed: null,
            backgroundColor: GREEN,
          ),
        ),
        ListTile(
          leading: FloatingActionButton(
            child: Icon(Icons.access_time, size: 20),
            elevation: 0,
            heroTag: Key('todo'),
            onPressed: null,
            mini: true,
            backgroundColor: RED_ORANGE,
          ),
          title: Text(
            'To Do',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          subtitle: Text('5 tasks now • 1 started'),
        ),
        ListTile(
          leading: FloatingActionButton(
            child: Icon(Icons.refresh_outlined, size: 20),
            elevation: 0,
            heroTag: Key('in-progress'),
            onPressed: null,
            mini: true,
            backgroundColor: Colors.orangeAccent.withOpacity(0.7),
          ),
          title: Text(
            'In Progress',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          subtitle: Text('1 task now • 1 started'),
        ),
        ListTile(
          leading: FloatingActionButton(
            child: Icon(Icons.fast_forward_outlined, size: 20),
            elevation: 0,
            heroTag: Key('done'),
            onPressed: null,
            backgroundColor: LIGHT_BLUE,
            mini: true,
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
