import 'dart:convert';

import 'package:astrea/net/bean/country_entity.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();
  Map<String, List<CountryEntity>> countryData = {};

  @override
  void onInit() {
    super.onInit();
    //loadData();
  }

  Future<Map<String, List<CountryEntity>>> loadData() async {
    countryData.clear();
    var value = await rootBundle.loadString('assets/data/country_data.json');
    List list = json.decode(value);
    List<CountryEntity> data = list
        .map((e) => CountryEntity.fromJson(e))
        .toList();
    List<CountryEntity> countryList = await compute(
      (data) => data
        ..sort(
          (a, b) => a.name
              .toString()
              .trim()
              .substring(0, 1)
              .compareTo(b.name.toString().trim().substring(0, 1)),
        ),
      data,
    );
    countryData = countryList.groupListsBy((e) => e.firstLetter ?? "");

    return countryData;
    // List<CountryEntity> countryList = await LocationAPI.getCountryList();
    // countryData = countryList.groupListsBy((e) => e.firstLetter ?? "");
  }
}
