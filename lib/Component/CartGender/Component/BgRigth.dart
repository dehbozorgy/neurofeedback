import 'dart:math';

import 'package:flutter/material.dart';

class BgRigth extends CustomPainter {

  final Color backColor;
  bool active;

  BgRigth({super.repaint, required this.backColor,this.active=false});

  @override
  void paint(Canvas canvas, Size size) {

    final y = size.height;
    final x = size.width;

    final small = 20.0;

    final border = Path()
    ..moveTo(10, 0)
    ..arcTo(Rect.fromCircle(
        center: Offset(x-small, small),
        radius:  small), 3*pi/2, pi, false)
    ..lineTo(-10, y)
      ..close()
    ;

    final paintBorder = Paint()
      ..style = PaintingStyle.fill
      ..color = backColor
    ;

    final paintBorderShadow = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, 5)
    ;


    if(active)
      canvas.drawPath(border, paintBorderShadow);

    canvas.drawPath(border, paintBorder);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}
