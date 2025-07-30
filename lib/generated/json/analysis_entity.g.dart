import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/analysis_entity.dart';

AnalysisEntity $AnalysisEntityFromJson(Map<String, dynamic> json) {
  final AnalysisEntity analysisEntity = AnalysisEntity();
  final AnalysisFirstFriendInfo? firstFriendInfo = jsonConvert
      .convert<AnalysisFirstFriendInfo>(json['first_friend_info']);
  if (firstFriendInfo != null) {
    analysisEntity.firstFriendInfo = firstFriendInfo;
  }
  final AnalysisSecondFriendInfo? secondFriendInfo = jsonConvert
      .convert<AnalysisSecondFriendInfo>(json['second_friend_info']);
  if (secondFriendInfo != null) {
    analysisEntity.secondFriendInfo = secondFriendInfo;
  }
  final String? relationship = jsonConvert.convert<String>(
    json['relationship'],
  );
  if (relationship != null) {
    analysisEntity.relationship = relationship;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    analysisEntity.id = id;
  }
  return analysisEntity;
}

Map<String, dynamic> $AnalysisEntityToJson(AnalysisEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['first_friend_info'] = entity.firstFriendInfo?.toJson();
  data['second_friend_info'] = entity.secondFriendInfo?.toJson();
  data['relationship'] = entity.relationship;
  data['id'] = entity.id;
  return data;
}

extension AnalysisEntityExtension on AnalysisEntity {
  AnalysisEntity copyWith({
    AnalysisFirstFriendInfo? firstFriendInfo,
    AnalysisSecondFriendInfo? secondFriendInfo,
    String? relationship,
    int? id,
  }) {
    return AnalysisEntity()
      ..firstFriendInfo = firstFriendInfo ?? this.firstFriendInfo
      ..secondFriendInfo = secondFriendInfo ?? this.secondFriendInfo
      ..relationship = relationship ?? this.relationship
      ..id = id ?? this.id;
  }
}

AnalysisFirstFriendInfo $AnalysisFirstFriendInfoFromJson(
  Map<String, dynamic> json,
) {
  final AnalysisFirstFriendInfo analysisFirstFriendInfo =
      AnalysisFirstFriendInfo();
  final num? id = jsonConvert.convert<num>(json['id']);
  if (id != null) {
    analysisFirstFriendInfo.id = id;
  }
  final num? userId = jsonConvert.convert<num>(json['user_id']);
  if (userId != null) {
    analysisFirstFriendInfo.userId = userId;
  }
  final String? nickName = jsonConvert.convert<String>(json['nick_name']);
  if (nickName != null) {
    analysisFirstFriendInfo.nickName = nickName;
  }
  final String? headImg = jsonConvert.convert<String>(json['head_img']);
  if (headImg != null) {
    analysisFirstFriendInfo.headImg = headImg;
  }
  final double? sex = jsonConvert.convert<double>(json['sex']);
  if (sex != null) {
    analysisFirstFriendInfo.sex = sex;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    analysisFirstFriendInfo.birthday = birthday;
  }
  final double? birthHour = jsonConvert.convert<double>(json['birth_hour']);
  if (birthHour != null) {
    analysisFirstFriendInfo.birthHour = birthHour;
  }
  final double? birthMinute = jsonConvert.convert<double>(json['birth_minute']);
  if (birthMinute != null) {
    analysisFirstFriendInfo.birthMinute = birthMinute;
  }
  final String? locality = jsonConvert.convert<String>(json['locality']);
  if (locality != null) {
    analysisFirstFriendInfo.locality = locality;
  }
  final String? interests = jsonConvert.convert<String>(json['interests']);
  if (interests != null) {
    analysisFirstFriendInfo.interests = interests;
  }
  final double? lon = jsonConvert.convert<double>(json['lon']);
  if (lon != null) {
    analysisFirstFriendInfo.lon = lon;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    analysisFirstFriendInfo.lat = lat;
  }
  final double? isSelf = jsonConvert.convert<double>(json['is_self']);
  if (isSelf != null) {
    analysisFirstFriendInfo.isSelf = isSelf;
  }
  return analysisFirstFriendInfo;
}

Map<String, dynamic> $AnalysisFirstFriendInfoToJson(
  AnalysisFirstFriendInfo entity,
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

extension AnalysisFirstFriendInfoExtension on AnalysisFirstFriendInfo {
  AnalysisFirstFriendInfo copyWith({
    num? id,
    num? userId,
    String? nickName,
    String? headImg,
    double? sex,
    String? birthday,
    double? birthHour,
    double? birthMinute,
    String? locality,
    String? interests,
    double? lon,
    double? lat,
    double? isSelf,
  }) {
    return AnalysisFirstFriendInfo()
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

AnalysisSecondFriendInfo $AnalysisSecondFriendInfoFromJson(
  Map<String, dynamic> json,
) {
  final AnalysisSecondFriendInfo analysisSecondFriendInfo =
      AnalysisSecondFriendInfo();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    analysisSecondFriendInfo.id = id;
  }
  final double? userId = jsonConvert.convert<double>(json['user_id']);
  if (userId != null) {
    analysisSecondFriendInfo.userId = userId;
  }
  final String? nickName = jsonConvert.convert<String>(json['nick_name']);
  if (nickName != null) {
    analysisSecondFriendInfo.nickName = nickName;
  }
  final String? headImg = jsonConvert.convert<String>(json['head_img']);
  if (headImg != null) {
    analysisSecondFriendInfo.headImg = headImg;
  }
  final double? sex = jsonConvert.convert<double>(json['sex']);
  if (sex != null) {
    analysisSecondFriendInfo.sex = sex;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    analysisSecondFriendInfo.birthday = birthday;
  }
  final double? birthHour = jsonConvert.convert<double>(json['birth_hour']);
  if (birthHour != null) {
    analysisSecondFriendInfo.birthHour = birthHour;
  }
  final double? birthMinute = jsonConvert.convert<double>(json['birth_minute']);
  if (birthMinute != null) {
    analysisSecondFriendInfo.birthMinute = birthMinute;
  }
  final String? locality = jsonConvert.convert<String>(json['locality']);
  if (locality != null) {
    analysisSecondFriendInfo.locality = locality;
  }
  final String? interests = jsonConvert.convert<String>(json['interests']);
  if (interests != null) {
    analysisSecondFriendInfo.interests = interests;
  }
  final double? lon = jsonConvert.convert<double>(json['lon']);
  if (lon != null) {
    analysisSecondFriendInfo.lon = lon;
  }
  final double? lat = jsonConvert.convert<double>(json['lat']);
  if (lat != null) {
    analysisSecondFriendInfo.lat = lat;
  }
  final double? isSelf = jsonConvert.convert<double>(json['is_self']);
  if (isSelf != null) {
    analysisSecondFriendInfo.isSelf = isSelf;
  }
  return analysisSecondFriendInfo;
}

Map<String, dynamic> $AnalysisSecondFriendInfoToJson(
  AnalysisSecondFriendInfo entity,
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

extension AnalysisSecondFriendInfoExtension on AnalysisSecondFriendInfo {
  AnalysisSecondFriendInfo copyWith({
    double? id,
    double? userId,
    String? nickName,
    String? headImg,
    double? sex,
    String? birthday,
    double? birthHour,
    double? birthMinute,
    String? locality,
    String? interests,
    double? lon,
    double? lat,
    double? isSelf,
  }) {
    return AnalysisSecondFriendInfo()
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
