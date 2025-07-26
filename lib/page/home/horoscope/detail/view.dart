part of 'index.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  final bool isShowVip = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(
        title: LanKey.analysis.tr,
        actions: [
          //buildShareAction(),
        ],
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

  Widget buildShareAction() => Container(
    margin: const EdgeInsetsDirectional.only(end: 24),
    child: GestureDetector(
      onTap: () {
        showShareSheet();
      },
      child: Image.asset(
        Assets.imageShare,
        matchTextDirection: true,
        width: 24,
        height: 24,
      ),
    ),
  );

  Widget buildOpenVip() => PositionedDirectional(
    bottom: 0,
    start: 0,
    end: 0,
    child: BottomStackBtn(
      title: LanKey.openVip.tr,
      padding: EdgeInsetsDirectional.only(bottom: 24.h, top: 70.h),
      onTap: () {
        //todo
      },
    ),
  );

  Widget buildBody(AnalysisLogic logic) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsetsDirectional.only(
              top: 16,
              bottom: 16,
              start: 5.w,
              end: 5.w,
            ),
            margin: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 20,
              bottom: 12,
            ),
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
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                PositionedDirectional(
                  bottom: 0,
                  start: 12,
                  end: 12,
                  child: Image.asset(
                    Assets.imageBottomTexture3,
                    matchTextDirection: true,
                  ),
                ),
                Column(
                  children: [
                    NatalChart(
                      isShow: false,
                      nickName: logic.nickName,
                      showBirthday: logic.showBirthday,
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
                    ),
                    //  FreeUnlockingCard(),
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
                      margin: EdgeInsetsDirectional.only(start: 11, end: 11),
                      width: double.maxFinite,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //todo
                          if (logic.sunSignInterpretation.isNotEmpty)
                            buildInterpretation(
                              titleIcon: LanKey.sunSignTitleIcon.tr,
                              title: LanKey.sunSignTitle.tr,
                              logic.sunSignInterpretation,
                            ),
                          //buildAddFriend(),
                          if (logic.moonSignInterpretation.isNotEmpty)
                            buildInterpretation(
                              titleIcon: LanKey.moonSignTitleIcon.tr,
                              title: LanKey.moonSignTitle.tr,
                              logic.sunSignInterpretation,
                            ),
                          // buildRelationShip(),
                          if (logic.ascendantSignInterpretation.isNotEmpty)
                            buildInterpretation(
                              titleIcon: LanKey.ascendantSignTitleIcon.tr,
                              title: LanKey.ascendantSignTitle.tr,
                              logic.ascendantSignInterpretation,
                            ),
                          // buildToAnalysis()
                        ],
                      ),
                    ),
                    Divider(height: 30, color: Colors.transparent),
                  ],
                ),
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

  Widget buildAddFriend() => Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        debugPrint('tap');
        //todo
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 8, bottom: 8),
        width: double.maxFinite,
        child: Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            children: [
              TextSpan(
                text: 'Add friends',
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontSize: 16,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  height: 1.62,
                ),
              ),
              TextSpan(
                text: ' to see who’s similar',
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontSize: 16,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                  height: 1.62,
                ),
              ),
              WidgetSpan(
                child: SizedBox(
                  width: 17,
                  height: 17,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        Assets.imageEndArrow,
                        matchTextDirection: true,
                        width: 17,
                        height: 7,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget buildRelationShip() => Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        debugPrint('tap');
        //todo
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 8, bottom: 8),
        width: double.maxFinite,
        child: Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            children: [
              TextSpan(
                text: '🔮 You relationship analysis',
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.62,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
              WidgetSpan(
                child: SizedBox(
                  width: 17,
                  height: 17,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        Assets.imageEndArrow,
                        matchTextDirection: true,
                        width: 17,
                        height: 7,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget buildToAnalysis() => Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        debugPrint('tap');
        //todo
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 8, bottom: 8),
        width: double.maxFinite,
        child: Text.rich(
          textAlign: TextAlign.start,
          TextSpan(
            children: [
              TextSpan(
                text: '🪐 House analysis and influence analysis',
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.62,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
              WidgetSpan(
                child: SizedBox(
                  width: 17,
                  height: 17,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        Assets.imageEndArrow,
                        matchTextDirection: true,
                        width: 17,
                        height: 7,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget buildAnalysisTitle() => Container(
    width: double.maxFinite,
    margin: EdgeInsetsDirectional.only(top: 16, start: 11, end: 11),
    child: Text(
      LanKey.personalityAnalysis.tr,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: const Color(0xFF323133),
        fontSize: 18,
        fontFamily: AppFonts.textFontFamily,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  Widget buildInterpretation(
    String intro, {
    required String titleIcon,
    required String title,
  }) => Container(
    margin: EdgeInsetsDirectional.only(top: 8),
    width: double.maxFinite,
    child: Text.rich(
      //overflow: TextOverflow.ellipsis,
      TextSpan(
        children: [
          TextSpan(
            text: titleIcon,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.textFontFamily,
              height: 1.62,
            ),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
              color: const Color(0xFF585FC4),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.textFontFamily,
              height: 1.62,
            ),
          ),
          TextSpan(
            text: intro,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.textFontFamily,
              height: 1.62,
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
    margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 12, bottom: 20),
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
        if (pluto != null) buildCommonDivider(),

        Container(
          margin: EdgeInsetsDirectional.only(top: 0.h),
          child: Image.asset(
            Assets.imageAnalysisBottom,
            matchTextDirection: true,
          ),
        ),
      ],
    ),
  );

  Widget buildCommonDivider() => Container(
    width: double.maxFinite,
    margin: EdgeInsetsDirectional.only(top: 14, bottom: 14),
    child: SvgPicture.asset(Assets.svgItemLine),
  );

  Widget old() => ListView.separated(
    shrinkWrap: true,
    itemCount: 8,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) =>
        DetailItem(index: index, info: '', content: '', icon: ""),
    separatorBuilder: (context, index) => Container(
      width: double.maxFinite,
      margin: EdgeInsetsDirectional.only(top: 14, bottom: 14),
      child: SvgPicture.asset(Assets.svgItemLine),
    ),
  );

  Widget buildChat() =>
      AstrologerChatBtn(margin: EdgeInsetsDirectional.only(top: 28));
}
