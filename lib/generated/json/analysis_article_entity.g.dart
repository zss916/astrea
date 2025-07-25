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
  final int? soul = jsonConvert.convert<int>(json['soul']);
  if (soul != null) {
    analysisArticleScores.soul = soul;
  }
  final int? emotion = jsonConvert.convert<int>(json['emotion']);
  if (emotion != null) {
    analysisArticleScores.emotion = emotion;
  }
  final int? attraction = jsonConvert.convert<int>(json['attraction']);
  if (attraction != null) {
    analysisArticleScores.attraction = attraction;
  }
  return analysisArticleScores;
}

Map<String, dynamic> $AnalysisArticleScoresToJson(
  AnalysisArticleScores entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['soul'] = entity.soul;
  data['emotion'] = entity.emotion;
  data['attraction'] = entity.attraction;
  return data;
}

extension AnalysisArticleScoresExtension on AnalysisArticleScores {
  AnalysisArticleScores copyWith({int? soul, int? emotion, int? attraction}) {
    return AnalysisArticleScores()
      ..soul = soul ?? this.soul
      ..emotion = emotion ?? this.emotion
      ..attraction = attraction ?? this.attraction;
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
