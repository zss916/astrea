import 'package:astrea/components/star.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/api/astro.dart';
import 'package:astrea/net/bean/natal_report_entity.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

mixin HoroscopeReportLogicMixin on GetxController {
  CancelToken reportCancelToken = CancelToken();
  NatalReportEntity? data;

  ///星盘
  String get natalChartImage => data?.natalChartImg ?? "";
  //String get natalChartImage => "https://img.alicdn.com/imgextra/i4/O1CN01Z5paLz1O0zuCC7osS_!!6000000001644-55-tps-83-82.svg";
  String get sunSign => data?.natalChartResult?.sunSign ?? "";
  String? get sunSignIcon => AppStarIcon.selectSign(sunSign);
  String get moonSign => data?.natalChartResult?.moonSign ?? "";
  String? get moonSignIcon => AppStarIcon.selectSign(moonSign);
  String get ascendantSign => data?.natalChartResult?.ascendantSign ?? "";
  String? get ascendantSignIcon => AppStarIcon.selectSign(ascendantSign);
  String get element => data?.natalChartResult?.element ?? "";
  String get form => data?.natalChartResult?.form ?? "";
  String get ruler => data?.natalChartResult?.ruler ?? "";
  String? get rulerIcon => AppStarIcon.select(ruler);

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

  String get todayLove => data?.predicationAnalysisResult?.today?.love ?? "";
  String get todayCareer =>
      data?.predicationAnalysisResult?.today?.career ?? "";
  String get todayWealth =>
      data?.predicationAnalysisResult?.today?.wealth ?? "";

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

  @override
  void onInit() {
    super.onInit();
    // AstrologyService.to.getNatalValue();
  }

  @override
  void onClose() {
    super.onClose();
    reportCancelToken.cancel("report cancel");
    AstrologyAPI.stopPolling();
    AppLoading.dismiss();
  }

  Future<(bool, NatalReportEntity)> loadAstrologyReport({
    required String reportId,
  }) async {
    final (bool isSuccessful, NatalReportEntity report) =
        await AstrologyAPI.loopAndReturnReport(
          id: reportId,
          cancelToken: reportCancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });

    /* (bool, NatalReportEntity) result = await AstrologyAPI.getAstrologyReport(
      id: reportId,
      cancelToken: reportCancelToken,
    ).whenComplete(() => AppLoading.dismiss());*/

    if (isSuccessful) {
      data = report;
      update();
    }
    return (isSuccessful, report);
  }
}
