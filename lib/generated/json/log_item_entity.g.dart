import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/log_item_entity.dart';

LogItemEntity $LogItemEntityFromJson(Map<String, dynamic> json) {
  final LogItemEntity logItemEntity = LogItemEntity();
  final LogItemFirstFriendInfo? firstFriendInfo = jsonConvert
      .convert<LogItemFirstFriendInfo>(json['first_friend_info']);
  if (firstFriendInfo != null) {
    logItemEntity.firstFriendInfo = firstFriendInfo;
  }
  final LogItemSecondFriendInfo? secondFriendInfo = jsonConvert
      .convert<LogItemSecondFriendInfo>(json['second_friend_info']);
  if (secondFriendInfo != null) {
    logItemEntity.secondFriendInfo = secondFriendInfo;
  }
  final String? relationship = jsonConvert.convert<String>(
    json['relationship'],
  );
  if (relationship != null) {
    logItemEntity.relationship = relationship;
  }
  return logItemEntity;
}

Map<String, dynamic> $LogItemEntityToJson(LogItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['first_friend_info'] = entity.firstFriendInfo?.toJson();
  data['second_friend_info'] = entity.secondFriendInfo?.toJson();
  data['relationship'] = entity.relationship;
  return data;
}

extension LogItemEntityExtension on LogItemEntity {
  LogItemEntity copyWith({
    LogItemFirstFriendInfo? firstFriendInfo,
    LogItemSecondFriendInfo? secondFriendInfo,
    String? relationship,
  }) {
    return LogItemEntity()
      ..firstFriendInfo = firstFriendInfo ?? this.firstFriendInfo
      ..secondFriendInfo = secondFriendInfo ?? this.secondFriendInfo
      ..relationship = relationship ?? this.relationship;
  }
}

LogItemFirstFriendInfo $LogItemFirstFriendInfoFromJson(
  Map<String, dynamic> json,
) {
  final LogItemFirstFriendInfo logItemFirstFriendInfo =
      LogItemFirstFriendInfo();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    logItemFirstFriendInfo.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    logItemFirstFriendInfo.userId = userId;
  }
  final String? nickName = jsonConvert.convert<String>(json['nick_name']);
  if (nickName != null) {
    logItemFirstFriendInfo.nickName = nickName;
  }
  final String? headImg = jsonConvert.convert<String>(json['head_img']);
  if (headImg != null) {
    logItemFirstFriendInfo.headImg = headImg;
  }
  final int? sex = jsonConvert.convert<int>(json['sex']);
  if (sex != null) {
    logItemFirstFriendInfo.sex = sex;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    logItemFirstFriendInfo.birthday = birthday;
  }
  final int? birthHour = jsonConvert.convert<int>(json['birth_hour']);
  if (birthHour != null) {
    logItemFirstFriendInfo.birthHour = birthHour;
  }
  final int? birthMinute = jsonConvert.convert<int>(json['birth_minute']);
  if (birthMinute != null) {
    logItemFirstFriendInfo.birthMinute = birthMinute;
  }
  final String? locality = jsonConvert.convert<String>(json['locality']);
  if (locality != null) {
    logItemFirstFriendInfo.locality = locality;
  }
  final String? interests = jsonConvert.convert<String>(json['interests']);
  if (interests != null) {
    logItemFirstFriendInfo.interests = interests;
  }
  final int? lon = jsonConvert.convert<int>(json['lon']);
  if (lon != null) {
    logItemFirstFriendInfo.lon = lon;
  }
  final int? lat = jsonConvert.convert<int>(json['lat']);
  if (lat != null) {
    logItemFirstFriendInfo.lat = lat;
  }
  final int? isSelf = jsonConvert.convert<int>(json['is_self']);
  if (isSelf != null) {
    logItemFirstFriendInfo.isSelf = isSelf;
  }
  return logItemFirstFriendInfo;
}

Map<String, dynamic> $LogItemFirstFriendInfoToJson(
  LogItemFirstFriendInfo entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['nick_name'] = entity.nickName;
  data['head_img'] = entity.headImg;
  data['sex'] = entity.sex;
  data['birthday'] = entity.birthday;
  data['birth_hour'] = entity.birthHour;
  data['birth_minute'] = entity.birthMinute;
  data['locality'] = entity.locality;
  data['interests'] = entity.interests;
  data['lon'] = entity.lon;
  data['lat'] = entity.lat;
  data['is_self'] = entity.isSelf;
  return data;
}

