import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/upload_url_entity.dart';

UploadUrlEntity $UploadUrlEntityFromJson(Map<String, dynamic> json) {
  final UploadUrlEntity uploadUrlEntity = UploadUrlEntity();
  final String? fileName = jsonConvert.convert<String>(json['file_name']);
  if (fileName != null) {
    uploadUrlEntity.fileName = fileName;
  }
  final String? uploadUrl = jsonConvert.convert<String>(json['upload_url']);
  if (uploadUrl != null) {
    uploadUrlEntity.uploadUrl = uploadUrl;
  }
  final String? cdnUrl = jsonConvert.convert<String>(json['cdn_url']);
  if (cdnUrl != null) {
    uploadUrlEntity.cdnUrl = cdnUrl;
  }
  return uploadUrlEntity;
}

Map<String, dynamic> $UploadUrlEntityToJson(UploadUrlEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['file_name'] = entity.fileName;
  data['upload_url'] = entity.uploadUrl;
  data['cdn_url'] = entity.cdnUrl;
  return data;
}

extension UploadUrlEntityExtension on UploadUrlEntity {
  UploadUrlEntity copyWith({
    String? fileName,
    String? uploadUrl,
    String? cdnUrl,
  }) {
    return UploadUrlEntity()
      ..fileName = fileName ?? this.fileName
      ..uploadUrl = uploadUrl ?? this.uploadUrl
      ..cdnUrl = cdnUrl ?? this.cdnUrl;
  }
}
