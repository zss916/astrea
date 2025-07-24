import 'dart:async';

import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/city_entity.dart';
import 'package:astrea/net/bean/country_entity.dart';
import 'package:astrea/net/bean/state_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';

///location
abstract class LocationAPI {
  ///获取国家列表
  static Future<List<CountryEntity>> getCountryList() async {
    try {
      var result = await Http.instance.get(ApiPath.getCountryList);
      if (result['code'] == 0) {
        List<CountryEntity> value = (result['data']['countries'] as List)
            .map((e) => CountryEntity.fromJson(e))
            .toList();
        sortFirstChar(value);
        return value;
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
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getStateList,
        query: {"country_id": countryId},
      );

      if (result['code'] == 0) {
        List<StateEntity> value = (result['data']['states'] as List)
            .map((e) => StateEntity.fromJson(e))
            .toList();
        sortFirstChar(value);
        return value;
      } else {
        AppLoading.toast("${result['msg']}");
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///获取城市列表
  static Future<List<CityEntity>> getCityList({required int stateId}) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getCityList,
        query: {"state_id": stateId},
      );
      if (result['code'] == 0) {
        List<CityEntity> value = (result['data']['cities'] as List)
            .map((e) => CityEntity.fromJson(e))
            .toList();
        sortFirstChar(value);
        return value;
      } else {
        AppLoading.toast("${result['msg']}");
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///首字母排序
  static sortFirstChar(List<dynamic> data) {
    data.sort(
      (a, b) => a.name
          .toString()
          .trim()
          .substring(0, 1)
          .compareTo(b.name.toString().trim().substring(0, 1)),
    );
  }
}
