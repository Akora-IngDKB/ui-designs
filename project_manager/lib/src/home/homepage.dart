import 'package:flutter/material.dart';
import 'package:project_manager/src/home/active_projects.dart';
import 'package:project_manager/src/home/appbar.dart';
import 'package:project_manager/src/home/my_tasks.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 16),
            MyTasks(),
            SizedBox(height: 32),
            ActiveProjects(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
