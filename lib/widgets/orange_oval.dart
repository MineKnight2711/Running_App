import 'dart:math';

import 'package:flutter/material.dart';

class OrangeOval extends StatelessWidget {
  final double size;
  const OrangeOval({super.key, this.size = 1});

  @override
  Widget build(BuildContext context) {
    final double width = size * 200;
    final double height = width / 4;
    return CustomPaint(
      painter: LeaningOvalPainter(),
      size: Size(width, height),
    );
  }
}

class LeaningOvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xfff26322)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addOval(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    // Apply the transformation
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(-pi / 4); // 45 degrees
    canvas.translate(-size.width / 2, -size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
