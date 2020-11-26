import 'package:flutter/material.dart';
import 'package:project_manager/src/common/progress_container.dart';
import 'package:project_manager/src/models/project.dart';
import 'package:project_manager/src/util/theme_values.dart';

class ActiveProjects extends StatelessWidget {
  final projects = [
    Project(
      label: 'Medical App',
      percentComplete: 25,
      color: GREEN,
      hoursProgress: 9,
    ),
    Project(
      label: 'Sport App',
      percentComplete: 75,
      color: RED_ORANGE,
      hoursProgress: 40,
    ),
    Project(
      label: 'Rent App',
      percentComplete: 51,
      color: ORANGE,
      hoursProgress: 29,
    ),
    Project(
      label: 'Banking App',
      percentComplete: 36,
      color: LIGHT_BLUE,
      hoursProgress: 16,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Active Projects',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 16),
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20),
          primary: false,
          shrinkWrap: true,
          itemCount: projects.length,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final rightPadding = (index % 2 == 0) ? 16.0 : 0.0;
            final leftPadding = (index % 2 == 1) ? 16.0 : 0.0;
            return Padding(
              padding: EdgeInsets.fromLTRB(leftPadding, 16, rightPadding, 8),
              child: _ProjectGridItem(projects[index]),
            );
          },
        ),
      ],
    );
  }
}

class _ProjectGridItem extends StatelessWidget {
  final Project project;

  const _ProjectGridItem(this.project);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: project.color,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProgressContainer(
            percentComplete: project.percentComplete,
            bgBorderColor: Colors.white.withOpacity(0.2),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Text(
                '${project.percentComplete.ceil()}%',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Spacer(),
          Text(
            project.label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '${project.hoursProgress} hours progress',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
