import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/analysis_article_entity.dart';
import 'package:astrea/net/bean/analysis_entity.dart';
import 'package:astrea/net/bean/analysis_identity_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

///Synastry
abstract class SynastryAPI {
  ///查询合盘分析列表
  static Future<(bool, List<AnalysisEntity>)> getAnalysisList({
    CancelToken? cancelToken,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getAnalysisList,
        /*options: Options(
          sendTimeout: Duration(seconds: 50),
          receiveTimeout: Duration(seconds: 50),
        ),*/
        cancelToken: cancelToken,
      );
      if (result["code"] == 0) {
        List<AnalysisEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => AnalysisEntity.fromJson(e)).toList(),
          (result['data'] as List),
        );
        return (true, value);
      } else {
        AppLoading.toast("${result["msg"]}");
        return (false, <AnalysisEntity>[]);
      }
    } catch (error) {
      return (false, <AnalysisEntity>[]);
    }
  }

  ///更新合盘分析
  static Future<(bool, AnalysisIdentityEntity?)> updateAnalysis({
    required num userId,
    required num otherId,
    required String relationship,
    CancelToken? cancelToken,
  }) async {
    try {
      Map<String, dynamic> map = {};
      map["first_friend_id"] = userId;
      map["second_friend_id"] = otherId;
      map["relationship"] = relationship;
      var result = await Http.instance.post(
        ApiPath.updateAnalysis,
        data: map,
        cancelToken: cancelToken,
      );
      if (result["code"] == 0) {
        return (true, AnalysisIdentityEntity.fromJson(result["data"]));
      } else {
        AppLoading.toast("${result["msg"]}");
        return (false, null);
      }
    } catch (error) {
      return (false, null);
    }
  }

  // 添加一个标志来控制轮询
  static bool _shouldStopPolling = false;

  static void stopPolling() {
    _shouldStopPolling = true;
  }

  ///查询合盘分析报告
  static Future<(bool isSuccessful, AnalysisIdentityEntity? value)>
  loopAndReturnAnalysis({
    required num userId,
    required num otherId,
    required String relationship,
    CancelToken? cancelToken,
    int maxRetries = 100,
  }) async {
    _shouldStopPolling = false; // 重置轮询标志
    debugPrint("Analysis start");
    try {
      bool isLoop = true;
      int attempt = 0;
      do {
        attempt++;
        debugPrint("Analysis attempt:$attempt");
        final (
          bool success,
          AnalysisIdentityEntity? value,
        ) = await updateAnalysis(
          userId: userId,
          otherId: otherId,
          relationship: relationship,
          cancelToken: cancelToken,
        );
        if (_shouldStopPolling) {
          debugPrint("Analysis _shouldStopPolling:$_shouldStopPolling");
          return (false, null);
        }

        isLoop = (value?.done != true);
        debugPrint("Analysis isLoop:$isLoop");
        if (!isLoop) {
          debugPrint("Analysis successful");
          return (true, value); // 成功时返回true和报告
        } else {
          debugPrint("Analysis next");
          await Future.delayed(Duration(seconds: 2));
          /* if (attempt >= maxRetries) {
            debugPrint("Analysis maxRetries:$attempt");
            return (false, null); // 达到最大重试次数时返回false和最新报告
          }*/
        }
      } while (isLoop);
      // 理论上不会执行到这里，因为所有路径都已返回
      return (false, null);
    } catch (e) {
      debugPrint("loopReport error: $e");
      return (false, null); // 错误时返回false和空报告
    }
  }

  ///查询合盘分析列表
  static Future<AnalysisArticleEntity?> getAnalysis({
    required String id,
    CancelToken? cancelToken,
  }) async {
    try {
      var result = await Http.instance.get(
        "${ApiPath.getAnalysis}/$id",
        cancelToken: cancelToken,
      );
      if (result["code"] == 0) {
        AnalysisArticleEntity value = await compute(
          (dynamic jsonStr) => AnalysisArticleEntity.fromJson(jsonStr),
          result["data"],
        );
        return value;
      } else {
        AppLoading.toast("${result["msg"]}");
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///合盘收藏
  static Future<bool> postCollection({
    required String id,
    CancelToken? cancelToken,
  }) async {
    try {
      var result = await Http.instance.post(
        "${ApiPath.postCollection}/$id",
        cancelToken: cancelToken,
      );
      if (result["code"] == 0) {
        return true;
      } else {
        AppLoading.toast("${result["msg"]}");
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  ///合盘取消收藏
  static Future<bool> deleteCollection({
    required String id,
    CancelToken? cancelToken,
  }) async {
    try {
      var result = await Http.instance.delete(
        "${ApiPath.deleteCollection}/$id",
        cancelToken: cancelToken,
      );
      if (result["code"] == 0) {
        return true;
      } else {
        AppLoading.toast("${result["msg"]}");
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
