import 'dart:convert';

import 'package:flutter/services.dart';

/// 加载json文件
Future<Map<String, dynamic>> loadJsonFromAssetsToMap(String filePath) async {
  String jsonString = await rootBundle.loadString(filePath);
  return jsonDecode(jsonString);
}

/// 加载json文件
Future<List> loadJsonFromAssetsToList(String filePath) async {
  String jsonString = await rootBundle.loadString(filePath);
  return jsonDecode(jsonString);
}
