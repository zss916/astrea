import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/star_item_entity.dart';

StarItemEntity $StarItemEntityFromJson(Map<String, dynamic> json) {
  final StarItemEntity starItemEntity = StarItemEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    starItemEntity.name = name;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    starItemEntity.icon = icon;
  }
  final bool? isChecked = jsonConvert.convert<bool>(json['isChecked']);
  if (isChecked != null) {
    starItemEntity.isChecked = isChecked;
  }
  return starItemEntity;
}

Map<String, dynamic> $StarItemEntityToJson(StarItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['icon'] = entity.icon;
  data['isChecked'] = entity.isChecked;
  return data;
}

extension StarItemEntityExtension on StarItemEntity {
  StarItemEntity copyWith({String? name, String? icon, bool? isChecked}) {
    return StarItemEntity()
      ..name = name ?? this.name
      ..icon = icon ?? this.icon
      ..isChecked = isChecked ?? this.isChecked;
  }
}
