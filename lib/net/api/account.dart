import 'dart:async';

import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

///account
abstract class AccountAPI {
  ///获取账号信息
  static Future<AccountEntity> getAccount() async {
    try {
      var result = await Http.instance.get(ApiPath.getAccount);
      if (result["code"] == 0) {
        AccountEntity value = AccountEntity.fromJson(result["data"]);
        AccountService.to.update(value);
        return value;
      } else {
        AppLoading.toast("${result["msg"]}");
        return AccountEntity();
      }
    } catch (error) {
      return AccountEntity();
    }
  }

  ///删除账号信息
  static Future<bool> deleteAccount() async {
    try {
      var result = await Http.instance.delete(ApiPath.deleteAccount);
      return true;
    } catch (error) {
      return false;
    }
  }

  ///更新账号信息
  static Future<bool> updateAccount({
    String? nickName,
    String? birthday,
    int? birthHour,
    int? birthMinute,
    int? sex,
    String? avatar,
    String? interests,
    int? lon,
    int? lat,
    String? locality,
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

      debugPrint("map ==> ${map}");

      dynamic d = {
        "nick_name": "ytyt",
        "birthday": "2000-07-15",
        "birth_hour": 16,
        "birth_minute": 9,
        "sex": 1,
        "interests": "Money,Love,Family,Career,Friends,Business",
        "lon": 63,
        "lat": 35,
        "locality": "Afghanistan/Badghis/Ghormach",
      };

      var result = await Http.instance.patch(
        ApiPath.updateAccount,
        data: d,
        options: Options(
          sendTimeout: Duration(minutes: 5),
          receiveTimeout: Duration(minutes: 5),
          receiveDataWhenStatusError: true,
        ),
      );
      if (result["code"] != 0) {
        AppLoading.toast("${result["msg"]}");
      }
      return result["code"] == 0;
    } catch (error) {
      return false;
    }
  }
}
