import 'dart:convert';

import 'package:astrea/generated/json/base/json_field.dart';
import 'package:astrea/generated/json/city_entity.g.dart';
import 'package:azlistview_plus/azlistview_plus.dart';

export 'package:astrea/generated/json/city_entity.g.dart';

@JsonSerializable()
class CityEntity extends ISuspensionBean {
  int? id;
  String? name;
  @JSONField(name: 'state_id')
  int? stateId;
  @JSONField(name: 'country_id')
  int? countryId;
  String? latitude;
  String? longitude;

  /// 首字母
  String? get firstLetter => name?.substring(0, 1).toUpperCase();
  bool? isSelected;

  CityEntity();

  factory CityEntity.fromJson(Map<String, dynamic> json) =>
      $CityEntityFromJson(json);

  Map<String, dynamic> toJson() => $CityEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  @override
  String getSuspensionTag() => firstLetter!;
}
