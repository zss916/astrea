import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/home/horoscope/detail/widget/blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailItem extends StatelessWidget {
  final int index;
  final String info;
  final String content;
  final String icon;

  const DetailItem({
    super.key,
    required this.index,
    required this.info,
    required this.content,
    required this.icon,
  });

  /*List<String> get titles => [
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
  ];*/

  List<String> get titles => [
    LanKey.mercury.tr,
    LanKey.venus.tr,
    LanKey.mars.tr,
    LanKey.jupiter.tr,
    LanKey.saturn.tr,
    LanKey.uranus.tr,
    LanKey.neptune.tr,
    LanKey.pluto.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        BlurWidget(
          isBlur: false,
          child: Container(
            padding: EdgeInsetsDirectional.all(2),
            width: double.maxFinite,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${titles[index]}\n',
                              style: TextStyle(
                                color: AppColor.textTitleColor,
                                fontSize: 24.sp,
                                fontFamily: AppFonts.titleFontFamily,
                              ),
                            ),
                            TextSpan(
                              text: info,
                              style: TextStyle(
                                color: AppColor.textTitleColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: AppFonts.subTitleFontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      width: 44,
                      height: 44,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 14.h),
                  width: double.maxFinite,
                  child: Text(
                    content,
                    style: TextStyle(
                      color: AppColor.contentTitleColor,
                      fontSize: 14.sp,
                      fontFamily: AppFonts.textFontFamily,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        PositionedDirectional(
          top: 2,
          end: 2,
          child: Image.asset(
            icon,
            matchTextDirection: true,
            width: 44,
            height: 44,
          ),
        ),
      ],
    );
  }
}
