import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/horoscope/index/logic.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_content/content/natal_chart.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_content/content/personality_analysis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoroscopeContent extends StatelessWidget {
  final HoroscopeLogic logic;
  const HoroscopeContent({super.key, required this.logic});

  final bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageTools.toStarChartAnalysis(
          data: logic.data,
          nickName: logic.name,
          birthday: logic.birthday,
        );
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(
          start: 16,
          end: 16,
          top: 20,
          bottom: 20,
        ),
        padding: EdgeInsetsDirectional.only(
          top: 16,
          bottom: 16,
          start: 5.w,
          end: 5.w,
        ),
        width: double.maxFinite,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 20,
              offset: Offset(0, 12),
              spreadRadius: 0,
            ),
          ],
        ),
        child: buildContent(),
      ),
    );
  }

  Widget buildContent() {
    return Column(
      children: [
        NatalChart(
          isShow: isShow,
          nickName: logic.name,
          showBirthday: logic.birthday,
          sunSign: logic.sunSign,
          sunSignIcon: logic.sunSignIcon,
          moonSign: logic.moonSign,
          moonSignIcon: logic.moonSignIcon,
          ascendantSign: logic.ascendantSign,
          ascendantSignIcon: logic.ascendantSignIcon,
          natalChartImage: logic.natalChartImage,
          element: logic.element,
          ruler: logic.ruler,
          form: logic.form,
          rulerSignIcon: logic.rulerIcon,
        ),
        // FreeUnlockingCard(),
        if (isShow) PersonalityAnalysis(logic: logic),
      ],
    );
  }

  Widget buildContent2() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        if (isShow)
          PositionedDirectional(
            bottom: 0,
            start: 12.w,
            end: 12.w,
            child: Image.asset(
              Assets.imageBottomTexture,
              matchTextDirection: true,
            ),
          ),
        Column(
          children: [
            NatalChart(
              isShow: isShow,
              nickName: logic.name,
              showBirthday: logic.birthday,
              sunSign: logic.sunSign,
              sunSignIcon: logic.sunSignIcon,
              moonSign: logic.moonSign,
              moonSignIcon: logic.moonSignIcon,
              ascendantSign: logic.ascendantSign,
              ascendantSignIcon: logic.ascendantSignIcon,
              natalChartImage: logic.natalChartImage,
              element: logic.element,
              ruler: logic.ruler,
              form: logic.form,
              rulerSignIcon: logic.rulerIcon,
            ),
            // FreeUnlockingCard(),
            if (isShow) PersonalityAnalysis(logic: logic),
          ],
        ),
      ],
    );
  }

  /* Widget bu() => Stack(
    alignment: AlignmentDirectional.center,
    children: [
      if (logic.viewState == 0) buildContent(),
      if (logic.viewState == 1) buildRefresh(logic),
      if (logic.viewState == 2) buildLoading(),
    ],
  );*/
}
