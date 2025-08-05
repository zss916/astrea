import 'dart:convert';

import 'package:astrea/core/enum/app_enum.dart';
import 'package:astrea/core/utils/calculate.dart';
import 'package:astrea/generated/json/account_entity.g.dart';
import 'package:astrea/generated/json/base/json_field.dart';

export 'package:astrea/generated/json/account_entity.g.dart';

@JsonSerializable()
class AccountEntity {
  @JSONField(name: 'user_id')
  String? userId;
  @JSONField(name: 'nick_name')
  String? nickName;
  String? headimg;
  @JSONField(name: 'is_new_user')
  int? isNewUser;
  int? sex; //0 - unknown, 1 - male, 2 - female, 3 - non-binary
  int? age;
  String? birthday;
  AccountRights? rights;
  int? status;
  String? interests;
  String? lon;
  String? lat;

  ///本地存储
  List<int>? interestsIndex;

  ///登录渠道
  int? loginChannel; //0 - 邮箱，1 - google，2 -apple
  ///登录邮箱
  String? loginEmail;

  ///登录流程
  int? loginStep; //0 birth chart, 1 date of birth ...

  ///新加出生时间
  @JSONField(name: 'birth_hour')
  int? birthHour;
  @JSONField(name: 'birth_minute')
  int? birthMinute;

  ///出生地区
  String? locality;

  ///登录
  @JSONField(name: 'auth_token')
  String? authToken;
  @JSONField(name: 'expire_at')
  int? expireAt;
  List<String>? tags;

  @JSONField(name: 'friend_id')
  String? friendId;

  String? get showLocality => locality ?? "";

  ///显示生日
  String get showBirthDay {
    if ((birthday ?? "").isNotEmpty) {
      return "${CalculateTools.formattedTime("$birthday")}${(birthHour ?? 0).formatted}:${(birthMinute ?? 0).formatted} ${CalculateTools.formattedAmOrPm(birthHour ?? 0)}";
    } else {
      return "--";
    }
  }

  String get showBirthDayContent {
    if ((birthday ?? "").isNotEmpty) {
      return "${CalculateTools.formattedTime2("$birthday")}\n${(birthHour ?? 0).formatted}:${(birthMinute ?? 0).formatted} ${CalculateTools.formattedAmOrPm(birthHour ?? 0)}";
    } else {
      return "--";
    }
  }

  AccountEntity();

  factory AccountEntity.fromJson(Map<String, dynamic> json) =>
      $AccountEntityFromJson(json);

  Map<String, dynamic> toJson() => $AccountEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  bool get isNew => isNewUser == 1;

  ///新用户(没有更新用户信息)

  String get userIdStr {
    if (userId == null) {
      return '--';
    } else {
      return userId.toString();
    }
  }

  String get loginMethodStr {
    if (loginChannel == null) {
      return "";
    } else {
      return LoginChannel.getSymbol(loginChannel!);
    }
  }
}

@JsonSerializable()
class AccountRights {
  bool? vip;
  @JSONField(name: 'vip_type')
  String? vipType;
  @JSONField(name: 'vip_end_time')
  String? vipEndTime;

  AccountRights();

  factory AccountRights.fromJson(Map<String, dynamic> json) =>
      $AccountRightsFromJson(json);

  Map<String, dynamic> toJson() => $AccountRightsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
