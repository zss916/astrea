import 'package:astrea/core/storage/astrology_service.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/natal_report_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';

///Astrology
abstract class AstrologyAPI {
  ///查询出生星盘分析报告
  static Future<(bool, NatalReportEntity)> getAstrologyReport({
    required String id,
  }) async {
    try {
      dynamic response = await Http.instance.get(
        ApiPath.getNatalReport,
        query: {"friend_id": id},
      );

      if (response["code"] == 0) {
        AstrologyService;

        return (true, NatalReportEntity.fromJson(response["data"]));
      } else {
        AppLoading.toast(response["msg"]);
        return (false, NatalReportEntity());
      }
    } catch (error) {
      return (false, NatalReportEntity());
    }
  }
}
