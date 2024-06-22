
import 'package:flutter/material.dart';


class CirclePainter2 extends CustomPainter {
  final double outerRadius;
  final double innerRadius;
  final int percent;

  CirclePainter2({
    required this.percent,
    required this.outerRadius,
    required this.innerRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 65;

    // Calculate the angle for the arc
    double sweepAngle = 2 * 3.141592653589793 * (percent / 100);

    // Define the bounding rectangle for the arc
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: outerRadius,
    );

    // Draw the arc
    canvas.drawArc(
      rect,
      -3.141592653589793 / 2, // Start angle (starting from the top)
      sweepAngle, // Sweep angle (how much of the circle to draw)
      false, // Use center (false for stroke)
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Repaint whenever percent changes
  }
}


class CirclePainter extends CustomPainter {
  final double outerRadius;
  final double innerRadius;
  final int percent;

  CirclePainter({
    required this.percent,
    required this.outerRadius,
    required this.innerRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50.0;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), outerRadius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
