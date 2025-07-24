import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/components/star.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:intl/intl.dart';

class NatalChartWidget extends StatelessWidget {
  const NatalChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'luluhhhhhhhh',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: AppFonts.textFontFamily,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 6, bottom: 15),
          child: Text(
            DateFormat(
              'MMMM d,y.hh:mm a',
            ).format(DateTime.fromMillisecondsSinceEpoch(907363200 * 1000)),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 12,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Row(
          children: [
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
                              'Sagittarius',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 14.sp,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          AppStarIcon.aries,
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
                              'Pisces',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: const Color(0xFF323133) /* Color1 */,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          AppStarIcon.pisces,
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
                              'Sagittarius',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 14.sp,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          AppStarIcon.aries,
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
              decoration: ShapeDecoration(
                color: Colors.grey,
                shape: OvalBorder(side: BorderSide(width: 1)),
              ),
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
                        'Earth sign',
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
                        'Yin sign',
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
                        'Fixed sign',
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
          margin: EdgeInsetsDirectional.only(top: 6.5, bottom: 13.5),
          child: Text(
            LanKey.natalChart.tr,
            style: TextStyle(
              color: const Color(0xFF585FC4),
              fontSize: 18,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
