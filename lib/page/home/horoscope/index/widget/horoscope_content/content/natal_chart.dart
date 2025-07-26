import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
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
            color: Colors.black,
            fontSize: 20,
            fontFamily: AppFonts.textFontFamily,
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 6, bottom: 15),
          child: Text(
            showBirthday,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 12,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              sunSign,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 14.sp,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          if ((sunSignIcon ?? "").isNotEmpty)
                            Image.asset(
                              sunSignIcon ?? '',
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
                              moonSign,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: const Color(0xFF323133) /* Color1 */,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          if ((moonSignIcon ?? "").isNotEmpty)
                            Image.asset(
                              moonSignIcon ?? '',
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
                              ascendantSign,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 14.sp,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          if ((ascendantSignIcon ?? "").isNotEmpty)
                            Image.asset(
                              ascendantSignIcon ?? '',
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
              decoration: BoxDecoration(
                color: Color(0x1A000000),
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

            /*Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
              width: 130.w,
              height: 130.w,
              decoration: logic.natalChartImage.isEmpty
                  ? BoxDecoration()
                  : BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(200),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          "https://img.alicdn.com/imgextra/i4/O1CN01Z5paLz1O0zuCC7osS_!!6000000001644-55-tps-83-82.svg",
                        ),
                      ),
                    ),
              */
            /*decoration: ShapeDecoration(
                color: Colors.transparent,
                shape: OvalBorder(side: BorderSide(width: 1)),
              ),*/
            /*
            ),*/
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
                        element,
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
                        ruler,
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
