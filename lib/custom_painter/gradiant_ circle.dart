import 'package:flutter/material.dart';

class CirclePainter2 extends CustomPainter {
  final double outerRadius;
  final double innerRadius;
  final int percent;
  final List<Color> color;

  CirclePainter2({
    required this.percent,
    required this.outerRadius,
    required this.innerRadius,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var gradient = LinearGradient(
      colors: color,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    var paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTRB(
          (size.width - outerRadius),
          0,
          (size.width + outerRadius),
          size.height,
        ),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 65;

    var shadowGradient = LinearGradient(
      colors: color.map((c) => c.withOpacity(0.9)).toList(),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    var shadowPaint = Paint()
      ..shader = shadowGradient.createShader(
        Rect.fromLTRB(
          (size.width - outerRadius),
          0,
          (size.width + outerRadius),
          size.height,
        ),
      )
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10) // Blur effect
      ..style = PaintingStyle.stroke
      ..strokeWidth = 65;

    // Calculate the angle for the arc
    double sweepAngle = 2 * 3.141592653589793 * (percent / 100);

    // Define the bounding rectangle for the arc
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: outerRadius,
    );

    // Define the bounding rectangle for the shadow arc
    Rect shadowRect = Rect.fromCircle(
      center: Offset(size.width / 2 + 5, size.height / 2 + 5), // Slightly offset for shadow effect
      radius: outerRadius,
    );

    // Draw the shadow arc
    canvas.drawArc(
      shadowRect,
      -3.141592653589793 / 2, // Start angle (starting from the top)
      sweepAngle, // Sweep angle (how much of the circle to draw)
      false, // Use center (false for stroke)
      shadowPaint,
    );

    // Draw the main arc
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
