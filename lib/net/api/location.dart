import 'dart:async';
import 'dart:convert';

import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/net/bean/city_entity.dart';
import 'package:astrea/net/bean/country_entity.dart';
import 'package:astrea/net/bean/state_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

///location
abstract class LocationAPI {
  ///获取本地国家列表
  static Future<List<CountryEntity>> getLocalCountryList() async {
    String value = await rootBundle.loadString(Assets.dataCountryData);
    List list = json.decode(value) as List;
    List<CountryEntity> lists = list
        .map((e) => CountryEntity.fromJson(e))
        .toList();
    List<CountryEntity> data = await compute(
      (data) => data
        ..sort(
          (a, b) => a.name
              .toString()
              .trim()
              .substring(0, 1)
              .compareTo(b.name.toString().trim().substring(0, 1)),
        ),
      lists,
    );
    return data;
  }

  ///获取国家列表
  static Future<List<CountryEntity>> getCountryList({
    CancelToken? cancelToken,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getCountryList,
        cancelToken: cancelToken,
      );
      if (result['code'] == 0) {
        List<CountryEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => CountryEntity.fromJson(e)).toList(),
          (result['data']['countries'] as List),
        );

        List<CountryEntity> list = await compute(
          (data) => data
            ..sort(
              (a, b) => a.name
                  .toString()
                  .trim()
                  .substring(0, 1)
                  .compareTo(b.name.toString().trim().substring(0, 1)),
            ),
          value,
        );
        return list;
      } else {
        AppLoading.toast("${result['msg']}");
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///获取省列表
  static Future<List<StateEntity>> getStateList({
    required int countryId,
    CancelToken? cancelToken,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getStateList,
        query: {"country_id": countryId},
        cancelToken: cancelToken,
      );

      if (result['code'] == 0) {
        List<StateEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => StateEntity.fromJson(e)).toList(),
          (result['data']['states'] as List),
        );

        List<StateEntity> list = await compute(
          (data) => data
            ..sort(
              (a, b) => a.name
                  .toString()
                  .trim()
                  .substring(0, 1)
                  .compareTo(b.name.toString().trim().substring(0, 1)),
            ),
          value,
        );
        return list;
      } else {
        AppLoading.toast("Request Failed");
        return [];
      }
    } catch (error) {
      AppLoading.toast("Request Failed");
      return [];
    }
  }

  ///获取城市列表
  static Future<List<CityEntity>> getCityList({
    required int stateId,
    CancelToken? cancelToken,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getCityList,
        query: {"state_id": stateId},
        cancelToken: cancelToken,
      );
      if (result['code'] == 0) {
        List<CityEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => CityEntity.fromJson(e)).toList(),
          (result['data']['cities'] as List),
        );

        List<CityEntity> list = await compute(
          (data) => data
            ..sort(
              (a, b) => a.name
                  .toString()
                  .trim()
                  .substring(0, 1)
                  .compareTo(b.name.toString().trim().substring(0, 1)),
            ),
          value,
        );
        return list;
      } else {
        AppLoading.toast("Request Failed");
        return [];
      }
    } catch (error) {
      AppLoading.toast("Request Failed");
      return [];
    }
  }

  ///首字母排序
  static List<dynamic> sortFirstChar(List<dynamic> data) {
    return data..sort(
      (a, b) => a.name
          .toString()
          .trim()
          .substring(0, 1)
          .compareTo(b.name.toString().trim().substring(0, 1)),
    );
  }
}
