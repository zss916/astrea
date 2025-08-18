import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StarContent extends StatelessWidget {
  final int index;

  const StarContent({super.key, required this.index});

  List<String> get listTitle => [
    LanKey.aries.tr,
    LanKey.taurus.tr,
    LanKey.gemini.tr,
    LanKey.cancer.tr,
    LanKey.leo.tr,
    LanKey.virgo.tr,
    LanKey.libra.tr,
    LanKey.scorpio.tr,
    LanKey.sagittarius.tr,
    LanKey.capricorn.tr,
    LanKey.aquarius.tr,
    LanKey.pisces.tr,
  ];

  List<String> get icons => [
    Assets.imageAries,
    Assets.imageTaurus,
    Assets.imageGemini,
    Assets.imageCancer,
    Assets.imageLeo,
    Assets.imageVirgo,
    Assets.imageLibra,
    Assets.imageScorpio,
    Assets.imageSagittarius,
    Assets.imageCapricorn,
    Assets.imageAquarius,
    Assets.imagePisces,
  ];

  List<String> get images => [
    Assets.imageIconAries,
    Assets.imageIconTaurus,
    Assets.imageIconGemini,
    Assets.imageIconCancer,
    Assets.imageIconLeo,
    Assets.imageIconVirgo,
    Assets.imageIconLibra,
    Assets.imageIconScorpio,
    Assets.imageIconSagittarius,
    Assets.imageIconCapricorn,
    Assets.imageIconAquarius,
    Assets.imageIconPisces,
  ];

  List<String> get contents => [
    LanKey.ariesIntroduction.tr,
    LanKey.taurusIntroduction.tr,
    LanKey.geminiIntroduction.tr,
    LanKey.cancerIntroduction.tr,
    LanKey.leoIntroduction.tr,
    LanKey.virgoIntroduction.tr,
    LanKey.libraIntroduction.tr,
    LanKey.scorpioIntroduction.tr,
    LanKey.sagittariusIntroduction.tr,
    LanKey.capricornIntroduction.tr,
    LanKey.aquariusIntroduction.tr,
    LanKey.piscesIntroduction.tr,
  ];

  List<String> get births => [
    "3.21-4.19",
    "4.20-5.20",
    "5.21-6.21",
    "6.22-7.22",
    "7.23-8.22",
    "8.23-9.22",
    "9.23-10.22",
    "10.24-11.22",
    "11.23-12.21",
    "12.22-1.19",
    "1.20-2.18",
    "2.20-3.20",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //constraints: BoxConstraints(minHeight: 305),
      margin: EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
        top: 20.h,
        bottom: 20.h,
      ),
      padding: EdgeInsetsDirectional.only(
        top: 20.h,
        bottom: 20.h,
        start: 16,
        end: 16,
      ),
      width: double.maxFinite,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadows: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 20,
            offset: Offset(0, 12),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 6.h),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  listTitle[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 24.sp,
                    fontFamily: AppFonts.titleFontFamily,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 3.w),
                  child: Image.asset(
                    icons[index],
                    matchTextDirection: true,
                    width: 22.r,
                    height: 22.r,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Text(
            births[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 12.sp,
              fontFamily: AppFonts.textFontFamily,
            ),
          ),
          Image.asset(
            images[index],
            matchTextDirection: true,
            width: 160,
            height: 160,
          ),
          Row(
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
                  LanKey.constellationChart.tr,
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

          Container(
            margin: EdgeInsetsDirectional.only(top: 16.h),
            width: double.maxFinite,
            child: Text(
              contents[index],
              style: TextStyle(
                color: AppColor.contentTitleColor,
                fontSize: 14.sp,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
