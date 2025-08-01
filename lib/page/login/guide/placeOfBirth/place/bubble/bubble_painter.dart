import 'dart:math';

import 'package:flutter/material.dart';

class BubblePainter extends CustomPainter {
  final String text;
  BubblePainter(this.text);

  @override
  void paint(Canvas canvas, Size size) {
    // 原点移到左下角
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    Path path = Path();
    // 绘制文字
    path.lineTo(0, -size.width / 2);
    // path.conicTo(33, -28, 20, 0, 1);

    path.arcToPoint(
      Offset(size.width / 2, 0),
      radius: Radius.circular(size.width / 2),
      largeArc: true,
      clockwise: true,
    );
    path.close();
    var bounds = path.getBounds();
    canvas.save();
    canvas.translate(-bounds.width / 2, bounds.height / 2);
    canvas.rotate(pi * 1.2);
    canvas.drawPath(path, paint);
    canvas.restore();
    // 绘制文字
    var textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 24,
          foreground: Paint()
            ..style = PaintingStyle.fill
            ..color = Colors.white,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    canvas.translate(-size.width, -size.height / 2);
    textPainter.paint(canvas, Offset(-size.width / 2.4, size.height / 1.2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
