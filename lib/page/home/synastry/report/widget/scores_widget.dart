import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScoresWidget extends StatelessWidget {
  final num soul;
  final num emotion;
  final num attraction;
  const ScoresWidget({
    super.key,
    required this.soul,
    required this.emotion,
    required this.attraction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LanKey.soulIndex.tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 16,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                //width: 80,
                height: 6,
                child: LinearProgressIndicator(
                  value: (soul / 100),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  backgroundColor: Color(0xFFF0F1F5),
                  valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                ),
              ),
              Text(
                "$soul",
                style: TextStyle(
                  color: const Color(0xFF585FC4),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 24.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LanKey.emotionIndex.tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 16,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                //width: 80,
                height: 6,
                child: LinearProgressIndicator(
                  value: (emotion / 100),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  backgroundColor: Color(0xFFF0F1F5),
                  valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                ),
              ),
              Text(
                '$emotion',
                style: TextStyle(
                  color: const Color(0xFF585FC4),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 24.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LanKey.attractionIndex.tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 16,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                //width: 80,
                height: 6,
                child: LinearProgressIndicator(
                  value: (attraction / 100),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  backgroundColor: Color(0xFFF0F1F5),
                  valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                ),
              ),
              Text(
                "$attraction",
                style: TextStyle(
                  color: const Color(0xFF585FC4),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
