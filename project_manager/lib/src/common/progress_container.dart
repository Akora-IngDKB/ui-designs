import 'dart:math';

import 'package:flutter/material.dart';

class ProgressContainer extends StatefulWidget {
  /// Measure on the percentage scale (0 - 100).
  final double percentComplete;

  /// Padding between progress border and [child] widget.
  final EdgeInsetsGeometry contentPadding;

  final Widget child;

  /// Background color of the progress indicator. Usually a less opaque color.
  final Color bgBorderColor;

  /// Color of the progress indicator. Applied over the [bgBorderColor].
  final Color progressColor;

  /// Width of the progress indicator.
  final double strokeWidth;

  const ProgressContainer({
    this.child,
    this.percentComplete = 0.0,
    this.strokeWidth = 5.0,
    this.bgBorderColor = Colors.white38,
    this.progressColor = Colors.white,
    this.contentPadding = const EdgeInsets.all(8),
  });

  @override
  _ProgressContainerState createState() => _ProgressContainerState();
}

class _ProgressContainerState extends State<ProgressContainer>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    animation = Tween<double>(begin: 0.0, end: widget.percentComplete)
        .animate(controller)
          ..addListener(() {
            setState(() {});
          });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CustomBorderPainter(
        percentComplete: animation.value,
        bgBorderColor: widget.bgBorderColor,
        progressColor: widget.progressColor,
        strokeWidth: widget.strokeWidth,
      ),
      child: Padding(
        padding: widget.contentPadding,
        child: widget.child,
      ),
    );
  }
}

class _CustomBorderPainter extends CustomPainter {
  /// Measure on the percentage scale (0 - 100).
  final double percentComplete;
  final Color bgBorderColor;
  final Color progressColor;
  final double strokeWidth;

  _CustomBorderPainter({
    this.percentComplete,
    this.bgBorderColor,
    this.progressColor,
    this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final bgPaint = Paint()
      ..color = bgBorderColor
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Start angle: 90 degrees on the cartesian plane expressed in radians.
    final startAngle = -pi * 0.5;

    // Sweep angle: start angle + [percentComplete * 360] expressed in radians.
    final sweepAngle = -startAngle * (percentComplete / 100.0) * 4;

    // Draw a 360 degrees circle as the background border.
    canvas.drawArc(Offset.zero & size, 0, 2 * pi, false, bgPaint);

    // Draw the progress border.
    canvas.drawArc(
      Offset.zero & size,
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
