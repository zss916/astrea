import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/analysis_article_entity.dart';

AnalysisArticleEntity $AnalysisArticleEntityFromJson(
  Map<String, dynamic> json,
) {
  final AnalysisArticleEntity analysisArticleEntity = AnalysisArticleEntity();
  final String? summary = jsonConvert.convert<String>(json['summary']);
  if (summary != null) {
    analysisArticleEntity.summary = summary;
  }
  final String? analysis = jsonConvert.convert<String>(json['analysis']);
  if (analysis != null) {
    analysisArticleEntity.analysis = analysis;
  }
  final String? dailyAdvice = jsonConvert.convert<String>(json['daily_advice']);
  if (dailyAdvice != null) {
    analysisArticleEntity.dailyAdvice = dailyAdvice;
  }
  final String? trend3Months = jsonConvert.convert<String>(
    json['trend_3_months'],
  );
  if (trend3Months != null) {
    analysisArticleEntity.trend3Months = trend3Months;
  }
  final AnalysisArticleScores? scores = jsonConvert
      .convert<AnalysisArticleScores>(json['scores']);
  if (scores != null) {
    analysisArticleEntity.scores = scores;
  }
  final List<AnalysisArticleMeanings>? meanings =
      (json['meanings'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<AnalysisArticleMeanings>(e)
                    as AnalysisArticleMeanings,
          )
          .toList();
  if (meanings != null) {
    analysisArticleEntity.meanings = meanings;
  }
  return analysisArticleEntity;
}

Map<String, dynamic> $AnalysisArticleEntityToJson(
  AnalysisArticleEntity entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['summary'] = entity.summary;
  data['analysis'] = entity.analysis;
  data['daily_advice'] = entity.dailyAdvice;
  data['trend_3_months'] = entity.trend3Months;
  data['scores'] = entity.scores?.toJson();
  data['meanings'] = entity.meanings?.map((v) => v.toJson()).toList();
  return data;
}

extension AnalysisArticleEntityExtension on AnalysisArticleEntity {
  AnalysisArticleEntity copyWith({
    String? summary,
    String? analysis,
    String? dailyAdvice,
    String? trend3Months,
    AnalysisArticleScores? scores,
    List<AnalysisArticleMeanings>? meanings,
  }) {
    return AnalysisArticleEntity()
      ..summary = summary ?? this.summary
      ..analysis = analysis ?? this.analysis
      ..dailyAdvice = dailyAdvice ?? this.dailyAdvice
      ..trend3Months = trend3Months ?? this.trend3Months
      ..scores = scores ?? this.scores
      ..meanings = meanings ?? this.meanings;
  }
}

AnalysisArticleScores $AnalysisArticleScoresFromJson(
  Map<String, dynamic> json,
) {
  final AnalysisArticleScores analysisArticleScores = AnalysisArticleScores();
  final int? soulIndex = jsonConvert.convert<int>(json['soul_index']);
  if (soulIndex != null) {
    analysisArticleScores.soulIndex = soulIndex;
  }
  final int? emotionalIndex = jsonConvert.convert<int>(json['emotional_index']);
  if (emotionalIndex != null) {
    analysisArticleScores.emotionalIndex = emotionalIndex;
  }
  final int? attractionIndex = jsonConvert.convert<int>(
    json['attraction_index'],
  );
  if (attractionIndex != null) {
    analysisArticleScores.attractionIndex = attractionIndex;
  }
  final int? thoughtResonanceIndex = jsonConvert.convert<int>(
    json['thought_resonance_index'],
  );
  if (thoughtResonanceIndex != null) {
    analysisArticleScores.thoughtResonanceIndex = thoughtResonanceIndex;
  }
  final int? mutualGrowthIndex = jsonConvert.convert<int>(
    json['mutual_growth_index'],
  );
  if (mutualGrowthIndex != null) {
    analysisArticleScores.mutualGrowthIndex = mutualGrowthIndex;
  }
  final int? comfortBoundaryIndex = jsonConvert.convert<int>(
    json['comfort_boundary_index'],
  );
  if (comfortBoundaryIndex != null) {
    analysisArticleScores.comfortBoundaryIndex = comfortBoundaryIndex;
  }
  final int? emotionalSecurityIndex = jsonConvert.convert<int>(
    json['emotional_security_index'],
  );
  if (emotionalSecurityIndex != null) {
    analysisArticleScores.emotionalSecurityIndex = emotionalSecurityIndex;
  }
  final int? karmaIndex = jsonConvert.convert<int>(json['karma_index']);
  if (karmaIndex != null) {
    analysisArticleScores.karmaIndex = karmaIndex;
  }
  final int? unconditionalSupportIndex = jsonConvert.convert<int>(
    json['unconditional_support_index'],
  );
  if (unconditionalSupportIndex != null) {
    analysisArticleScores.unconditionalSupportIndex = unconditionalSupportIndex;
  }
  final int? smoothCommunicationIndex = jsonConvert.convert<int>(
    json['smooth_communication_index'],
  );
  if (smoothCommunicationIndex != null) {
    analysisArticleScores.smoothCommunicationIndex = smoothCommunicationIndex;
  }
  final int? authoritativeStructureIndex = jsonConvert.convert<int>(
    json['authoritative_structure_index'],
  );
  if (authoritativeStructureIndex != null) {
    analysisArticleScores.authoritativeStructureIndex =
        authoritativeStructureIndex;
  }
  final int? growthAndCultivationIndex = jsonConvert.convert<int>(
    json['growth_and_cultivation_index'],
  );
  if (growthAndCultivationIndex != null) {
    analysisArticleScores.growthAndCultivationIndex = growthAndCultivationIndex;
  }
  final int? actionCoordinationIndex = jsonConvert.convert<int>(
    json['action_coordination_index'],
  );
  if (actionCoordinationIndex != null) {
    analysisArticleScores.actionCoordinationIndex = actionCoordinationIndex;
  }
  final int? fluentCommunicationIndex = jsonConvert.convert<int>(
    json['fluent_communication_index'],
  );
  if (fluentCommunicationIndex != null) {
    analysisArticleScores.fluentCommunicationIndex = fluentCommunicationIndex;
  }
  final int? longTermCooperationIndex = jsonConvert.convert<int>(
    json['long_term_cooperation_index'],
  );
  if (longTermCooperationIndex != null) {
    analysisArticleScores.longTermCooperationIndex = longTermCooperationIndex;
  }
  final int? wealthGainIndex = jsonConvert.convert<int>(
    json['wealth_gain_index'],
  );
  if (wealthGainIndex != null) {
    analysisArticleScores.wealthGainIndex = wealthGainIndex;
  }
  return analysisArticleScores;
}

Map<String, dynamic> $AnalysisArticleScoresToJson(
  AnalysisArticleScores entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['soul_index'] = entity.soulIndex;
  data['emotional_index'] = entity.emotionalIndex;
  data['attraction_index'] = entity.attractionIndex;
  data['thought_resonance_index'] = entity.thoughtResonanceIndex;
  data['mutual_growth_index'] = entity.mutualGrowthIndex;
  data['comfort_boundary_index'] = entity.comfortBoundaryIndex;
  data['emotional_security_index'] = entity.emotionalSecurityIndex;
  data['karma_index'] = entity.karmaIndex;
  data['unconditional_support_index'] = entity.unconditionalSupportIndex;
  data['smooth_communication_index'] = entity.smoothCommunicationIndex;
  data['authoritative_structure_index'] = entity.authoritativeStructureIndex;
  data['growth_and_cultivation_index'] = entity.growthAndCultivationIndex;
  data['action_coordination_index'] = entity.actionCoordinationIndex;
  data['fluent_communication_index'] = entity.fluentCommunicationIndex;
  data['long_term_cooperation_index'] = entity.longTermCooperationIndex;
  data['wealth_gain_index'] = entity.wealthGainIndex;
  return data;
}

extension AnalysisArticleScoresExtension on AnalysisArticleScores {
  AnalysisArticleScores copyWith({
    int? soulIndex,
    int? emotionalIndex,
    int? attractionIndex,
    int? thoughtResonanceIndex,
    int? mutualGrowthIndex,
    int? comfortBoundaryIndex,
    int? emotionalSecurityIndex,
    int? karmaIndex,
    int? unconditionalSupportIndex,
    int? smoothCommunicationIndex,
    int? authoritativeStructureIndex,
    int? growthAndCultivationIndex,
    int? actionCoordinationIndex,
    int? fluentCommunicationIndex,
    int? longTermCooperationIndex,
    int? wealthGainIndex,
  }) {
    return AnalysisArticleScores()
      ..soulIndex = soulIndex ?? this.soulIndex
      ..emotionalIndex = emotionalIndex ?? this.emotionalIndex
      ..attractionIndex = attractionIndex ?? this.attractionIndex
      ..thoughtResonanceIndex =
          thoughtResonanceIndex ?? this.thoughtResonanceIndex
      ..mutualGrowthIndex = mutualGrowthIndex ?? this.mutualGrowthIndex
      ..comfortBoundaryIndex = comfortBoundaryIndex ?? this.comfortBoundaryIndex
      ..emotionalSecurityIndex =
          emotionalSecurityIndex ?? this.emotionalSecurityIndex
      ..karmaIndex = karmaIndex ?? this.karmaIndex
      ..unconditionalSupportIndex =
          unconditionalSupportIndex ?? this.unconditionalSupportIndex
      ..smoothCommunicationIndex =
          smoothCommunicationIndex ?? this.smoothCommunicationIndex
      ..authoritativeStructureIndex =
          authoritativeStructureIndex ?? this.authoritativeStructureIndex
      ..growthAndCultivationIndex =
          growthAndCultivationIndex ?? this.growthAndCultivationIndex
      ..actionCoordinationIndex =
          actionCoordinationIndex ?? this.actionCoordinationIndex
      ..fluentCommunicationIndex =
          fluentCommunicationIndex ?? this.fluentCommunicationIndex
      ..longTermCooperationIndex =
          longTermCooperationIndex ?? this.longTermCooperationIndex
      ..wealthGainIndex = wealthGainIndex ?? this.wealthGainIndex;
  }
}

AnalysisArticleMeanings $AnalysisArticleMeaningsFromJson(
  Map<String, dynamic> json,
) {
  final AnalysisArticleMeanings analysisArticleMeanings =
      AnalysisArticleMeanings();
  final String? personAPlanet = jsonConvert.convert<String>(
    json['person_a_planet'],
  );
  if (personAPlanet != null) {
    analysisArticleMeanings.personAPlanet = personAPlanet;
  }
  final String? personASign = jsonConvert.convert<String>(
    json['person_a_sign'],
  );
  if (personASign != null) {
    analysisArticleMeanings.personASign = personASign;
  }
  final int? personAHouses = jsonConvert.convert<int>(json['person_a_houses']);
  if (personAHouses != null) {
    analysisArticleMeanings.personAHouses = personAHouses;
  }
  final String? personBPlanet = jsonConvert.convert<String>(
    json['person_b_planet'],
  );
  if (personBPlanet != null) {
    analysisArticleMeanings.personBPlanet = personBPlanet;
  }
  final String? personBSign = jsonConvert.convert<String>(
    json['person_b_sign'],
  );
  if (personBSign != null) {
    analysisArticleMeanings.personBSign = personBSign;
  }
  final int? personBHouses = jsonConvert.convert<int>(json['person_b_houses']);
  if (personBHouses != null) {
    analysisArticleMeanings.personBHouses = personBHouses;
  }
  final String? meaning = jsonConvert.convert<String>(json['meaning']);
  if (meaning != null) {
    analysisArticleMeanings.meaning = meaning;
  }
  return analysisArticleMeanings;
}

Map<String, dynamic> $AnalysisArticleMeaningsToJson(
  AnalysisArticleMeanings entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['person_a_planet'] = entity.personAPlanet;
  data['person_a_sign'] = entity.personASign;
  data['person_a_houses'] = entity.personAHouses;
  data['person_b_planet'] = entity.personBPlanet;
  data['person_b_sign'] = entity.personBSign;
  data['person_b_houses'] = entity.personBHouses;
  data['meaning'] = entity.meaning;
  return data;
}

extension AnalysisArticleMeaningsExtension on AnalysisArticleMeanings {
  AnalysisArticleMeanings copyWith({
    String? personAPlanet,
    String? personASign,
    int? personAHouses,
    String? personBPlanet,
    String? personBSign,
    int? personBHouses,
    String? meaning,
  }) {
    return AnalysisArticleMeanings()
      ..personAPlanet = personAPlanet ?? this.personAPlanet
      ..personASign = personASign ?? this.personASign
      ..personAHouses = personAHouses ?? this.personAHouses
      ..personBPlanet = personBPlanet ?? this.personBPlanet
      ..personBSign = personBSign ?? this.personBSign
      ..personBHouses = personBHouses ?? this.personBHouses
      ..meaning = meaning ?? this.meaning;
  }
}
