import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabviewTopWidget extends StatelessWidget {
  final int? love;
  final int? career;
  final int? wealth;
  const TabviewTopWidget({super.key, this.wealth, this.career, this.love});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.cyan,
      padding: EdgeInsetsDirectional.only(bottom: 12.h),
      margin: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, top: 12.h),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanKey.love.tr,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: const Color(0xFF323133),
                      fontSize: 18.sp,
                      fontFamily: AppFonts.textFontFamily,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                    //width: 80,
                    height: 6,
                    child: LinearProgressIndicator(
                      value: (love ?? 0) / 100,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      backgroundColor: Color(0xFFF0F1F5),
                      valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                    ),
                  ),

                  Text(
                    "${love ?? 0}",
                    textAlign: TextAlign.start,
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
            SizedBox(width: 26.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanKey.career.tr,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: const Color(0xFF323133),
                      fontSize: 18.sp,
                      fontFamily: AppFonts.textFontFamily,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                    //width: 80,
                    height: 6,
                    child: LinearProgressIndicator(
                      value: (career ?? 0) / 100,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      backgroundColor: Color(0xFFF0F1F5),
                      valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                    ),
                  ),
                  Text(
                    "${career ?? 0}",
                    textAlign: TextAlign.start,
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
            SizedBox(width: 26.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanKey.wealth.tr,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: const Color(0xFF323133),
                      fontSize: 18.sp,
                      fontFamily: AppFonts.textFontFamily,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                    //width: 80,
                    height: 6,
                    child: LinearProgressIndicator(
                      value: (wealth ?? 0) / 100,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      backgroundColor: Color(0xFFF0F1F5),
                      valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                    ),
                  ),
                  Text(
                    "${wealth ?? 0}",
                    textAlign: TextAlign.start,
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
      ),
    );
  }
}
