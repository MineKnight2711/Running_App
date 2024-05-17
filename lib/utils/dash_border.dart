import 'package:flutter/material.dart';
import 'dart:math' as math;

class DashedRect extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double gap;

  const DashedRect(
      {super.key,
      this.color = Colors.black,
      this.strokeWidth = 1,
      this.gap = 20});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(strokeWidth / 2),
        child: CustomPaint(
          painter: DashRectPainter(
              color: color, strokeWidth: strokeWidth, gap: gap, radius: 40),
        ),
      ),
    );
  }
}

class DashRectPainter extends CustomPainter {
  double strokeWidth;
  Color color;
  double gap;
  double radius;

  DashRectPainter({
    this.strokeWidth = 5.0,
    this.color = Colors.grey,
    this.gap = 5.0,
    this.radius = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double x = size.width;
    double y = size.height;

    Path _topPath = getDashedPath(
      a: math.Point(radius, 0),
      b: math.Point(x - radius, 0),
      gap: gap,
    );
    Path _rightPath = getDashedPath(
      a: math.Point(x, radius),
      b: math.Point(x, y - radius),
      gap: gap,
    );
    Path _bottomPath = getDashedPath(
      a: math.Point(radius, y),
      b: math.Point(x - radius, y),
      gap: gap,
    );
    Path _leftPath = getDashedPath(
      a: math.Point(0, radius),
      b: math.Point(0.001, y - radius),
      gap: gap,
    );

    canvas.drawPath(
        _getCornerPath(radius, Corner.topLeft, x, y, _topPath, _leftPath),
        dashedPaint);
    canvas.drawPath(
        _getCornerPath(radius, Corner.topRight, x, y, _topPath, _rightPath),
        dashedPaint);
    canvas.drawPath(
        _getCornerPath(radius, Corner.bottomLeft, x, y, _bottomPath, _leftPath),
        dashedPaint);
    canvas.drawPath(
        _getCornerPath(
            radius, Corner.bottomRight, x, y, _bottomPath, _rightPath),
        dashedPaint);
  }

  Path getDashedPath({
    required math.Point<double> a,
    required math.Point<double> b,
    required gap,
  }) {
    Size size = Size(b.x - a.x, b.y - a.y);
    Path path = Path();
    path.moveTo(a.x, a.y);
    bool shouldDraw = true;
    math.Point currentPoint = math.Point(a.x, a.y);
    num radians = math.atan(size.height / size.width);
    num dx = math.cos(radians) * gap < 0
        ? math.cos(radians) * gap * -1
        : math.cos(radians) * gap;
    num dy = math.sin(radians) * gap < 0
        ? math.sin(radians) * gap * -1
        : math.sin(radians) * gap;

    while (currentPoint.x <= b.x && currentPoint.y <= b.y) {
      shouldDraw
          ? path.lineTo(currentPoint.x.toDouble(), currentPoint.y.toDouble())
          : path.moveTo(currentPoint.x.toDouble(), currentPoint.y.toDouble());
      shouldDraw = !shouldDraw;
      currentPoint = math.Point(
        currentPoint.x + dx,
        currentPoint.y + dy,
      );
    }

    return path;
  }

  Path _getCornerPath(double radius, Corner corner, double x, double y,
      Path sidePathA, Path sidePathB) {
    Path path = Path();

    path.addPath(sidePathA, Offset.zero);
    path.addPath(sidePathB, Offset.zero);

    switch (corner) {
      case Corner.topLeft:
        path.addArc(
            Rect.fromLTWH(0, 0, radius * 2, radius * 2), math.pi, math.pi / 2);
        break;
      case Corner.topRight:
        path.addArc(Rect.fromLTWH(x - radius * 2, 0, radius * 2, radius * 2),
            -math.pi / 2, math.pi / 2);
        break;
      case Corner.bottomLeft:
        path.addArc(Rect.fromLTWH(0, y - radius * 2, radius * 2, radius * 2),
            math.pi / 2, math.pi / 2);
        break;
      case Corner.bottomRight:
        path.addArc(
            Rect.fromLTWH(
                x - radius * 2, y - radius * 2, radius * 2, radius * 2),
            0,
            math.pi / 2);
        break;
    }

    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

enum Corner { topLeft, topRight, bottomLeft, bottomRight }
