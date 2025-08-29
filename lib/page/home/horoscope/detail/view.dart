part of 'index.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  final bool isShowVip = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(
        title: LanKey.natalChartInterpretation.tr,
        // actions: [buildShareAction(),],
      ),
      backgroundColor: AppColor.pageBackground,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          GetBuilder<AnalysisLogic>(
            init: AnalysisLogic(),
            builder: (logic) => buildBody(logic),
          ),
          // if (isShowVip) buildOpenVip(),
        ],
      ),
    );
  }

  Widget buildBody(AnalysisLogic logic) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsetsDirectional.only(
              top: 16.h,
              bottom: 16.h,
              start: 5.w,
              end: 5.w,
            ),
            margin: EdgeInsetsDirectional.only(
              start: 16.w,
              end: 16.w,
              top: 10.h,
              bottom: 12.h,
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
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
            child: Column(
              children: [
                NatalChart(
                  isShow: false,
                  nickName: logic.nickName ?? "",
                  showBirthday: logic.showBirthday ?? "",
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
                //  FreeUnlockingCard(),
                SizedBox(height: 25.h),
                KeywordsWidget(
                  luckyColor: logic.luckyColor,
                  luckyNumber: logic.luckyNumber,
                  luckyGem: logic.luckyGem,
                ),
                if (logic.sunSignInterpretation.isNotEmpty &&
                    logic.moonSignInterpretation.isNotEmpty &&
                    logic.ascendantSignInterpretation.isNotEmpty)
                  buildAnalysisTitle(),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 11.w, end: 11.w),
                  width: double.maxFinite,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //todo
                      if (logic.sunSignInterpretation.isNotEmpty)
                        buildInterpretation2(
                          titleIcon: Assets.imageTitleSunS,
                          title: LanKey.sunSign.tr,
                          logic.sunSignInterpretation,
                        ),

                      //buildAddFriend(),
                      if (logic.moonSignInterpretation.isNotEmpty)
                        buildInterpretation2(
                          titleIcon: Assets.imageMoonIcon,
                          title: LanKey.moonSign.tr,
                          logic.moonSignInterpretation,
                        ),

                      // buildRelationShip(),
                      if (logic.ascendantSignInterpretation.isNotEmpty)
                        buildInterpretation2(
                          // titleIcon: LanKey.ascendantSignTitleIcon.tr,
                          titleIcon: Assets.imageRisingIcon,
                          title: LanKey.ascendant.tr,
                          logic.ascendantSignInterpretation,
                          showLine: false,
                        ),
                      // buildToAnalysis()
                    ],
                  ),
                ),
                Divider(height: 13.h, color: Colors.transparent),
              ],
            ),
          ),
          buildListView(
            mercury: logic.mercury,
            venus: logic.venus,
            mars: logic.mars,
            jupiter: logic.jupiter,
            saturn: logic.saturn,
            uranus: logic.uranus,
            neptune: logic.neptune,
            pluto: logic.pluto,
          ),
        ],
      ),
    );
  }

  Widget buildAnalysisTitle() => Container(
    width: double.maxFinite,
    margin: EdgeInsetsDirectional.only(top: 25.h, start: 11.w, end: 11.w),
    child: Row(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(end: 10.w),
          child: Image.asset(
            Assets.imageAnalysisTitleIcon,
            matchTextDirection: true,
            width: 35,
            height: 24,
          ),
        ),

        Expanded(
          child: AutoSizeText(
            LanKey.personalityAnalysis.tr,
            textAlign: TextAlign.center,
            maxLines: 1,
            maxFontSize: 24,
            minFontSize: 18,
            style: TextStyle(
              color: const Color(0xFF323133),
              fontSize: 24.sp,
              fontFamily: AppFonts.titleFontFamily,
            ),
          ),
        ),

        Container(
          margin: EdgeInsetsDirectional.only(start: 10.w),
          child: Image.asset(
            Assets.imageAnalysisTitleIcon2,
            matchTextDirection: true,
            width: 35,
            height: 24,
          ),
        ),
      ],
    ),
  );

  Widget buildInterpretation2(
    String intro, {
    required String titleIcon,
    required String title,
    bool showLine = true,
  }) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        margin: EdgeInsetsDirectional.only(top: 16.h),
        width: double.maxFinite,
        child: Row(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 11),
              child: Image.asset(titleIcon, width: 24, height: 24),
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColor.textTitleColor,
                  fontSize: 18.sp,
                  fontFamily: AppFonts.subTitleFontFamily,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsetsDirectional.only(top: 6.h, start: 35),
        width: double.maxFinite,
        child: Text(
          intro,
          softWrap: true,
          style: TextStyle(
            color: AppColor.contentTitleColor,
            fontSize: 14.sp,
            fontFamily: AppFonts.textFontFamily,
          ),
        ),
      ),
      if (showLine)
        Container(
          margin: EdgeInsetsDirectional.only(top: 20.h, start: 35),
          child: DottedDashedLine(
            height: 0,
            dashSpace: 8.w,
            dashWidth: 12.w,
            width: double.maxFinite,
            dashColor: Color(0xFFD9D9D9),
            axis: Axis.horizontal,
          ),
        ),
    ],
  );

  Widget buildInterpretation(
    String intro, {
    required String titleIcon,
    required String title,
  }) => Container(
    margin: EdgeInsetsDirectional.only(top: 16.h),
    width: double.maxFinite,
    child: Text.rich(
      //overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: const Color(0xFF6A676C),
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.textFontFamily,
        height: 1.62.h,
      ),
      TextSpan(
        children: [
          /*TextSpan(
            text: titleIcon,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.textFontFamily,
              height: 1.62,
            ),
          ),*/
          WidgetSpan(
            child: Container(
              margin: EdgeInsetsDirectional.only(end: 4.w),
              child: Image.asset(
                titleIcon,
                matchTextDirection: true,
                width: 16,
                height: 18,
              ),
            ),
          ),

          TextSpan(
            text: title,
            style: TextStyle(
              color: const Color(0xFF585FC4),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.textFontFamily,
              height: 1.62.h,
            ),
          ),
          TextSpan(
            text: intro,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.textFontFamily,
              height: 1.62.h,
            ),
          ),
        ],
      ),
    ),
  );

  Widget buildListView({
    NatalReportNatalChartReportPlanetsMercury? mercury,
    NatalReportNatalChartReportPlanetsVenus? venus,
    NatalReportNatalChartReportPlanetsMars? mars,
    NatalReportNatalChartReportPlanetsJupiter? jupiter,
    NatalReportNatalChartReportPlanetsSaturn? saturn,
    NatalReportNatalChartReportPlanetsUranus? uranus,
    NatalReportNatalChartReportPlanetsNeptune? neptune,
    NatalReportNatalChartReportPlanetsPluto? pluto,
  }) => Container(
    width: double.maxFinite,
    padding: EdgeInsetsDirectional.all(14),
    margin: EdgeInsetsDirectional.only(
      start: 16.w,
      end: 16.w,
      top: 24.h,
      bottom: 20.h,
    ),
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
    child: Column(
      children: [
        if (mercury != null)
          DetailItem(
            index: 0,
            info: mercury.showPlanetInfo,
            content: mercury.showInterpretation,
            icon: mercury.showIcon,
          ),
        if (mercury != null) buildCommonDivider(),

        if (venus != null)
          DetailItem(
            index: 1,
            info: venus.showPlanetInfo,
            content: venus.showInterpretation,
            icon: venus.showIcon,
          ),
        if (venus != null) buildCommonDivider(),

        if (mars != null)
          DetailItem(
            index: 2,
            info: mars.showPlanetInfo,
            content: mars.showInterpretation,
            icon: mars.showIcon,
          ),
        if (mars != null) buildCommonDivider(),

        if (jupiter != null)
          DetailItem(
            index: 3,
            info: jupiter.showPlanetInfo,
            content: jupiter.showInterpretation,
            icon: jupiter.showIcon,
          ),
        if (jupiter != null) buildCommonDivider(),

        if (saturn != null)
          DetailItem(
            index: 4,
            info: saturn.showPlanetInfo,
            content: saturn.showInterpretation,
            icon: saturn.showIcon,
          ),
        if (saturn != null) buildCommonDivider(),

        if (uranus != null)
          DetailItem(
            index: 5,
            info: uranus.showPlanetInfo,
            content: uranus.showInterpretation,
            icon: uranus.showIcon,
          ),
        if (uranus != null) buildCommonDivider(),

        if (neptune != null)
          DetailItem(
            index: 6,
            info: neptune.showPlanetInfo,
            content: neptune.showInterpretation,
            icon: neptune.showIcon,
          ),
        if (neptune != null) buildCommonDivider(),

        if (pluto != null)
          DetailItem(
            index: 7,
            info: pluto.showPlanetInfo,
            content: pluto.showInterpretation,
            icon: pluto.showIcon,
          ),
      ],
    ),
  );

  Widget buildCommonDivider() => Container(
    width: double.maxFinite,
    margin: EdgeInsetsDirectional.only(top: 24.h, bottom: 24.h),
    child: DottedDashedLine(
      height: 0,
      dashSpace: 8.w,
      dashWidth: 12.w,
      width: double.maxFinite,
      dashColor: Color(0xFFD9D9D9),
      axis: Axis.horizontal,
    ),
  );
}
