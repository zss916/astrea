import 'package:flutter/material.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/horoscope/index/logic.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_content/content/natal_chart.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_content/content/personality_analysis.dart';

class HoroscopeContent extends StatelessWidget {
  final HoroscopeLogic logic;
  const HoroscopeContent({super.key, required this.logic});

  final bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        start: 20,
        end: 20,
        top: 20,
        bottom: 20,
      ),
      padding: EdgeInsetsDirectional.all(16),
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
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          if (isShow)
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: Image.asset(
                Assets.imageBottomTexture,
                matchTextDirection: true,
              ),
            ),
          Column(
            children: [
              NatalChart(isShow: isShow, logic: logic),
              //todo
              if (isShow) PersonalityAnalysis(),
            ],
          ),
        ],
      ),
    );
  }
}
