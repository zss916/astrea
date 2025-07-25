import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/analysis_identity_entity.dart';

AnalysisIdentityEntity $AnalysisIdentityEntityFromJson(
  Map<String, dynamic> json,
) {
  final AnalysisIdentityEntity analysisIdentityEntity =
      AnalysisIdentityEntity();
  final int? synastryId = jsonConvert.convert<int>(json['synastry_id']);
  if (synastryId != null) {
    analysisIdentityEntity.synastryId = synastryId;
  }
  final int? analysisId = jsonConvert.convert<int>(json['analysis_id']);
  if (analysisId != null) {
    analysisIdentityEntity.analysisId = analysisId;
  }
  return analysisIdentityEntity;
}

Map<String, dynamic> $AnalysisIdentityEntityToJson(
  AnalysisIdentityEntity entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['synastry_id'] = entity.synastryId;
  data['analysis_id'] = entity.analysisId;
  return data;
}

extension AnalysisIdentityEntityExtension on AnalysisIdentityEntity {
  AnalysisIdentityEntity copyWith({int? synastryId, int? analysisId}) {
    return AnalysisIdentityEntity()
      ..synastryId = synastryId ?? this.synastryId
      ..analysisId = analysisId ?? this.analysisId;
  }
}
