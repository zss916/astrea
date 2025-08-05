import 'dart:convert';

import 'package:astrea/generated/json/base/json_field.dart';
import 'package:astrea/generated/json/country_entity.g.dart';
import 'package:azlistview_plus/azlistview_plus.dart';


export 'package:astrea/generated/json/country_entity.g.dart';

@JsonSerializable()
class CountryEntity extends ISuspensionBean {
  int? id;
  String? name;
  @JSONField(name: 'region_id')
  int? regionId;
  @JSONField(name: 'subregion_id')
  int? subregionId;
  String? iso2;
  String? iso3;
  String? latitude;
  String? longitude;

  /// 首字母
  String? get firstLetter => name?.substring(0, 1).toUpperCase();
  bool? isSelected;

  ///是否有下一页
  bool get isSubRegion => subregionId != null; //例如Bouvet Island

  CountryEntity();

  factory CountryEntity.fromJson(Map<String, dynamic> json) =>
      $CountryEntityFromJson(json);

  Map<String, dynamic> toJson() => $CountryEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  @override
  String getSuspensionTag() => firstLetter!;
}
