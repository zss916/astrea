import 'package:flutter/material.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/generated/assets.dart';

class SpiritualBg extends StatelessWidget {
  final Widget child;
  const SpiritualBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        PositionedDirectional(
          top: 0,
          start: 0,
          end: 0,
          child: Image.asset(Assets.imageStarLight, matchTextDirection: true),
        ),
        PositionedDirectional(
          top: 110,
          start: 0,
          end: 0,
          bottom: 0,
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: AppColor.pageBackground,
          ),
        ),
        child,
      ],
    );
  }
}
