import 'package:flutter/material.dart';

class LineState extends StatelessWidget {
  final int state;
  const LineState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: ShapeDecoration(
        color: state == 1 ? Color(0xFF51C75B) : const Color(0xFFF74E57),
        shape: OvalBorder(),
      ),
    );
  }
}
