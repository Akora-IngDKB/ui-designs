import 'package:flutter/material.dart';
import 'package:project_manager/src/models/task.dart';
import 'package:project_manager/src/util/theme_values.dart';

class Timeline extends StatelessWidget {
  final tasks = [
    Task(
      time: TimeOfDay(hour: 9, minute: 0),
    ),
    Task(
      label: 'Project Research',
      color: ORANGE.withOpacity(0.2),
      time: TimeOfDay(hour: 10, minute: 0),
    ),
    Task(
      time: TimeOfDay(hour: 11, minute: 0),
    ),
    Task(
      label: 'Call',
      description:
          'Discuss with the customer of the medical application the references that he sent.',
      color: RED_ORANGE.withOpacity(0.2),
      time: TimeOfDay(hour: 12, minute: 0),
    ),
    Task(
      time: TimeOfDay(hour: 14, minute: 0),
    ),
    Task(
      label: 'More tasks for the medical app',
      color: Colors.blue.withOpacity(0.2),
      time: TimeOfDay(hour: 15, minute: 0),
    ),
    Task(
      label: 'Design meeting',
      description: 'Discuss with the designers new tasks for the medical app. '
          'Tell how the call went.',
      color: GREEN.withOpacity(0.2),
      time: TimeOfDay(hour: 16, minute: 0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(tasks.length, (i) {
        final h = (tasks[i].time.hour <= 12)
            ? '${tasks[i].time.hour}'
            : '${tasks[i].time.hour % 12}';

        final suffix = (tasks[i].time.hour < 12) ? 'AM' : 'PM';

        Widget child;

        if (tasks[i].label == null) {
          child = Padding(
            padding: const EdgeInsets.only(left: 36.0),
            child: CustomPaint(
              painter: _DashedDivider(),
            ),
          );
        } else {
          child = Container(
            margin: const EdgeInsets.only(left: 32),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: tasks[i].color,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tasks[i].label,
                  style: TextStyle(
                    color: BLACK,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                if (tasks[i].description != null) ...[
                  SizedBox(height: 8),
                  Text(
                    tasks[i].description,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Text(
                '$h $suffix',
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
              Expanded(child: child),
            ],
          ),
        );
      }),
    );
  }
}

class _DashedDivider extends CustomPainter {
  /// Calculates the [dx] value fed to the [Offset]s in `canvas.drawLine()`.
  double calcdX(int index, {double bias = 10.0, bool isX = false}) {
    double y;

    if (isX) {
      y = bias * 2 * index;
    } else {
      y = bias * (2 * index + 1);
    }

    return y;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[400]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.6;

    final values = [0, 1, 2, 3, 4];

    for (var i in List<int>.generate((size.width / 20).floor(), (_) => _)) {
      canvas.drawLine(
        Offset(calcdX(i, isX: true), 0),
        Offset(calcdX(i), 0),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
