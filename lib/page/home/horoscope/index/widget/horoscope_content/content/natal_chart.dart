import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/home/horoscope/index/logic.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NatalChart extends StatelessWidget {
  final bool isShow;
  final HoroscopeLogic logic;
  const NatalChart({super.key, required this.isShow, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          logic.nickName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: AppFonts.textFontFamily,
          ),
        ),
        InkWell(
          onTap: () {
            logic.loadAccount();
          },
          child: Container(
            margin: EdgeInsetsDirectional.only(top: 6, bottom: 15),
            child: Text(
              logic.showBirthday,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF6A676C),
                fontSize: 12,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ),
        ),
        Row(
          children: [
            /*Image.network(
              "https://s3.ap-south-1.amazonaws.com/western-chart/254e6ec0-67a4-11f0-9c43-1190c2fb8802.svg",
              width: 50,
              height: 50,
            ),*/
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FittedBox(
                        child: Text(
                          LanKey.sunSign.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF91929D),
                            fontSize: 12.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              logic.sunSign,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 14.sp,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          if ((logic.sunSignIcon ?? "").isNotEmpty)
                            Image.asset(
                              logic.sunSignIcon ?? '',
                              width: 14,
                              height: 14,
                              matchTextDirection: true,
                            ),
                          // AppStarIcon.aries,
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Colors.transparent, height: 9),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FittedBox(
                        child: Text(
                          LanKey.moonSign.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF91929D),
                            fontSize: 12.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              logic.moonSign,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: const Color(0xFF323133) /* Color1 */,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          if ((logic.moonSignIcon ?? "").isNotEmpty)
                            Image.asset(
                              logic.moonSignIcon ?? '',
                              width: 14,
                              height: 14,
                              matchTextDirection: true,
                            ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: Colors.transparent, height: 9),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FittedBox(
                        child: Text(
                          LanKey.ascendant.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF91929D),
                            fontSize: 12.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              logic.ascendantSign,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 14.sp,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          if ((logic.ascendantSignIcon ?? "").isNotEmpty)
                            Image.asset(
                              logic.ascendantSignIcon ?? '',
                              width: 14,
                              height: 14,
                              matchTextDirection: true,
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
              width: 160.w,
              height: 160.w,
              decoration: logic.natalChartImage.isEmpty
                  ? BoxDecoration()
                  : BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(200),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          "https://s3.ap-south-1.amazonaws.com/western-chart/254e6ec0-67a4-11f0-9c43-1190c2fb8802.svg",
                        ),
                      ),
                    ),
              /*decoration: ShapeDecoration(
                color: Colors.transparent,
                shape: OvalBorder(side: BorderSide(width: 1)),
              ),*/
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          LanKey.element.tr,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color(0xFF91929D),
                            fontSize: 12.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ),
                      Text(
                        logic.element,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 14.sp,
                          fontFamily: AppFonts.textFontFamily,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.transparent, height: 9),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          LanKey.attribute.tr,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color(0xFF91929D),
                            fontSize: 12.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ),
                      Text(
                        logic.ruler,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 14.sp,
                          fontFamily: AppFonts.textFontFamily,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.transparent, height: 9),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          LanKey.form.tr,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color(0xFF91929D),
                            fontSize: 12.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ),
                      Text(
                        logic.form,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 14.sp,
                          fontFamily: AppFonts.textFontFamily,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsetsDirectional.all(10),
          margin: EdgeInsetsDirectional.only(
            top: 6.5,
            bottom: isShow ? 13.5 : 0,
          ),
          child: Text(
            LanKey.natalChart.tr,
            style: TextStyle(
              color: const Color(0xFF585FC4),
              fontSize: 18,
              fontFamily: AppFonts.textFontFamily,
            ),
          ),
        ),
      ],
    );
  }
}
