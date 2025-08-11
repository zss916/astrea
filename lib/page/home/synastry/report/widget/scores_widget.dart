import 'package:astrea/core/setting/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoresWidget extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  final num value1;
  final num value2;
  final num value3;
  const ScoresWidget({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.value1,
    required this.value2,
    required this.value3,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  //LanKey.soulIndex.tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 14.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                  //width: 80,
                  height: 6,
                  child: LinearProgressIndicator(
                    value: (value1 / 100),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    backgroundColor: Color(0xFFF0F1F5),
                    valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                  ),
                ),
                Text(
                  "$value1",
                  style: TextStyle(
                    color: const Color(0xFF585FC4),
                    fontSize: 18.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  //LanKey.emotionIndex.tr,
                  title2,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 14.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                  //width: 80,
                  height: 6,
                  child: LinearProgressIndicator(
                    value: (value2 / 100),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    backgroundColor: Color(0xFFF0F1F5),
                    valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                  ),
                ),
                Text(
                  '$value2',
                  style: TextStyle(
                    color: const Color(0xFF585FC4),
                    fontSize: 18.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title3,
                  //LanKey.attractionIndex.tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 14.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                  //width: 80,
                  height: 6,
                  child: LinearProgressIndicator(
                    value: (value3 / 100),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    backgroundColor: Color(0xFFF0F1F5),
                    valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                  ),
                ),
                Text(
                  "$value3",
                  style: TextStyle(
                    color: const Color(0xFF585FC4),
                    fontSize: 18.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
