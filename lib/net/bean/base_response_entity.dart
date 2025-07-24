import 'dart:convert';

import 'package:astrea/generated/json/base/json_field.dart';
import 'package:astrea/generated/json/base_response_entity.g.dart';

export 'package:astrea/generated/json/base_response_entity.g.dart';

@JsonSerializable()
class BaseResponseEntity {
  int? code;
  String? msg;
  dynamic data;

  BaseResponseEntity();

  factory BaseResponseEntity.fromJson(Map<String, dynamic> json) =>
      $BaseResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $BaseResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BaseResponseData {
  BaseResponseData();

  factory BaseResponseData.fromJson(Map<String, dynamic> json) =>
      $BaseResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $BaseResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
