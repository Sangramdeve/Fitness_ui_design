
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final double lineWidth;
  final double cornerRadius;

  LinePainter({required this.lineWidth, required this.cornerRadius});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill;

    double left = (size.width - lineWidth) / 2;
    double top = 0;
    double right = (size.width + lineWidth) / 2;
    double bottom = size.height;

    RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTRB(left, top, right, bottom),
      Radius.circular(cornerRadius),
    );

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}