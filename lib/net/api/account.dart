import 'dart:async';

import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

///account
abstract class AccountAPI {
  ///获取账号信息
  static Future<AccountEntity?> getAccount({
    CancelToken? cancelToken,
    bool isCache = true,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getAccount,
        cancelToken: cancelToken,
      );
      if (result["code"] == 0) {
        AccountEntity value = await compute(
          (jsonStr) => AccountEntity.fromJson(jsonStr),
          result["data"],
        );
        // AccountEntity value = AccountEntity.fromJson(result["data"]);
        if (isCache) AccountService.to.update(value);
        return value;
      } else {
        AppLoading.toast("${result["msg"]}");
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///删除账号信息
  static Future<bool> deleteAccount({CancelToken? cancelToken}) async {
    try {
      var result = await Http.instance.delete(
        ApiPath.deleteAccount,
        cancelToken: cancelToken,
      );
      return true;
    } catch (error) {
      return false;
    }
  }

  ///更新账号信息
  static Future<bool> updateAccount({
    String? nickName,
    required String? birthday,
    int? birthHour,
    int? birthMinute,
    int? sex,
    String? avatar,
    String? interests,
    int? lon,
    int? lat,
    String? locality,
    CancelToken? cancelToken,
  }) async {
    try {
      Map<String, dynamic> map = {};
      if (nickName != null) {
        map["nick_name"] = nickName;
      }

      if (birthday != null) {
        map["birthday"] = birthday;
      }

      if (birthHour != null) {
        map["birth_hour"] = birthHour;
      }

      if (birthMinute != null) {
        map["birth_minute"] = birthMinute;
      }

      if (sex != null) {
        map["sex"] = sex;
      }

      if (avatar != null) {
        map["headimg"] = avatar;
      }

      if (interests != null) {
        map["interests"] = interests;
      }

      if (lon != null) {
        map["lon"] = lon;
      }

      if (lat != null) {
        map["lat"] = lat;
      }

      if (locality != null) {
        map["locality"] = locality;
      }

      //debugPrint("map => ${map}");

      var result = await Http.instance.patch(
        ApiPath.updateAccount,
        data: map,
        cancelToken: cancelToken,
      );
      if (result["code"] != 0) {
        AppLoading.toast("${result["msg"]}");
      }
      return result["code"] == 0;
    } catch (error) {
      return false;
    }
  }

  ///根据设备ID查询用户
  static Future<bool> fetchDevice({
    String? deviceId,
    CancelToken? cancelToken,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.postDevice,
        query: {"did": deviceId},
        cancelToken: cancelToken,
      );
      if (result["code"] == 0 && result["data"] != null) {
        return result["data"]["user_id"] != 0;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
