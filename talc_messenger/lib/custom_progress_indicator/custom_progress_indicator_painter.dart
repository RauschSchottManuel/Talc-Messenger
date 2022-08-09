import 'dart:ui';

import 'package:flutter/material.dart';

class TalcCustomProgressBarPainter extends CustomPainter {
  TalcCustomProgressBarPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;

    var path = Path()
      ..moveTo(0, size.height)
      ..cubicTo(size.width / 3, size.height, size.width / 3 * 2,
          size.height / 2, size.width, size.height / 1.6);

    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric metric in pathMetrics) {
      var additionFactor = 80.0;
      var barWidth =
          (size.width * progress) + (additionFactor + (1 + progress)) <
                  size.width / 2.5
              ? (size.width * progress) + (additionFactor + (1 + progress))
              : size.width / 2.5;
      Path actualPath = metric.extractPath(
        (metric.length * progress),
        (metric.length * progress) + barWidth,
      );

      canvas.drawPath(actualPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
