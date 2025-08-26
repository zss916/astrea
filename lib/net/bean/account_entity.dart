import 'dart:convert';

import 'package:astrea/core/enum/app_enum.dart';
import 'package:astrea/core/utils/calculate.dart';
import 'package:astrea/generated/json/account_entity.g.dart';
import 'package:astrea/generated/json/base/json_field.dart';
import 'package:awesome_datetime_picker/awesome_datetime_picker.dart';

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

  ///当前路由
  String? currentRouter;

  ///通知
  bool? switchNotification;

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
      return "${CalculateTools.formattedTime2("$birthday")} ${(birthHour ?? 0).formatted}:${(birthMinute ?? 0).formatted} ${CalculateTools.formattedAmOrPm(birthHour ?? 0)}";
    } else {
      return "--";
    }
  }

  AwesomeDateTime? getAwesomeDateTime() {
    List<String> value = (birthday ?? "").split("-");
    if (value.isNotEmpty) {
      return AwesomeDateTime(
        date: AwesomeDate(
          year: int.parse(value[0]),
          month: int.parse(value[1]),
          day: int.parse(value[2]),
        ),
        time: AwesomeTime(hour: birthHour ?? 0, minute: birthMinute ?? 0),
      );
    } else {
      return null;
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

  ///是否是新用户
  bool get isNew => (isNewUser ?? 1) == 1;

  ///新用户(没有更新用户信息)

  String get showID =>
      maskNumber((int.parse((userId ?? "0")) * 5 + 200000).toString());

  String maskNumber(String input) {
    if (input.isEmpty) return input;
    final firstTwo = input.substring(0, 2);
    final lastOne = input.substring(input.length - 1);
    final masked = '$firstTwo${'*' * (input.length - 3)}$lastOne';
    return masked;
  }

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
