import 'package:astrea/core/setting/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularPercentWidget extends StatelessWidget {
  final int value;
  final String title;
  final TextStyle? style;
  const CircularPercentWidget({
    super.key,
    required this.value,
    required this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularPercentIndicator(
          radius: 35,
          lineWidth: 4.0,
          percent: (value / 100),
          center: Text(
            "$value%",
            style: TextStyle(
              fontSize: 18.sp,
              color: const Color(0xFF323133),
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Color(0xFFEDEDFE),
          progressColor: Color(0xFF585FC4),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 8.h),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style:
                style ??
                TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
      ],
    );
  }
}
