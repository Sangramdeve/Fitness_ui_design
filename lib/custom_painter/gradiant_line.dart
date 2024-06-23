import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final double lineWidth;
  final double cornerRadius;
  final List<Color> color;

  LinePainter({
    required this.lineWidth,
    required this.cornerRadius,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Define the gradient
    var gradient = LinearGradient(
      colors: color,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    // Create a shader from the gradient
    var paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTRB((size.width - lineWidth) / 2, 0, (size.width + lineWidth) / 2, size.height),
      )
      ..style = PaintingStyle.fill;

    // Define the gradient for the shadow with reduced opacity
    var shadowGradient = LinearGradient(
      colors: color.map((c) => c.withOpacity(0.9)).toList(),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    // Create a shader from the shadow gradient
    var shadowPaint = Paint()
      ..shader = shadowGradient.createShader(
        Rect.fromLTRB(
          (size.width - lineWidth) / 2,
          0,
          (size.width + lineWidth) / 2,
          size.height,
        ),
      )
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10) // Blur effect
      ..style = PaintingStyle.fill;

    double left = (size.width - lineWidth) / 2;
    double top = 0;
    double right = (size.width + lineWidth) / 2;
    double bottom = size.height;

    RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTRB(left, top, right, bottom),
      Radius.circular(cornerRadius),
    );

    // Draw the shadow slightly offset
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(left + 5, top + 5, right + 5, bottom + 5),
        Radius.circular(cornerRadius),
      ),
      shadowPaint,
    );

    // Draw the gradient line on top
    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
