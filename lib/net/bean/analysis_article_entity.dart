import 'dart:convert';

import 'package:astrea/generated/json/analysis_article_entity.g.dart';
import 'package:astrea/generated/json/base/json_field.dart';
import 'package:sprintf/sprintf.dart';

export 'package:astrea/generated/json/analysis_article_entity.g.dart';

@JsonSerializable()
class AnalysisArticleEntity {
  String? summary;
  String? analysis;
  @JSONField(name: "daily_advice")
  String? dailyAdvice;
  @JSONField(name: "trend_3_months")
  String? trend3Months;
  AnalysisArticleScores? scores;
  List<AnalysisArticleMeanings>? meanings;

  AnalysisArticleEntity();

  factory AnalysisArticleEntity.fromJson(Map<String, dynamic> json) =>
      $AnalysisArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisArticleEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AnalysisArticleScores {
  @JSONField(name: "soul_index")
  int? soulIndex;
  @JSONField(name: "emotional_index")
  int? emotionalIndex;
  @JSONField(name: "attraction_index")
  int? attractionIndex;
  @JSONField(name: "thought_resonance_index")
  int? thoughtResonanceIndex;
  @JSONField(name: "mutual_growth_index")
  int? mutualGrowthIndex;
  @JSONField(name: "comfort_boundary_index")
  int? comfortBoundaryIndex;
  @JSONField(name: "emotional_security_index")
  int? emotionalSecurityIndex;
  @JSONField(name: "karma_index")
  int? karmaIndex;
  @JSONField(name: "unconditional_support_index")
  int? unconditionalSupportIndex;
  @JSONField(name: "smooth_communication_index")
  int? smoothCommunicationIndex;
  @JSONField(name: "authoritative_structure_index")
  int? authoritativeStructureIndex;
  @JSONField(name: "growth_and_cultivation_index")
  int? growthAndCultivationIndex;
  @JSONField(name: "action_coordination_index")
  int? actionCoordinationIndex;
  @JSONField(name: "fluent_communication_index")
  int? fluentCommunicationIndex;
  @JSONField(name: "long_term_cooperation_index")
  int? longTermCooperationIndex;
  @JSONField(name: "wealth_gain_index")
  int? wealthGainIndex;

  AnalysisArticleScores();

  factory AnalysisArticleScores.fromJson(Map<String, dynamic> json) =>
      $AnalysisArticleScoresFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisArticleScoresToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AnalysisArticleMeanings {
  @JSONField(name: "person_a_planet")
  String? personAPlanet;
  @JSONField(name: "person_a_sign")
  String? personASign;
  @JSONField(name: "person_a_houses")
  int? personAHouses;
  @JSONField(name: "person_b_planet")
  String? personBPlanet;
  @JSONField(name: "person_b_sign")
  String? personBSign;
  @JSONField(name: "person_b_houses")
  int? personBHouses;
  String? meaning;

  AnalysisArticleMeanings();
  //'${data[i].personASign} in ${data[i].personAPlanet} ${data[i].personAHouses}th House'
  String get showOneself => sprintf("%s in %s %sth House", [
    personASign,
    personAPlanet,
    personAHouses,
  ]);
  String get showOtherSide => sprintf("%s in %s %sth House", [
    personBSign,
    personBPlanet,
    personBHouses,
  ]);

  factory AnalysisArticleMeanings.fromJson(Map<String, dynamic> json) =>
      $AnalysisArticleMeaningsFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisArticleMeaningsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