extension LogItemFirstFriendInfoExtension on LogItemFirstFriendInfo {
  LogItemFirstFriendInfo copyWith({
    int? id,
    int? userId,
    String? nickName,
    String? headImg,
    int? sex,
    String? birthday,
    int? birthHour,
    int? birthMinute,
    String? locality,
    String? interests,
    int? lon,
    int? lat,
    int? isSelf,
  }) {
    return LogItemFirstFriendInfo()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..nickName = nickName ?? this.nickName
      ..headImg = headImg ?? this.headImg
      ..sex = sex ?? this.sex
      ..birthday = birthday ?? this.birthday
      ..birthHour = birthHour ?? this.birthHour
      ..birthMinute = birthMinute ?? this.birthMinute
      ..locality = locality ?? this.locality
      ..interests = interests ?? this.interests
      ..lon = lon ?? this.lon
      ..lat = lat ?? this.lat
      ..isSelf = isSelf ?? this.isSelf;
  }
}

LogItemSecondFriendInfo $LogItemSecondFriendInfoFromJson(
  Map<String, dynamic> json,
) {
  final LogItemSecondFriendInfo logItemSecondFriendInfo =
      LogItemSecondFriendInfo();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    logItemSecondFriendInfo.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    logItemSecondFriendInfo.userId = userId;
  }
  final String? nickName = jsonConvert.convert<String>(json['nick_name']);
  if (nickName != null) {
    logItemSecondFriendInfo.nickName = nickName;
  }
  final String? headImg = jsonConvert.convert<String>(json['head_img']);
  if (headImg != null) {
    logItemSecondFriendInfo.headImg = headImg;
  }
  final int? sex = jsonConvert.convert<int>(json['sex']);
  if (sex != null) {
    logItemSecondFriendInfo.sex = sex;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    logItemSecondFriendInfo.birthday = birthday;
  }
  final int? birthHour = jsonConvert.convert<int>(json['birth_hour']);
  if (birthHour != null) {
    logItemSecondFriendInfo.birthHour = birthHour;
  }
  final int? birthMinute = jsonConvert.convert<int>(json['birth_minute']);
  if (birthMinute != null) {
    logItemSecondFriendInfo.birthMinute = birthMinute;
  }
  final String? locality = jsonConvert.convert<String>(json['locality']);
  if (locality != null) {
    logItemSecondFriendInfo.locality = locality;
  }
  final String? interests = jsonConvert.convert<String>(json['interests']);
  if (interests != null) {
    logItemSecondFriendInfo.interests = interests;
  }
  final int? lon = jsonConvert.convert<int>(json['lon']);
  if (lon != null) {
    logItemSecondFriendInfo.lon = lon;
  }
  final int? lat = jsonConvert.convert<int>(json['lat']);
  if (lat != null) {
    logItemSecondFriendInfo.lat = lat;
  }
  final int? isSelf = jsonConvert.convert<int>(json['is_self']);
  if (isSelf != null) {
    logItemSecondFriendInfo.isSelf = isSelf;
  }
  return logItemSecondFriendInfo;
}

Map<String, dynamic> $LogItemSecondFriendInfoToJson(
  LogItemSecondFriendInfo entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['nick_name'] = entity.nickName;
  data['head_img'] = entity.headImg;
  data['sex'] = entity.sex;
  data['birthday'] = entity.birthday;
  data['birth_hour'] = entity.birthHour;
  data['birth_minute'] = entity.birthMinute;
  data['locality'] = entity.locality;
  data['interests'] = entity.interests;
  data['lon'] = entity.lon;
  data['lat'] = entity.lat;
  data['is_self'] = entity.isSelf;
  return data;
}

extension LogItemSecondFriendInfoExtension on LogItemSecondFriendInfo {
  LogItemSecondFriendInfo copyWith({
    int? id,
    int? userId,
    String? nickName,
    String? headImg,
    int? sex,
    String? birthday,
    int? birthHour,
    int? birthMinute,
    String? locality,
    String? interests,
    int? lon,
    int? lat,
    int? isSelf,
  }) {
    return LogItemSecondFriendInfo()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..nickName = nickName ?? this.nickName
      ..headImg = headImg ?? this.headImg
      ..sex = sex ?? this.sex
      ..birthday = birthday ?? this.birthday
      ..birthHour = birthHour ?? this.birthHour
      ..birthMinute = birthMinute ?? this.birthMinute
      ..locality = locality ?? this.locality
      ..interests = interests ?? this.interests
      ..lon = lon ?? this.lon
      ..lat = lat ?? this.lat
      ..isSelf = isSelf ?? this.isSelf;
  }
}
