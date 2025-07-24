import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/auth_entity.dart';

AuthEntity $AuthEntityFromJson(Map<String, dynamic> json) {
  final AuthEntity authEntity = AuthEntity();
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    authEntity.userId = userId;
  }
  final String? authToken = jsonConvert.convert<String>(json['auth_token']);
  if (authToken != null) {
    authEntity.authToken = authToken;
  }
  final int? expireAt = jsonConvert.convert<int>(json['expire_at']);
  if (expireAt != null) {
    authEntity.expireAt = expireAt;
  }
  final String? nickName = jsonConvert.convert<String>(json['nick_name']);
  if (nickName != null) {
    authEntity.nickName = nickName;
  }
  final String? headimg = jsonConvert.convert<String>(json['headimg']);
  if (headimg != null) {
    authEntity.headimg = headimg;
  }
  final int? isNewUser = jsonConvert.convert<int>(json['is_new_user']);
  if (isNewUser != null) {
    authEntity.isNewUser = isNewUser;
  }
  final int? sex = jsonConvert.convert<int>(json['sex']);
  if (sex != null) {
    authEntity.sex = sex;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    authEntity.age = age;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    authEntity.birthday = birthday;
  }
  final List<String>? tags = (json['tags'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (tags != null) {
    authEntity.tags = tags;
  }
  final AuthRights? rights = jsonConvert.convert<AuthRights>(json['rights']);
  if (rights != null) {
    authEntity.rights = rights;
  }
  final String? friendId = jsonConvert.convert<String>(json['friend_id']);
  if (friendId != null) {
    authEntity.friendId = friendId;
  }
  return authEntity;
}

Map<String, dynamic> $AuthEntityToJson(AuthEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['user_id'] = entity.userId;
  data['auth_token'] = entity.authToken;
  data['expire_at'] = entity.expireAt;
  data['nick_name'] = entity.nickName;
  data['headimg'] = entity.headimg;
  data['is_new_user'] = entity.isNewUser;
  data['sex'] = entity.sex;
  data['age'] = entity.age;
  data['birthday'] = entity.birthday;
  data['tags'] = entity.tags;
  data['rights'] = entity.rights?.toJson();
  data['friend_id'] = entity.friendId;
  return data;
}

extension AuthEntityExtension on AuthEntity {
  AuthEntity copyWith({
    String? userId,
    String? authToken,
    int? expireAt,
    String? nickName,
    String? headimg,
    int? isNewUser,
    int? sex,
    int? age,
    String? birthday,
    List<String>? tags,
    AuthRights? rights,
    String? friendId,
  }) {
    return AuthEntity()
      ..userId = userId ?? this.userId
      ..authToken = authToken ?? this.authToken
      ..expireAt = expireAt ?? this.expireAt
      ..nickName = nickName ?? this.nickName
      ..headimg = headimg ?? this.headimg
      ..isNewUser = isNewUser ?? this.isNewUser
      ..sex = sex ?? this.sex
      ..age = age ?? this.age
      ..birthday = birthday ?? this.birthday
      ..tags = tags ?? this.tags
      ..rights = rights ?? this.rights
      ..friendId = friendId ?? this.friendId;
  }
}

AuthRights $AuthRightsFromJson(Map<String, dynamic> json) {
  final AuthRights authRights = AuthRights();
  final bool? vip = jsonConvert.convert<bool>(json['vip']);
  if (vip != null) {
    authRights.vip = vip;
  }
  final String? vipType = jsonConvert.convert<String>(json['vip_type']);
  if (vipType != null) {
    authRights.vipType = vipType;
  }
  final String? vipEndTime = jsonConvert.convert<String>(json['vip_end_time']);
  if (vipEndTime != null) {
    authRights.vipEndTime = vipEndTime;
  }
  return authRights;
}

Map<String, dynamic> $AuthRightsToJson(AuthRights entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['vip'] = entity.vip;
  data['vip_type'] = entity.vipType;
  data['vip_end_time'] = entity.vipEndTime;
  return data;
}

extension AuthRightsExtension on AuthRights {
  AuthRights copyWith({bool? vip, String? vipType, String? vipEndTime}) {
    return AuthRights()
      ..vip = vip ?? this.vip
      ..vipType = vipType ?? this.vipType
      ..vipEndTime = vipEndTime ?? this.vipEndTime;
  }
}
