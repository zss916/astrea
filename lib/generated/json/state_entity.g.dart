import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/state_entity.dart';

StateEntity $StateEntityFromJson(Map<String, dynamic> json) {
  final StateEntity stateEntity = StateEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    stateEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    stateEntity.name = name;
  }
  final int? countryId = jsonConvert.convert<int>(json['country_id']);
  if (countryId != null) {
    stateEntity.countryId = countryId;
  }
  final String? countryCode = jsonConvert.convert<String>(json['country_code']);
  if (countryCode != null) {
    stateEntity.countryCode = countryCode;
  }
  final String? iso2 = jsonConvert.convert<String>(json['iso2']);
  if (iso2 != null) {
    stateEntity.iso2 = iso2;
  }
  final String? latitude = jsonConvert.convert<String>(json['latitude']);
  if (latitude != null) {
    stateEntity.latitude = latitude;
  }
  final String? longitude = jsonConvert.convert<String>(json['longitude']);
  if (longitude != null) {
    stateEntity.longitude = longitude;
  }
  final bool? isSelected = jsonConvert.convert<bool>(json['isSelected']);
  if (isSelected != null) {
    stateEntity.isSelected = isSelected;
  }
  return stateEntity;
}

Map<String, dynamic> $StateEntityToJson(StateEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['country_id'] = entity.countryId;
  data['country_code'] = entity.countryCode;
  data['iso2'] = entity.iso2;
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  data['isSelected'] = entity.isSelected;
  return data;
}

extension StateEntityExtension on StateEntity {
  StateEntity copyWith({
    int? id,
    String? name,
    int? countryId,
    String? countryCode,
    String? iso2,
    String? latitude,
    String? longitude,
    bool? isSelected,
  }) {
    return StateEntity()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..countryId = countryId ?? this.countryId
      ..countryCode = countryCode ?? this.countryCode
      ..iso2 = iso2 ?? this.iso2
      ..latitude = latitude ?? this.latitude
      ..longitude = longitude ?? this.longitude
      ..isSelected = isSelected ?? this.isSelected;
  }
}
