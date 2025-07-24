import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_content/content/free_unlocking_card.dart';

class PersonalityAnalysis extends StatelessWidget {
  const PersonalityAnalysis({super.key});
  final bool isVersion = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isVersion) FreeUnlockingCard(),
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
        Material(
          color: Colors.transparent,
          child: InkWell(
            // highlightColor: Color(0x1A585FC4),
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              PageTools.toStarChartAnalysis();
            },
            child: Column(
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
                          text:
                              'Falling into the 1st house: Outstanding personal charm, natural elegance, and sociable skills become personal .......',
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
          ),
        ),
      ],
    );
  }
}
