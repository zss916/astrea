import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/generated/assets.dart';

class GenderWidget extends StatelessWidget {
  final String title;
  final String icon;
  final bool isChecked;

  const GenderWidget({
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
        // if (isChecked)
        SvgPicture.asset(Assets.svgSexBorder, width: 151, height: 168),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(16),
            color: isChecked ? Colors.transparent : Color(0xFFFFFBFB),
          ),
          width: 151,
          height: 168,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 12),
                child: Image.asset(
                  icon,
                  matchTextDirection: true,
                  width: 30,
                  height: 29,
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 18,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
