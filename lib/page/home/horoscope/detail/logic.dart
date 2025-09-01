part of 'index.dart';

class AnalysisLogic extends GetxController {
  NatalReportEntity? data;

  ///账户
  String? nickName;
  String? showBirthday;

  ///星盘
  String get natalChartImage => data?.natalChartImg ?? "";
  String get sunSign => data?.natalChartResult?.sunSign ?? "";
  String? get sunSignIcon => AppStarIcon.selectSign(sunSign);
  String get moonSign => data?.natalChartResult?.moonSign ?? "";
  String? get moonSignIcon => AppStarIcon.selectSign(moonSign);
  String get ascendantSign => data?.natalChartResult?.ascendantSign ?? "";
  String? get ascendantSignIcon => AppStarIcon.selectSign(ascendantSign);
  String? get rulerIcon => AppStarIcon.select(ruler);

  String get element => data?.natalChartResult?.element ?? "";
  String get form => data?.natalChartResult?.form ?? "";
  String get ruler => data?.natalChartResult?.ruler ?? "";
  String get luckyColor2 =>
      GetUtils.capitalize(data?.natalChartResult?.luckColor ?? "--") ?? "--";
  String get luckyColor => data?.natalChartResult?.luckColor ?? "--";
  String get luckyNumber => data?.natalChartResult?.luckNumber ?? "--";
  String get luckyGem2 =>
      GetUtils.capitalize(data?.natalChartResult?.luckGemstone ?? "--") ?? "--";
  String get luckyGem => data?.natalChartResult?.luckGemstone ?? "--";

  ///三大主行
  String get sunSignInterpretation =>
      data?.natalChartReport?.threeMainStars?.sun?.interpretation ?? "";
  String get moonSignInterpretation =>
      data?.natalChartReport?.threeMainStars?.moon?.interpretation ?? "";
  String get ascendantSignInterpretation =>
      data?.natalChartReport?.threeMainStars?.ascendant?.interpretation ?? "";

  ///yesterday
  String get yesterdaySummary =>
      data?.predicationAnalysisResult?.yesterday?.summary ?? "";

  ///today
  String get todaySummary =>
      data?.predicationAnalysisResult?.today?.summary ?? "";
  String get todayShould => data?.predicationAnalysisResult?.today?.dod ?? "";
  String get todayAvoid => data?.predicationAnalysisResult?.today?.avoid ?? "";
  int get loveValue => data?.predicationAnalysisResult?.today?.score?.love ?? 0;
  int get careerValue =>
      data?.predicationAnalysisResult?.today?.score?.career ?? 0;
  int get wealthValue =>
      data?.predicationAnalysisResult?.today?.score?.wealth ?? 0;
  String get todayGuide =>
      data?.predicationAnalysisResult?.today?.luckBoostingTip ?? "";

  ///tomorrow
  String get tomorrowSummary =>
      data?.predicationAnalysisResult?.tomorrow?.summary ?? "";
  String get tomorrowGuide =>
      data?.predicationAnalysisResult?.tomorrow?.luckBoostingTip ?? "";

  /// week
  String get weekSummary =>
      data?.predicationAnalysisResult?.week?.summary ?? "";

  String get weekGuide =>
      data?.predicationAnalysisResult?.week?.luckBoostingTip ?? "";

  /// month
  String get monthSummary =>
      data?.predicationAnalysisResult?.month?.summary ?? "";

  /// year
  String get yearSummary =>
      data?.predicationAnalysisResult?.year?.summary ?? "";

  ///行星
  List<NatalReportNatalChartReportPlanets> get planetList =>
      data?.natalChartReport?.planets ?? [];
  NatalReportNatalChartReportPlanetsMercury? get mercury =>
      planetList.first.mercury;
  NatalReportNatalChartReportPlanetsVenus? get venus => planetList.first.venus;
  NatalReportNatalChartReportPlanetsMars? get mars => planetList.first.mars;
  NatalReportNatalChartReportPlanetsJupiter? get jupiter =>
      planetList.first.jupiter;
  NatalReportNatalChartReportPlanetsSaturn? get saturn =>
      planetList.first.saturn;
  NatalReportNatalChartReportPlanetsUranus? get uranus =>
      planetList.first.uranus;
  NatalReportNatalChartReportPlanetsNeptune? get neptune =>
      planetList.first.neptune;
  NatalReportNatalChartReportPlanetsPluto? get pluto => planetList.first.pluto;

  @override
  void onInit() {
    super.onInit();
    initLocalData();
  }

  void initLocalData() {
    if (Get.arguments != null && Get.arguments is NatalReportEntity) {
      data = Get.arguments as NatalReportEntity;
      update();
    }
    if (Get.parameters['nickName'] != null) {
      nickName = Get.parameters['nickName'];
      update();
    }
    if (Get.parameters['birthday'] != null) {
      showBirthday = Get.parameters['birthday'];
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }
}
