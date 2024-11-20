import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double widthFactor = size.width / 26; // الحجم الأصلي 26
    double heightFactor = size.height / 17; // الحجم الأصلي 17

    canvas.scale(widthFactor, heightFactor); // ضبط المقياس بناءً على الحجم

    Path path_0 = Path();
    path_0.moveTo(25.66, 16.27);
    path_0.cubicTo(24.25, 13.99, 22.08, 13.27, 19.54, 13.27);
    path_0.cubicTo(14.96, 13.27, 10.36, 13.45, 5.79001, 13.2);
    path_0.cubicTo(1.22001, 12.95, -1.18999, 9.58, 0.580007, 6);
    path_0.cubicTo(1.03242, 5.14935, 1.66043, 4.40455, 2.42243, 3.81494);
    path_0.cubicTo(3.18443, 3.22534, 4.06303, 2.80439, 5.00001, 2.58);
    path_0.cubicTo(8.94996, 2.181, 12.9229, 2.05736, 16.89, 2.21);
    path_0.cubicTo(20, 2.22, 23, 2.16, 25.58, 0);
    path_0.cubicTo(25.6133, 5.42, 25.64, 10.8433, 25.66, 16.27);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff8DD285).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
