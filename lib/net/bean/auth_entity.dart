import 'dart:convert';

import 'package:astrea/generated/json/auth_entity.g.dart';
import 'package:astrea/generated/json/base/json_field.dart';

@JsonSerializable()
class AuthEntity {
  @JSONField(name: 'user_id')
  String? userId;
  @JSONField(name: 'auth_token')
  String? authToken;
  @JSONField(name: 'expire_at')
  int? expireAt;
  @JSONField(name: 'nick_name')
  String? nickName;
  String? headimg;
  @JSONField(name: 'is_new_user')
  int? isNewUser; //1 是新用户
  int? sex; //0 - unknown, 1 - male, 2 - female, 3 - non-binary
  int? age;
  String? birthday;
  List<String>? tags;
  AuthRights? rights;
  @JSONField(name: 'friend_id')
  String? friendId;

  bool get checkNewUser => (isNewUser ?? 1) == 1;

  AuthEntity();

  factory AuthEntity.fromJson(Map<String, dynamic> json) =>
      $AuthEntityFromJson(json);

  Map<String, dynamic> toJson() => $AuthEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AuthRights {
  bool? vip; //是否vip
  @JSONField(name: 'vip_type')
  String? vipType; //0 - 非会员, 1 - 试用会员, 2 - 正式会员, 3 - 过期会员
  @JSONField(name: 'vip_end_time')
  String? vipEndTime; //会员到期时间

  AuthRights();

  factory AuthRights.fromJson(Map<String, dynamic> json) =>
      $AuthRightsFromJson(json);

  Map<String, dynamic> toJson() => $AuthRightsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
