import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:astrea/generated/assets.dart';

class InterestWidget extends StatelessWidget {
  final String title;
  final String icon;
  final bool isChecked;

  const InterestWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(icon, matchTextDirection: true, width: 151, height: 106),
        if (isChecked)
          SvgPicture.asset(
            Assets.svgInterestBorder,
            matchTextDirection: true,
            width: 151,
            height: 106,
          ),
      ],
    );
  }
}
