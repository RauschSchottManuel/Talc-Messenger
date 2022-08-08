import 'dart:math';

import 'package:flutter/material.dart';

class AppBarShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    var height = size.height - (size.height / 8);

    var controlPoint1 = Point(size.width / 3, height);
    var controlPoint2 = Point(size.width / 3 * 2, height / 2);
    var endPoint = Point(size.width, height / 1.6);

    path.lineTo(0, height);
    path.cubicTo(controlPoint1.x, controlPoint1.y, controlPoint2.x,
        controlPoint2.y, endPoint.x, endPoint.y);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
