import 'dart:convert';

import 'package:astrea/generated/json/base/json_field.dart';
import 'package:astrea/generated/json/star_item_entity.g.dart';

export 'package:astrea/generated/json/star_item_entity.g.dart';

@JsonSerializable()
class StarItemEntity {
  String? name;
  String? icon;
  bool? isChecked;

  StarItemEntity({String? icon, String? name, bool? isChecked});

  factory StarItemEntity.fromJson(Map<String, dynamic> json) =>
      $StarItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $StarItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
