import 'dart:convert';

import 'package:astrea/generated/json/base/json_field.dart';
import 'package:astrea/generated/json/state_entity.g.dart';
import 'package:azlistview_plus/azlistview_plus.dart';


export 'package:astrea/generated/json/state_entity.g.dart';

@JsonSerializable()
class StateEntity extends ISuspensionBean {
  int? id;
  String? name;
  @JSONField(name: 'country_id')
  int? countryId;
  @JSONField(name: 'country_code')
  String? countryCode;
  String? iso2;
  String? latitude;
  String? longitude;

  /// 首字母
  String? get firstLetter => name?.substring(0, 1).toUpperCase();
  bool? isSelected;

  StateEntity();

  factory StateEntity.fromJson(Map<String, dynamic> json) =>
      $StateEntityFromJson(json);

  Map<String, dynamic> toJson() => $StateEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  @override
  String getSuspensionTag() => firstLetter!;
}
