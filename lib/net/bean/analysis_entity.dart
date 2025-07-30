import 'dart:convert';

import 'package:astrea/generated/json/analysis_entity.g.dart';
import 'package:astrea/generated/json/base/json_field.dart';

@JsonSerializable()
class AnalysisEntity {
  @JSONField(name: "first_friend_info")
  AnalysisFirstFriendInfo? firstFriendInfo;
  @JSONField(name: "second_friend_info")
  AnalysisSecondFriendInfo? secondFriendInfo;
  String? relationship;
  int? id;

  AnalysisEntity();

  factory AnalysisEntity.fromJson(Map<String, dynamic> json) =>
      $AnalysisEntityFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AnalysisFirstFriendInfo {
  num? id;
  @JSONField(name: "user_id")
  num? userId;
  @JSONField(name: "nick_name")
  String? nickName;
  @JSONField(name: "head_img")
  String? headImg;
  double? sex;
  String? birthday;
  @JSONField(name: "birth_hour")
  double? birthHour;
  @JSONField(name: "birth_minute")
  double? birthMinute;
  String? locality;
  String? interests;
  double? lon;
  double? lat;
  @JSONField(name: "is_self")
  double? isSelf;

  AnalysisFirstFriendInfo();

  factory AnalysisFirstFriendInfo.fromJson(Map<String, dynamic> json) =>
      $AnalysisFirstFriendInfoFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisFirstFriendInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AnalysisSecondFriendInfo {
  double? id;
  @JSONField(name: "user_id")
  double? userId;
  @JSONField(name: "nick_name")
  String? nickName;
  @JSONField(name: "head_img")
  String? headImg;
  double? sex;
  String? birthday;
  @JSONField(name: "birth_hour")
  double? birthHour;
  @JSONField(name: "birth_minute")
  double? birthMinute;
  String? locality;
  String? interests;
  double? lon;
  double? lat;
  @JSONField(name: "is_self")
  double? isSelf;

  AnalysisSecondFriendInfo();

  factory AnalysisSecondFriendInfo.fromJson(Map<String, dynamic> json) =>
      $AnalysisSecondFriendInfoFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisSecondFriendInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
