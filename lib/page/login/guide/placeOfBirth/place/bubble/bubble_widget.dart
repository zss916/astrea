import 'package:astrea/page/login/guide/placeOfBirth/place/bubble/bubble_painter.dart';
import 'package:flutter/material.dart';

class BubbleWidget extends StatelessWidget {
  const BubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(30, 30), painter: BubblePainter("A"));
  }
}
