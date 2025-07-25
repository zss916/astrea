import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/home/horoscope/index/logic.dart';
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
              margin: EdgeInsetsDirectional.only(top: isVersion ? 16 : 0),
              child: Text(
                LanKey.personalityAnalysis.tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 18,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
            ),
          if (logic.sunSignInterpretation.isNotEmpty)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8),
                  width: double.maxFinite,
                  child: Text.rich(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '☀️ ',
                          style: TextStyle(
                            color: const Color(0xFF6A676C),
                            fontSize: 16,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                        TextSpan(
                          text: 'Sun sign: ',
                          style: TextStyle(
                            color: const Color(0xFF585FC4),
                            fontSize: 16,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                        TextSpan(
                          text: logic.sunSignInterpretation,
                          style: TextStyle(
                            color: const Color(0xFF6A676C),
                            fontSize: 16,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(bottom: 22),
                  padding: EdgeInsetsDirectional.only(top: 8, bottom: 8),
                  width: double.maxFinite,
                  child: Text(
                    '${LanKey.all.tr}>>>',
                    style: TextStyle(
                      color: const Color(0xFF585FC4),
                      fontSize: 16,
                      fontFamily: AppFonts.textFontFamily,
                    ),
                  ),
                ),
              ],
            ),
          if (logic.sunSignInterpretation.isEmpty) SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
