import 'dart:convert';

import 'package:astrea/core/utils/calculate.dart';
import 'package:astrea/generated/json/base/json_field.dart';
import 'package:astrea/generated/json/friend_entity.g.dart';
import 'package:awesome_datetime_picker/awesome_datetime_picker.dart';

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

  String get showLon => (lon ?? 0).toString();
  String get showLat => (lat ?? 0).toString();

  ///是否被选中
  bool? isChecked;

  ///1 me
  bool get isMe => isSelf == 1;

  String get showBirthDay {
    if ((birthday ?? "").isNotEmpty) {
      return "${CalculateTools.formattedTime("$birthday")}${(birthHour ?? 0).formatted}:${(birthMinute ?? 0).formatted} ${CalculateTools.formattedAmOrPm(birthHour ?? 0)}";
    } else {
      return "";
    }
  }

  /*  String get showBirthDay2 {
    if ((birthday ?? "").isNotEmpty) {
      return "${CalculateTools.formattedTime2("$birthday")} ${(birthHour ?? 0).formatted}:${(birthMinute ?? 0).formatted} ${CalculateTools.formattedAmOrPm(birthHour ?? 0)}";
    } else {
      return "";
    }
  }*/

  AwesomeDateTime? getAwesomeDateTime(String? birthday, int hour, int minute) {
    if (birthday != null && birthday.contains("-")) {
      List<String> value = (birthday ?? "").split("-");
      if (value.isNotEmpty) {
        return AwesomeDateTime(
          date: AwesomeDate(
            year: int.parse(value[0]),
            month: int.parse(value[1]),
            day: int.parse(value[2]),
          ),
          time: AwesomeTime(hour: hour, minute: minute),
        );
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  ///本地需要
  bool? isSelected;

  FriendEntity();

  factory FriendEntity.fromJson(Map<String, dynamic> json) =>
      $FriendEntityFromJson(json);

  Map<String, dynamic> toJson() => $FriendEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
