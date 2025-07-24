import 'package:flutter/material.dart';
import 'package:astrea/generated/assets.dart';

class SynastryBg extends StatelessWidget {
  final Widget child;
  const SynastryBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        PositionedDirectional(
          top: 0,
          start: 0,
          end: 0,
          child: Image.asset(Assets.imageSynastryBg, matchTextDirection: true),
        ),
        PositionedDirectional(
          top: 0,
          start: 0,
          end: 0,
          child: Image.asset(Assets.imageSynastryBg1, matchTextDirection: true),
        ),
        child,
      ],
    );
  }
}
