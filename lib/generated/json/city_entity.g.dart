import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/city_entity.dart';

CityEntity $CityEntityFromJson(Map<String, dynamic> json) {
  final CityEntity cityEntity = CityEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    cityEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    cityEntity.name = name;
  }
  final int? stateId = jsonConvert.convert<int>(json['state_id']);
  if (stateId != null) {
    cityEntity.stateId = stateId;
  }
  final int? countryId = jsonConvert.convert<int>(json['country_id']);
  if (countryId != null) {
    cityEntity.countryId = countryId;
  }
  final String? latitude = jsonConvert.convert<String>(json['latitude']);
  if (latitude != null) {
    cityEntity.latitude = latitude;
  }
  final String? longitude = jsonConvert.convert<String>(json['longitude']);
  if (longitude != null) {
    cityEntity.longitude = longitude;
  }
  final bool? isSelected = jsonConvert.convert<bool>(json['isSelected']);
  if (isSelected != null) {
    cityEntity.isSelected = isSelected;
  }
  return cityEntity;
}

Map<String, dynamic> $CityEntityToJson(CityEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['state_id'] = entity.stateId;
  data['country_id'] = entity.countryId;
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  data['isSelected'] = entity.isSelected;
  return data;
}

extension CityEntityExtension on CityEntity {
  CityEntity copyWith({
    int? id,
    String? name,
    int? stateId,
    int? countryId,
    String? latitude,
    String? longitude,
    bool? isSelected,
  }) {
    return CityEntity()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..stateId = stateId ?? this.stateId
      ..countryId = countryId ?? this.countryId
      ..latitude = latitude ?? this.latitude
      ..longitude = longitude ?? this.longitude
      ..isSelected = isSelected ?? this.isSelected;
  }
}
