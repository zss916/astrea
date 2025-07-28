import 'dart:convert';

import 'package:astrea/generated/json/base/json_field.dart';
import 'package:astrea/generated/json/log_item_entity.g.dart';

export 'package:astrea/generated/json/log_item_entity.g.dart';

@JsonSerializable()
class LogItemEntity {
  @JSONField(name: "first_friend_info")
  LogItemFirstFriendInfo? firstFriendInfo;
  @JSONField(name: "second_friend_info")
  LogItemSecondFriendInfo? secondFriendInfo;
  String? relationship;

  LogItemEntity();

  factory LogItemEntity.fromJson(Map<String, dynamic> json) =>
      $LogItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $LogItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LogItemFirstFriendInfo {
  int? id;
  @JSONField(name: "user_id")
  int? userId;
  @JSONField(name: "nick_name")
  String? nickName;
  @JSONField(name: "head_img")
  String? headImg;
  int? sex;
  String? birthday;
  @JSONField(name: "birth_hour")
  int? birthHour;
  @JSONField(name: "birth_minute")
  int? birthMinute;
  String? locality;
  String? interests;
  int? lon;
  int? lat;
  @JSONField(name: "is_self")
  int? isSelf;

  LogItemFirstFriendInfo();

  factory LogItemFirstFriendInfo.fromJson(Map<String, dynamic> json) =>
      $LogItemFirstFriendInfoFromJson(json);

  Map<String, dynamic> toJson() => $LogItemFirstFriendInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LogItemSecondFriendInfo {
  int? id;
  @JSONField(name: "user_id")
  int? userId;
  @JSONField(name: "nick_name")
  String? nickName;
  @JSONField(name: "head_img")
  String? headImg;
  int? sex;
  String? birthday;
  @JSONField(name: "birth_hour")
  int? birthHour;
  @JSONField(name: "birth_minute")
  int? birthMinute;
  String? locality;
  String? interests;
  int? lon;
  int? lat;
  @JSONField(name: "is_self")
  int? isSelf;

  LogItemSecondFriendInfo();

  factory LogItemSecondFriendInfo.fromJson(Map<String, dynamic> json) =>
      $LogItemSecondFriendInfoFromJson(json);

  Map<String, dynamic> toJson() => $LogItemSecondFriendInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
