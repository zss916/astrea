import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/page/home/horoscope/detail/widget/blur_widget.dart';
import 'package:flutter/material.dart';

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
    "Mercury",
    "Venus",
    "Mars",
    "Jupiter",
    "Saturn",
    "Uranus",
    "Neptune",
    "Pluto",
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
                                color: const Color(0xFF323133),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                            TextSpan(
                              text: info,
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: AppFonts.textFontFamily,
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
                  margin: EdgeInsetsDirectional.only(top: 14),
                  width: double.maxFinite,
                  child: Text(
                    content,
                    style: TextStyle(
                      color: const Color(0xFF91929D),
                      fontSize: 16,
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
