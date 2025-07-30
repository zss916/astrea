import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/analysis_article_entity.dart';
import 'package:astrea/net/bean/analysis_entity.dart';
import 'package:astrea/net/bean/analysis_identity_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';
import 'package:dio/dio.dart';

///Synastry
abstract class SynastryAPI {
  ///查询合盘分析列表
  static Future<List<AnalysisEntity>> getAnalysisList({
    CancelToken? cancelToken,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getAnalysisList,
        cancelToken: cancelToken,
      );
      if (result["code"] == 0) {
        List<AnalysisEntity> value = (result['data'] as List)
            .map((e) => AnalysisEntity.fromJson(e))
            .toList();
        return value;
      } else {
        AppLoading.toast("${result["msg"]}");
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///更新合盘分析
  static Future<AnalysisIdentityEntity?> updateAnalysis({
    required num userId,
    required num otherId,
    required String relationship,
  }) async {
    try {
      Map<String, dynamic> map = {};
      map["first_friend_id"] = userId;
      map["second_friend_id"] = otherId;
      map["relationship"] = relationship;
      var result = await Http.instance.post(ApiPath.updateAnalysis, data: map);
      if (result["code"] == 0) {
        return AnalysisIdentityEntity.fromJson(result["data"]);
      } else {
        AppLoading.toast("${result["msg"]}");
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///查询合盘分析列表
  static Future<AnalysisArticleEntity?> getAnalysis({
    required String id,
  }) async {
    try {
      var result = await Http.instance.get("${ApiPath.getAnalysis}/$id");
      if (result["code"] == 0) {
        return AnalysisArticleEntity.fromJson(result["data"]);
      } else {
        AppLoading.toast("${result["msg"]}");
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///合盘收藏
  static Future<bool> postCollection({required String id}) async {
    try {
      var result = await Http.instance.post("${ApiPath.postCollection}/$id");
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
  static Future<bool> deleteCollection({required String id}) async {
    try {
      var result = await Http.instance.delete(
        "${ApiPath.deleteCollection}/$id",
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
