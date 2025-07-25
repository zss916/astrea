import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/home/horoscope/detail/widget/blur_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class KeywordsWidget extends StatelessWidget {
  final String luckyColor;
  final String luckyNumber;
  final String luckyGem;

  const KeywordsWidget({
    super.key,
    required this.luckyColor,
    required this.luckyNumber,
    required this.luckyGem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // buildKeywords(),
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  constraints: BoxConstraints(minHeight: 90, minWidth: 90),
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 5,
                    vertical: 14,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFAFAFA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      /*BlurWidget(
                                  isBlur: false,
                                  sigma: 6,
                                  radius: 3,
                                  child: Image.asset(Assets.imageLuckyColor,
                                      matchTextDirection: true,
                                      width: 20,
                                      height: 20)),*/
                      BlurWidget(
                        isBlur: false,
                        sigma: 6,
                        radius: 3,
                        child: Text(
                          luckyColor,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 18,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ),
                      Text(
                        LanKey.luckyColor.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF91929D),
                          fontSize: 12,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(minHeight: 90, minWidth: 90),
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 5,
                    vertical: 14,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFAFAFA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Container(
                        height: 20,
                        constraints: BoxConstraints(maxWidth: 80),
                        child: BlurWidget(
                          isBlur: false,
                          sigma: 6,
                          radius: 3,
                          child: Text(
                            luckyNumber,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        LanKey.luckyNumber.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF91929D),
                          fontSize: 12,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(minHeight: 90, minWidth: 90),
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 5,
                    vertical: 14,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFAFAFA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Container(
                        height: 20,
                        constraints: BoxConstraints(maxWidth: 80),
                        child: BlurWidget(
                          isBlur: false,
                          sigma: 6,
                          radius: 3,
                          child: AutoSizeText(
                            luckyGem,
                            maxLines: 1,
                            maxFontSize: 16,
                            minFontSize: 16,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppFonts.textFontFamily,
                              color: const Color(0xFF323133),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        LanKey.luckyGem.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF91929D),
                          fontSize: 12,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildKeywords() => BlurWidget(
    isBlur: false,
    child: Container(
      margin: EdgeInsetsDirectional.symmetric(vertical: 17.h),
      width: double.maxFinite,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: LanKey.keywords.tr,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 18,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Health',
              style: TextStyle(
                color: const Color(0xFF585FC4),
                fontSize: 18,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
