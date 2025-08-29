import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NatalChart extends StatelessWidget {
  final bool isShow;
  final String nickName;
  final String showBirthday;
  final String sunSign;
  final String? sunSignIcon;
  final String moonSign;
  final String? moonSignIcon;
  final String ascendantSign;
  final String? ascendantSignIcon;
  final String natalChartImage;
  final String element;
  final String ruler;
  final String form;
  final String? rulerSignIcon;

  const NatalChart({
    super.key,
    required this.isShow,
    required this.showBirthday,
    required this.nickName,
    required this.sunSign,
    required this.moonSign,
    required this.ascendantSign,
    this.sunSignIcon,
    this.moonSignIcon,
    this.ascendantSignIcon,
    this.rulerSignIcon,
    required this.natalChartImage,
    required this.element,
    required this.ruler,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nickName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColor.textTitleColor,
            fontSize: 24.sp,
            fontFamily: AppFonts.titleFontFamily,
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 6.h, bottom: 28.h),
          child: Text(
            showBirthday,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 12.sp,
              fontFamily: AppFonts.textFontFamily,
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
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if ((sunSignIcon ?? "").isNotEmpty)
                              Image.asset(
                                sunSignIcon ?? '',
                                width: 14.r,
                                height: 14.r,
                                matchTextDirection: true,
                              ),
                            SizedBox(width: 3.w),
                            Text(
                              sunSign,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 14.sp,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                            // AppStarIcon.aries,
                          ],
                        ),
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
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if ((moonSignIcon ?? "").isNotEmpty)
                              Image.asset(
                                moonSignIcon ?? '',
                                width: 14.r,
                                height: 14.r,
                                matchTextDirection: true,
                              ),
                            SizedBox(width: 3.w),
                            Text(
                              moonSign,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: const Color(0xFF323133) /* Color1 */,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
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
                          LanKey.element.tr,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: const Color(0xFF91929D),
                            fontSize: 12.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ),
                      Text(
                        element,
                        textAlign: TextAlign.end,
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
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(Assets.imageLogoDefaultIcon),
                ),
                borderRadius: BorderRadiusDirectional.circular(100),
              ),
              width: 130.w,
              height: 130.w,
              margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
              child: SvgPicture.network(
                natalChartImage,
                width: 130.w,
                height: 130.w,
                placeholderBuilder: (_) => SizedBox(),
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
                          LanKey.ascendant.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF91929D),
                            fontSize: 12.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ascendantSign,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 14.sp,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                            SizedBox(width: 3.w),

                            if ((ascendantSignIcon ?? "").isNotEmpty)
                              Image.asset(
                                ascendantSignIcon ?? '',
                                width: 14.r,
                                height: 14.r,
                                matchTextDirection: true,
                              ),
                          ],
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

                      FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ruler,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 14.sp,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                            SizedBox(width: 3.w),
                            if ((rulerSignIcon ?? "").isNotEmpty)
                              Image.asset(
                                rulerSignIcon ?? '',
                                width: 14.r,
                                height: 14.r,
                                matchTextDirection: true,
                              ),
                          ],
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
                        form,
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
            bottom: isShow ? 13.h : 0,
          ),
          child: Text(
            LanKey.natalChart.tr,
            style: TextStyle(
              color: const Color(0xFF585FC4),
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.textFontFamily,
            ),
          ),
        ),
      ],
    );
  }
}
