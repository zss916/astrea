import 'dart:convert';

import 'package:astrea/generated/json/analysis_article_entity.g.dart';
import 'package:astrea/generated/json/base/json_field.dart';

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
  int? soul;
  int? emotion;
  int? attraction;

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

  factory AnalysisArticleMeanings.fromJson(Map<String, dynamic> json) =>
      $AnalysisArticleMeaningsFromJson(json);

  Map<String, dynamic> toJson() => $AnalysisArticleMeaningsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
