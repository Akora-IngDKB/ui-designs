import 'dart:math';

import 'package:flutter/material.dart';

class BottomNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width * 0.4, size.height)
      // ..addArc(
      //   Rect.fromPoints(Offset(size.width * 0.4, size.height),
      //       Offset(size.width * 0.6, size.height - 50)),
      //   pi,
      //   0,
      // )
      // Mini left curve
      ..quadraticBezierTo(
        size.width * 0.42,
        size.height,
        size.width * 0.42,
        size.height - 10,
      )
      // Big left curve
      ..quadraticBezierTo(
        size.width * 0.42,
        size.height - 50,
        size.width * 0.5,
        size.height - 50,
      )
      // Big right curve
      ..quadraticBezierTo(
        size.width * 0.58,
        size.height - 50,
        size.width * 0.58,
        size.height - 10,
      )
      // Mini right curve
      ..quadraticBezierTo(
        size.width * 0.58,
        size.height,
        size.width * 0.6,
        size.height,
      )
      ..lineTo(size.width * 0.6, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
