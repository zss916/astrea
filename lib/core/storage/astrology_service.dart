import 'dart:convert';

import 'package:astrea/core/storage/storage.dart';
import 'package:astrea/net/bean/natal_report_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AstrologyService extends GetxService {
  static AstrologyService get to => Get.find();

  static const String natalReportKey = "natal_report";

  NatalReportEntity? data;

  ///保存数据
  void update(NatalReportEntity value) {
    data = value;
    StorageService.to.setString(natalReportKey, jsonEncode(value.toJson()));
  }

  ///获取数据
  NatalReportEntity? getNatalValue() {
    if (data == null) {
      String? str = StorageService.to.getString(natalReportKey);
      if (str.isNotEmpty) {
        try {
          data = NatalReportEntity.fromJson(jsonDecode(str));
          return data;
        } catch (e) {
          debugPrint("$e");
          return null;
        }
      }
    } else {
      return data;
    }
    return data;
  }
}
