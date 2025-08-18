import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/horoscope/index/logic.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalityAnalysis extends StatelessWidget {
  final HoroscopeLogic logic;
  const PersonalityAnalysis({super.key, required this.logic});
  final bool isVersion = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (logic.sunSignInterpretation.isNotEmpty)
            Container(
              width: double.maxFinite,
              margin: EdgeInsetsDirectional.only(top: isVersion ? 16.h : 0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(end: 10.w),
                    child: Image.asset(
                      Assets.imageAnalysisTitleIcon,
                      matchTextDirection: true,
                      width: 35,
                      height: 24,
                    ),
                  ),

                  Expanded(
                    child: AutoSizeText(
                      LanKey.personalityAnalysis.tr,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      maxFontSize: 24,
                      minFontSize: 18,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 24.sp,
                        fontFamily: AppFonts.titleFontFamily,
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsetsDirectional.only(start: 10.w),
                    child: Image.asset(
                      Assets.imageAnalysisTitleIcon2,
                      matchTextDirection: true,
                      width: 35,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          if (logic.sunSignInterpretation.isNotEmpty)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 16.h),
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 11),
                        child: Image.asset(
                          Assets.imageTitleSunS,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          LanKey.sunSign.tr,
                          style: TextStyle(
                            color: AppColor.textTitleColor,
                            fontSize: 18.sp,
                            fontFamily: AppFonts.subTitleFontFamily,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 6.h, start: 35),
                  width: double.maxFinite,
                  child: Text.rich(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColor.contentTitleColor,
                      fontSize: 14.sp,
                      fontFamily: AppFonts.textFontFamily,
                    ),
                    TextSpan(
                      children: [
                        /*WidgetSpan(
                          child: Container(
                            margin: EdgeInsetsDirectional.only(end: 4.w),
                            child: Image.asset(
                              Assets.imageSunIcon,
                              matchTextDirection: true,
                              width: 16,
                              height: 18,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: LanKey.sunSignTitle.tr,
                          style: TextStyle(
                            color: const Color(0xFF585FC4),
                            fontSize: 16.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),*/
                        TextSpan(
                          text: logic.sunSignInterpretation,
                          style: TextStyle(
                            color: const Color(0xFF6A676C),
                            fontSize: 16.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 35),
                  padding: EdgeInsetsDirectional.only(top: 3.h, bottom: 8.h),
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Text(
                        LanKey.all.tr,
                        style: TextStyle(
                          color: AppColor.contentTitleColor,
                          fontSize: 14.sp,
                          fontFamily: AppFonts.textFontFamily,
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 4.w),
                        child: Image.asset(
                          Assets.imageArrowMore,
                          width: 11,
                          height: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget buildTitle() => Container(
    width: double.maxFinite,
    margin: EdgeInsetsDirectional.only(top: isVersion ? 16.h : 0),
    child: Text(
      LanKey.personalityAnalysis.tr,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: const Color(0xFF323133),
        fontSize: 24.sp,
        fontFamily: AppFonts.titleFontFamily,
      ),
    ),
  );
}
