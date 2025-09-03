import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/natal_report_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

///Astrology
abstract class AstrologyAPI {
  ///查询出生星盘分析报告
  static Future<(bool, NatalReportEntity)> getAstrologyReport({
    required String id,
    CancelToken? cancelToken,
    Function()? onError,
  }) async {
    try {
      Map<String, dynamic> response = await Http.instance.get(
        ApiPath.getNatalReport,
        query: {"friend_id": id},
        cancelToken: cancelToken,
      );

      if (response["code"] == 0) {
        NatalReportEntity value = await compute(
          (dynamic jsonStr) => NatalReportEntity.fromJson(jsonStr),
          response["data"],
        );
        return (true, value);
      } else {
        if (onError == null) {
          AppLoading.toast(response["msg"]);
        } else {
          onError.call();
        }
        return (false, NatalReportEntity());
      }
    } catch (error) {
      return (false, NatalReportEntity());
    }
  }

  // 添加一个标志来控制轮询
  static bool _shouldStopPolling = false;

  static void stopPolling() {
    _shouldStopPolling = true;
  }

  ///获取natal报告
  static Future<(bool isSuccessful, NatalReportEntity report)>
  loopAndReturnReport({
    required String id,
    CancelToken? cancelToken,
    int maxRetries = 20,
    Function? onError,
  }) async {
    _shouldStopPolling = false; // 重置轮询标志
    debugPrint("loopReport start");
    try {
      bool isLoop = true;
      int attempt = 0;
      do {
        attempt++;
        debugPrint("loopReport attempt:$attempt");

        final connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult.contains(ConnectivityResult.none)) {
          AppLoading.toast("Network connection failed");
          //onError?.call();
          return (false, NatalReportEntity());
        }
        final (
          bool success,
          NatalReportEntity report,
        ) = await getAstrologyReport(
          id: id,
          cancelToken: cancelToken,
          onError: () {
            onError?.call();
          },
        );
        if (_shouldStopPolling) {
          debugPrint("Analysis _shouldStopPolling:$_shouldStopPolling");
          return (false, NatalReportEntity());
        }
        isLoop = (report.done != true);
        debugPrint("loopReport isLoop:$isLoop");
        if (!isLoop) {
          debugPrint("loopReport successful");
          return (true, report); // 成功时返回true和报告
        } else {
          debugPrint("loopReport next");
          await Future.delayed(Duration(seconds: 3));
          /*if (attempt >= maxRetries) {
            debugPrint("loopReport maxRetries:$attempt");
            return (false, report); // 达到最大重试次数时返回false和最新报告
          }*/
        }
      } while (isLoop);
      return (false, NatalReportEntity());
    } catch (e) {
      debugPrint("loopReport error: $e");
      return (false, NatalReportEntity());
    }
  }
}
