import 'dart:convert';

import 'package:astrea/generated/json/analysis_identity_entity.g.dart';
import 'package:astrea/generated/json/base/json_field.dart';

export 'package:astrea/generated/json/analysis_identity_entity.g.dart';

@JsonSerializable()
class AnalysisIdentityEntity {
  bool? done;
  @JSONField(name: "synastry_id")
  int? synastryId;
  @JSONField(name: "analysis_id")
  int? analysisId;

  AnalysisIdentityEntity();

  factory AnalysisIdentityEntity.fromJson(Map<String, dynamic> json) =>
      $AnalysisIdentityEntityFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisIdentityEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
