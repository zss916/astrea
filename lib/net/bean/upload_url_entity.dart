import 'dart:convert';

import 'package:astrea/generated/json/base/json_field.dart';
import 'package:astrea/generated/json/upload_url_entity.g.dart';

export 'package:astrea/generated/json/upload_url_entity.g.dart';

@JsonSerializable()
class UploadUrlEntity {
  @JSONField(name: "file_name")
  String? fileName;
  @JSONField(name: "upload_url")
  String? uploadUrl;
  @JSONField(name: "cdn_url")
  String? cdnUrl;

  UploadUrlEntity();

  factory UploadUrlEntity.fromJson(Map<String, dynamic> json) =>
      $UploadUrlEntityFromJson(json);

  Map<String, dynamic> toJson() => $UploadUrlEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
