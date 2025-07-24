import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/country_entity.dart';

CountryEntity $CountryEntityFromJson(Map<String, dynamic> json) {
  final CountryEntity countryEntity = CountryEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    countryEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    countryEntity.name = name;
  }
  final int? regionId = jsonConvert.convert<int>(json['region_id']);
  if (regionId != null) {
    countryEntity.regionId = regionId;
  }
  final int? subregionId = jsonConvert.convert<int>(json['subregion_id']);
  if (subregionId != null) {
    countryEntity.subregionId = subregionId;
  }
  final String? iso2 = jsonConvert.convert<String>(json['iso2']);
  if (iso2 != null) {
    countryEntity.iso2 = iso2;
  }
  final String? iso3 = jsonConvert.convert<String>(json['iso3']);
  if (iso3 != null) {
    countryEntity.iso3 = iso3;
  }
  final String? latitude = jsonConvert.convert<String>(json['latitude']);
  if (latitude != null) {
    countryEntity.latitude = latitude;
  }
  final String? longitude = jsonConvert.convert<String>(json['longitude']);
  if (longitude != null) {
    countryEntity.longitude = longitude;
  }
  final bool? isSelected = jsonConvert.convert<bool>(json['isSelected']);
  if (isSelected != null) {
    countryEntity.isSelected = isSelected;
  }
  return countryEntity;
}

Map<String, dynamic> $CountryEntityToJson(CountryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['region_id'] = entity.regionId;
  data['subregion_id'] = entity.subregionId;
  data['iso2'] = entity.iso2;
  data['iso3'] = entity.iso3;
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  data['isSelected'] = entity.isSelected;
  return data;
}

extension CountryEntityExtension on CountryEntity {
  CountryEntity copyWith({
    int? id,
    String? name,
    int? regionId,
    int? subregionId,
    String? iso2,
    String? iso3,
    String? latitude,
    String? longitude,
    bool? isSelected,
  }) {
    return CountryEntity()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..regionId = regionId ?? this.regionId
      ..subregionId = subregionId ?? this.subregionId
      ..iso2 = iso2 ?? this.iso2
      ..iso3 = iso3 ?? this.iso3
      ..latitude = latitude ?? this.latitude
      ..longitude = longitude ?? this.longitude
      ..isSelected = isSelected ?? this.isSelected;
  }
}
