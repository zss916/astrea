import 'package:flutter/material.dart';

class TransformRotateWidget extends StatelessWidget {
  final Widget child;
  final double angle;
  const TransformRotateWidget({
    super.key,
    required this.angle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      // angle: (pi / 12) * 2,
      angle: angle,
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 0),
        child: child,
      ),
    );
  }
}
