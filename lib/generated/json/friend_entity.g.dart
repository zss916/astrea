import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/friend_entity.dart';

FriendEntity $FriendEntityFromJson(Map<String, dynamic> json) {
  final FriendEntity friendEntity = FriendEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    friendEntity.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    friendEntity.userId = userId;
  }
  final String? nickName = jsonConvert.convert<String>(json['nick_name']);
  if (nickName != null) {
    friendEntity.nickName = nickName;
  }
  final String? headImg = jsonConvert.convert<String>(json['head_img']);
  if (headImg != null) {
    friendEntity.headImg = headImg;
  }
  final int? sex = jsonConvert.convert<int>(json['sex']);
  if (sex != null) {
    friendEntity.sex = sex;
  }
  final String? birthday = jsonConvert.convert<String>(json['birthday']);
  if (birthday != null) {
    friendEntity.birthday = birthday;
  }
  final int? birthHour = jsonConvert.convert<int>(json['birth_hour']);
  if (birthHour != null) {
    friendEntity.birthHour = birthHour;
  }
  final int? birthMinute = jsonConvert.convert<int>(json['birth_minute']);
  if (birthMinute != null) {
    friendEntity.birthMinute = birthMinute;
  }
  final String? locality = jsonConvert.convert<String>(json['locality']);
  if (locality != null) {
    friendEntity.locality = locality;
  }
  final String? interests = jsonConvert.convert<String>(json['interests']);
  if (interests != null) {
    friendEntity.interests = interests;
  }
  final num? lon = jsonConvert.convert<num>(json['lon']);
  if (lon != null) {
    friendEntity.lon = lon;
  }
  final num? lat = jsonConvert.convert<num>(json['lat']);
  if (lat != null) {
    friendEntity.lat = lat;
  }
  final int? isSelf = jsonConvert.convert<int>(json['is_self']);
  if (isSelf != null) {
    friendEntity.isSelf = isSelf;
  }
  final bool? isChecked = jsonConvert.convert<bool>(json['isChecked']);
  if (isChecked != null) {
    friendEntity.isChecked = isChecked;
  }
  final bool? isSelected = jsonConvert.convert<bool>(json['isSelected']);
  if (isSelected != null) {
    friendEntity.isSelected = isSelected;
  }
  return friendEntity;
}

Map<String, dynamic> $FriendEntityToJson(FriendEntity entity) {
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
  data['isChecked'] = entity.isChecked;
  data['isSelected'] = entity.isSelected;
  return data;
}

extension FriendEntityExtension on FriendEntity {
  FriendEntity copyWith({
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
    num? lon,
    num? lat,
    int? isSelf,
    bool? isChecked,
    bool? isSelected,
  }) {
    return FriendEntity()
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
      ..isSelf = isSelf ?? this.isSelf
      ..isChecked = isChecked ?? this.isChecked
      ..isSelected = isSelected ?? this.isSelected;
  }
}
