import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/account_entity.dart';

AccountEntity $AccountEntityFromJson(Map<String, dynamic> json) {
  final AccountEntity accountEntity = AccountEntity();
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    accountEntity.userId = userId;
  }
  final String? nickName = jsonConvert.convert<String>(json['nick_name']);
  if (nickName != null) {
    accountEntity.nickName = nickName;
  }
  final String? headimg = jsonConvert.convert<String>(json['headimg']);
  if (headimg != null) {
    accountEntity.headimg = headimg;
  }
  final int? isNewUser = jsonConvert.convert<int>(json['is_new_user']);
  if (isNewUser != null) {
    accountEntity.isNewUser = isNewUser;
  }
  final int? sex = jsonConvert.convert<int>(json['sex']);
  if (sex != null) {
    accountEntity.sex = sex;
  }
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    accountEntity.age = age;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    accountEntity.birthday = birthday;
  }
  final AccountRights? rights = jsonConvert.convert<AccountRights>(
    json['rights'],
  );
  if (rights != null) {
    accountEntity.rights = rights;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    accountEntity.status = status;
  }
  final String? interests = jsonConvert.convert<String>(json['interests']);
  if (interests != null) {
    accountEntity.interests = interests;
  }
  final String? lon = jsonConvert.convert<String>(json['lon']);
  if (lon != null) {
    accountEntity.lon = lon;
  }
  final String? lat = jsonConvert.convert<String>(json['lat']);
  if (lat != null) {
    accountEntity.lat = lat;
  }
  final List<int>? interestsIndex = (json['interestsIndex'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (interestsIndex != null) {
    accountEntity.interestsIndex = interestsIndex;
  }
  final int? loginChannel = jsonConvert.convert<int>(json['loginChannel']);
  if (loginChannel != null) {
    accountEntity.loginChannel = loginChannel;
  }
  final String? loginEmail = jsonConvert.convert<String>(json['loginEmail']);
  if (loginEmail != null) {
    accountEntity.loginEmail = loginEmail;
  }
  final int? loginStep = jsonConvert.convert<int>(json['loginStep']);
  if (loginStep != null) {
    accountEntity.loginStep = loginStep;
  }
  final String? currentRouter = jsonConvert.convert<String>(
    json['currentRouter'],
  );
  if (currentRouter != null) {
    accountEntity.currentRouter = currentRouter;
  }
  final bool? switchNotification = jsonConvert.convert<bool>(
    json['switchNotification'],
  );
  if (switchNotification != null) {
    accountEntity.switchNotification = switchNotification;
  }
  final int? birthHour = jsonConvert.convert<int>(json['birth_hour']);
  if (birthHour != null) {
    accountEntity.birthHour = birthHour;
  }
  final int? birthMinute = jsonConvert.convert<int>(json['birth_minute']);
  if (birthMinute != null) {
    accountEntity.birthMinute = birthMinute;
  }
  final String? locality = jsonConvert.convert<String>(json['locality']);
  if (locality != null) {
    accountEntity.locality = locality;
  }
  final String? authToken = jsonConvert.convert<String>(json['auth_token']);
  if (authToken != null) {
    accountEntity.authToken = authToken;
  }
  final int? expireAt = jsonConvert.convert<int>(json['expire_at']);
  if (expireAt != null) {
    accountEntity.expireAt = expireAt;
  }
  final List<String>? tags = (json['tags'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (tags != null) {
    accountEntity.tags = tags;
  }
  final String? friendId = jsonConvert.convert<String>(json['friend_id']);
  if (friendId != null) {
    accountEntity.friendId = friendId;
  }
  return accountEntity;
}

Map<String, dynamic> $AccountEntityToJson(AccountEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['user_id'] = entity.userId;
  data['nick_name'] = entity.nickName;
  data['headimg'] = entity.headimg;
  data['is_new_user'] = entity.isNewUser;
  data['sex'] = entity.sex;
  data['age'] = entity.age;
  data['birthday'] = entity.birthday;
  data['rights'] = entity.rights?.toJson();
  data['status'] = entity.status;
  data['interests'] = entity.interests;
  data['lon'] = entity.lon;
  data['lat'] = entity.lat;
  data['interestsIndex'] = entity.interestsIndex;
  data['loginChannel'] = entity.loginChannel;
  data['loginEmail'] = entity.loginEmail;
  data['loginStep'] = entity.loginStep;
  data['currentRouter'] = entity.currentRouter;
  data['switchNotification'] = entity.switchNotification;
  data['birth_hour'] = entity.birthHour;
  data['birth_minute'] = entity.birthMinute;
  data['locality'] = entity.locality;
  data['auth_token'] = entity.authToken;
  data['expire_at'] = entity.expireAt;
  data['tags'] = entity.tags;
  data['friend_id'] = entity.friendId;
  return data;
}

extension AccountEntityExtension on AccountEntity {
  AccountEntity copyWith({
    String? userId,
    String? nickName,
    String? headimg,
    int? isNewUser,
    int? sex,
    int? age,
    String? birthday,
    AccountRights? rights,
    int? status,
    String? interests,
    String? lon,
    String? lat,
    List<int>? interestsIndex,
    int? loginChannel,
    String? loginEmail,
    int? loginStep,
    String? currentRouter,
    bool? switchNotification,
    int? birthHour,
    int? birthMinute,
    String? locality,
    String? authToken,
    int? expireAt,
    List<String>? tags,
    String? friendId,
  }) {
    return AccountEntity()
      ..userId = userId ?? this.userId
      ..nickName = nickName ?? this.nickName
      ..headimg = headimg ?? this.headimg
      ..isNewUser = isNewUser ?? this.isNewUser
      ..sex = sex ?? this.sex
      ..age = age ?? this.age
      ..birthday = birthday ?? this.birthday
      ..rights = rights ?? this.rights
      ..status = status ?? this.status
      ..interests = interests ?? this.interests
      ..lon = lon ?? this.lon
      ..lat = lat ?? this.lat
      ..interestsIndex = interestsIndex ?? this.interestsIndex
      ..loginChannel = loginChannel ?? this.loginChannel
      ..loginEmail = loginEmail ?? this.loginEmail
      ..loginStep = loginStep ?? this.loginStep
      ..currentRouter = currentRouter ?? this.currentRouter
      ..switchNotification = switchNotification ?? this.switchNotification
      ..birthHour = birthHour ?? this.birthHour
      ..birthMinute = birthMinute ?? this.birthMinute
      ..locality = locality ?? this.locality
      ..authToken = authToken ?? this.authToken
      ..expireAt = expireAt ?? this.expireAt
      ..tags = tags ?? this.tags
      ..friendId = friendId ?? this.friendId;
  }
}

AccountRights $AccountRightsFromJson(Map<String, dynamic> json) {
  final AccountRights accountRights = AccountRights();
  final bool? vip = jsonConvert.convert<bool>(json['vip']);
  if (vip != null) {
    accountRights.vip = vip;
  }
  final String? vipType = jsonConvert.convert<String>(json['vip_type']);
  if (vipType != null) {
    accountRights.vipType = vipType;
  }
  final String? vipEndTime = jsonConvert.convert<String>(json['vip_end_time']);
  if (vipEndTime != null) {
    accountRights.vipEndTime = vipEndTime;
  }
  return accountRights;
}

Map<String, dynamic> $AccountRightsToJson(AccountRights entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['vip'] = entity.vip;
  data['vip_type'] = entity.vipType;
  data['vip_end_time'] = entity.vipEndTime;
  return data;
}

extension AccountRightsExtension on AccountRights {
  AccountRights copyWith({bool? vip, String? vipType, String? vipEndTime}) {
    return AccountRights()
      ..vip = vip ?? this.vip
      ..vipType = vipType ?? this.vipType
      ..vipEndTime = vipEndTime ?? this.vipEndTime;
  }
}
