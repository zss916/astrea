import 'dart:convert';

import 'package:astrea/generated/json/base/json_field.dart';
import 'package:astrea/generated/json/friend_entity.g.dart';

export 'package:astrea/generated/json/friend_entity.g.dart';

@JsonSerializable()
class FriendEntity {
  int? id;
  @JSONField(name: 'user_id')
  int? userId;
  @JSONField(name: 'nick_name')
  String? nickName;
  @JSONField(name: 'head_img')
  String? headImg;
  int? sex;
  String? birthday;
  @JSONField(name: 'birth_hour')
  int? birthHour;
  @JSONField(name: 'birth_minute')
  int? birthMinute;
  String? locality;
  String? interests;
  num? lon;
  num? lat;
  @JSONField(name: 'is_self')
  int? isSelf;

  FriendEntity();

  factory FriendEntity.fromJson(Map<String, dynamic> json) =>
      $FriendEntityFromJson(json);

  Map<String, dynamic> toJson() => $FriendEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
