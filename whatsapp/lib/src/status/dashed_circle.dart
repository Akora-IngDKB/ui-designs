import 'dart:math';
import 'package:flutter/widgets.dart';

const int _DefaultDashes = 20;
const Color _DefaultColor = Color(0);
const double _DefaultGapSize = 3.0;
const double _DefaultStrokeWidth = 2.0;

class DashedCircle extends StatelessWidget {
  final int dashes;
  final Color color;
  final double gapSize;
  final double strokeWidth;
  final Widget child;

  DashedCircle({
    @required this.child,
    @required this.dashes,
    this.color = _DefaultColor,
    this.gapSize = _DefaultGapSize,
    this.strokeWidth = _DefaultStrokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedCirclePainter(
        dashes: dashes,
        color: color,
        gapSize: gapSize,
        strokeWidth: strokeWidth,
      ),
      child: child,
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final int dashes;
  final Color color;
  final double gapSize;
  final double strokeWidth;

  DashedCirclePainter({
    this.dashes = _DefaultDashes,
    this.color = _DefaultColor,
    this.gapSize = _DefaultGapSize,
    this.strokeWidth = _DefaultStrokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final gap = pi / 180 * gapSize;
    final singleAngle = pi * 2 / dashes;

    final paint = Paint()
      ..color = color
      ..strokeWidth = _DefaultStrokeWidth
      ..style = PaintingStyle.stroke;

    if (dashes == 1) {
      canvas.drawArc(
        Offset.zero & size,
        0, // Start at 0
        pi * 2, // Sweep 360
        false,
        paint,
      );

      return;
    }

    if (dashes == 2) {
      canvas.drawArc(
        Offset.zero & size,
        pi / 2, // Start at 90
        pi - gap * 2, // Sweep 180
        false,
        paint,
      );

      canvas.drawArc(
        Offset.zero & size,
        pi * 1.5, // Start at 270
        pi - gap * 2, // Sweep 180
        false,
        paint,
      );

      return;
    }

    for (var i = 0; i < dashes; i++) {
      canvas.drawArc(
        Offset.zero & size,
        gap + singleAngle * i,
        singleAngle - gap * 2,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(DashedCirclePainter oldDelegate) => false;
}
