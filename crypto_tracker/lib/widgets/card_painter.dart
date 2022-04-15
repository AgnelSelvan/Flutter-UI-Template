import 'dart:math';

import 'package:flutter/material.dart';

class CardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const rect = Rect.fromLTRB(0, 0, 250, 200);
    const double startAngle = 0;
    const sweepAngle = pi;
    const useCenter = false;
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CardPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CardPainter oldDelegate) => false;
}
