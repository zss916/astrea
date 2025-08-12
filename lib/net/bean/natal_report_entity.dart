import 'dart:convert';
import 'dart:core';

import 'package:astrea/core/enum/app_enum.dart';
import 'package:astrea/generated/json/base/json_field.dart';
import 'package:astrea/generated/json/natal_report_entity.g.dart';
import 'package:sprintf/sprintf.dart';

export 'package:astrea/generated/json/natal_report_entity.g.dart';

@JsonSerializable()
class NatalReportEntity {
  bool? done;
  @JSONField(name: 'natal_chart_img')
  String? natalChartImg;
  @JSONField(name: 'natal_chart_result')
  NatalReportNatalChartResult? natalChartResult;
  @JSONField(name: 'natal_chart_report')
  NatalReportNatalChartReport? natalChartReport;
  @JSONField(name: 'predication_analysis_result')
  NatalReportPredicationAnalysisResult? predicationAnalysisResult;

  NatalReportEntity();

  factory NatalReportEntity.fromJson(Map<String, dynamic> json) =>
      $NatalReportEntityFromJson(json);

  Map<String, dynamic> toJson() => $NatalReportEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartResult {
  @JSONField(name: 'sun_sign')
  String? sunSign;
  @JSONField(name: 'moon_sign')
  String? moonSign;
  @JSONField(name: 'ascendant_sign')
  String? ascendantSign;
  String? element;
  String? form;
  String? ruler;
  @JSONField(name: 'luck_color')
  String? luckColor;
  @JSONField(name: 'luck_number')
  String? luckNumber;
  @JSONField(name: 'luck_gemstone')
  String? luckGemstone;

  NatalReportNatalChartResult();

  factory NatalReportNatalChartResult.fromJson(Map<String, dynamic> json) =>
      $NatalReportNatalChartResultFromJson(json);

  Map<String, dynamic> toJson() => $NatalReportNatalChartResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReport {
  @JSONField(name: 'three_main_stars')
  NatalReportNatalChartReportThreeMainStars? threeMainStars;
  List<NatalReportNatalChartReportPlanets>? planets;

  NatalReportNatalChartReport();

  factory NatalReportNatalChartReport.fromJson(Map<String, dynamic> json) =>
      $NatalReportNatalChartReportFromJson(json);

  Map<String, dynamic> toJson() => $NatalReportNatalChartReportToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportThreeMainStars {
  NatalReportNatalChartReportThreeMainStarsSun? sun;
  NatalReportNatalChartReportThreeMainStarsMoon? moon;
  NatalReportNatalChartReportThreeMainStarsAscendant? ascendant;

  NatalReportNatalChartReportThreeMainStars();

  factory NatalReportNatalChartReportThreeMainStars.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportThreeMainStarsFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportThreeMainStarsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportThreeMainStarsSun {
  String? sign;
  int? house;
  @JSONField(name: 'zodiac_degree')
  double? zodiacDegree;
  @JSONField(name: 'absolute_degree')
  double? absoluteDegree;
  String? interpretation;

  NatalReportNatalChartReportThreeMainStarsSun();

  factory NatalReportNatalChartReportThreeMainStarsSun.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportThreeMainStarsSunFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportThreeMainStarsSunToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportThreeMainStarsMoon {
  String? sign;
  int? house;
  @JSONField(name: 'zodiac_degree')
  double? zodiacDegree;
  @JSONField(name: 'absolute_degree')
  double? absoluteDegree;
  String? interpretation;

  NatalReportNatalChartReportThreeMainStarsMoon();

  factory NatalReportNatalChartReportThreeMainStarsMoon.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportThreeMainStarsMoonFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportThreeMainStarsMoonToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportThreeMainStarsAscendant {
  String? sign;
  double? degree;
  String? interpretation;

  NatalReportNatalChartReportThreeMainStarsAscendant();

  factory NatalReportNatalChartReportThreeMainStarsAscendant.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportThreeMainStarsAscendantFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportThreeMainStarsAscendantToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportPlanets {
  NatalReportNatalChartReportPlanetsMercury? mercury;
  NatalReportNatalChartReportPlanetsVenus? venus;
  NatalReportNatalChartReportPlanetsMars? mars;
  NatalReportNatalChartReportPlanetsJupiter? jupiter;
  NatalReportNatalChartReportPlanetsSaturn? saturn;
  NatalReportNatalChartReportPlanetsUranus? uranus;
  NatalReportNatalChartReportPlanetsNeptune? neptune;
  NatalReportNatalChartReportPlanetsPluto? pluto;

  NatalReportNatalChartReportPlanets();

  factory NatalReportNatalChartReportPlanets.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportPlanetsFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportPlanetsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportPlanetsMercury {
  String? sign;
  int? house;
  @JSONField(name: 'zodiac_degree')
  double? zodiacDegree;
  @JSONField(name: 'absolute_degree')
  double? absoluteDegree;
  @JSONField(name: 'is_retrograde')
  bool? isRetrograde;
  String? interpretation;

  NatalReportNatalChartReportPlanetsMercury();

  String get showInterpretation => interpretation ?? "";

  ///显示信息
  String get showPlanetInfo => sprintf("%s %s %s", [
    (sign ?? ""),
    (zodiacDegree == null ? "" : "$zodiacDegree°"),
    (house == null ? "" : "· ${house}st house"),
  ]).trim();

  String get showIcon => starIcons.firstWhere(
    (e) =>
        (e["name"] ?? '').toString().toLowerCase() ==
        (sign ?? "").toLowerCase(),
  )["img"];

  factory NatalReportNatalChartReportPlanetsMercury.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportPlanetsMercuryFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportPlanetsMercuryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportPlanetsVenus {
  String? sign;
  int? house;
  @JSONField(name: 'zodiac_degree')
  double? zodiacDegree;
  @JSONField(name: 'absolute_degree')
  double? absoluteDegree;
  @JSONField(name: 'is_retrograde')
  bool? isRetrograde;
  String? interpretation;

  NatalReportNatalChartReportPlanetsVenus();

  String get showInterpretation => interpretation ?? "";
  String get showIcon => starIcons.firstWhere(
    (e) =>
        (e["name"] ?? '').toString().toLowerCase() ==
        (sign ?? "").toLowerCase(),
  )["img"];

  ///显示信息
  String get showPlanetInfo => sprintf("%s %s %s", [
    (sign ?? ""),
    (zodiacDegree == null ? "" : "$zodiacDegree°"),
    (house == null ? "" : "· ${house}st house"),
  ]).trim();

  factory NatalReportNatalChartReportPlanetsVenus.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportPlanetsVenusFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportPlanetsVenusToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportPlanetsMars {
  String? sign;
  int? house;
  @JSONField(name: 'zodiac_degree')
  double? zodiacDegree;
  @JSONField(name: 'absolute_degree')
  double? absoluteDegree;
  @JSONField(name: 'is_retrograde')
  bool? isRetrograde;
  String? interpretation;

  NatalReportNatalChartReportPlanetsMars();
  String get showInterpretation => interpretation ?? "";
  String get showIcon => starIcons.firstWhere(
    (e) =>
        (e["name"] ?? '').toString().toLowerCase() ==
        (sign ?? "").toLowerCase(),
  )["img"];

  ///显示信息
  String get showPlanetInfo => sprintf("%s %s %s", [
    (sign ?? ""),
    (zodiacDegree == null ? "" : "$zodiacDegree°"),
    (house == null ? "" : "· ${house}st house"),
  ]).trim();

  factory NatalReportNatalChartReportPlanetsMars.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportPlanetsMarsFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportPlanetsMarsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportPlanetsJupiter {
  String? sign;
  int? house;
  @JSONField(name: 'zodiac_degree')
  double? zodiacDegree;
  @JSONField(name: 'absolute_degree')
  double? absoluteDegree;
  @JSONField(name: 'is_retrograde')
  bool? isRetrograde;
  String? interpretation;

  NatalReportNatalChartReportPlanetsJupiter();

  String get showInterpretation => interpretation ?? "";
  String get showIcon => starIcons.firstWhere(
    (e) =>
        (e["name"] ?? '').toString().toLowerCase() ==
        (sign ?? "").toLowerCase(),
  )["img"];

  ///显示信息
  String get showPlanetInfo => sprintf("%s %s %s", [
    (sign ?? ""),
    (zodiacDegree == null ? "" : "$zodiacDegree°"),
    (house == null ? "" : "· ${house}st house"),
  ]).trim();

  factory NatalReportNatalChartReportPlanetsJupiter.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportPlanetsJupiterFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportPlanetsJupiterToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportPlanetsSaturn {
  String? sign;
  int? house;
  @JSONField(name: 'zodiac_degree')
  double? zodiacDegree;
  @JSONField(name: 'absolute_degree')
  double? absoluteDegree;
  @JSONField(name: 'is_retrograde')
  bool? isRetrograde;
  String? interpretation;

  NatalReportNatalChartReportPlanetsSaturn();
  String get showInterpretation => interpretation ?? "";
  String get showIcon => starIcons.firstWhere(
    (e) =>
        (e["name"] ?? '').toString().toLowerCase() ==
        (sign ?? "").toLowerCase(),
  )["img"];

  ///显示信息
  String get showPlanetInfo => sprintf("%s %s %s", [
    (sign ?? ""),
    (zodiacDegree == null ? "" : "$zodiacDegree°"),
    (house == null ? "" : "· ${house}st house"),
  ]).trim();

  factory NatalReportNatalChartReportPlanetsSaturn.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportPlanetsSaturnFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportPlanetsSaturnToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportPlanetsUranus {
  String? sign;
  int? house;
  @JSONField(name: 'zodiac_degree')
  double? zodiacDegree;
  @JSONField(name: 'absolute_degree')
  double? absoluteDegree;
  @JSONField(name: 'is_retrograde')
  bool? isRetrograde;
  String? interpretation;

  NatalReportNatalChartReportPlanetsUranus();
  String get showInterpretation => interpretation ?? "";
  String get showIcon => starIcons.firstWhere(
    (e) =>
        (e["name"] ?? '').toString().toLowerCase() ==
        (sign ?? "").toLowerCase(),
  )["img"];

  ///显示信息
  String get showPlanetInfo => sprintf("%s %s %s", [
    (sign ?? ""),
    (zodiacDegree == null ? "" : "$zodiacDegree°"),
    (house == null ? "" : "· ${house}st house"),
  ]).trim();

  factory NatalReportNatalChartReportPlanetsUranus.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportPlanetsUranusFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportPlanetsUranusToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportPlanetsNeptune {
  String? sign;
  int? house;
  @JSONField(name: 'zodiac_degree')
  double? zodiacDegree;
  @JSONField(name: 'absolute_degree')
  double? absoluteDegree;
  @JSONField(name: 'is_retrograde')
  bool? isRetrograde;
  String? interpretation;

  NatalReportNatalChartReportPlanetsNeptune();
  String get showInterpretation => interpretation ?? "";
  String get showIcon => starIcons.firstWhere(
    (e) =>
        (e["name"] ?? '').toString().toLowerCase() ==
        (sign ?? "").toLowerCase(),
  )["img"];

  ///显示信息
  String get showPlanetInfo => sprintf("%s %s %s", [
    (sign ?? ""),
    (zodiacDegree == null ? "" : "$zodiacDegree°"),
    (house == null ? "" : "· ${house}st house"),
  ]).trim();

  factory NatalReportNatalChartReportPlanetsNeptune.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportPlanetsNeptuneFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportPlanetsNeptuneToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportNatalChartReportPlanetsPluto {
  String? sign;
  int? house;
  @JSONField(name: 'zodiac_degree')
  double? zodiacDegree;
  @JSONField(name: 'absolute_degree')
  double? absoluteDegree;
  @JSONField(name: 'is_retrograde')
  bool? isRetrograde;
  String? interpretation;

  NatalReportNatalChartReportPlanetsPluto();
  String get showInterpretation => interpretation ?? "";
  String get showIcon => starIcons.firstWhere(
    (e) =>
        (e["name"] ?? '').toString().toLowerCase() ==
        (sign ?? "").toLowerCase(),
  )["img"];

  ///显示信息
  String get showPlanetInfo => sprintf("%s %s %s", [
    (sign ?? ""),
    (zodiacDegree == null ? "" : "$zodiacDegree°"),
    (house == null ? "" : "· ${house}st house"),
  ]).trim();

  factory NatalReportNatalChartReportPlanetsPluto.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportNatalChartReportPlanetsPlutoFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportNatalChartReportPlanetsPlutoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportPredicationAnalysisResult {
  NatalReportPredicationAnalysisResultYesterday? yesterday;
  NatalReportPredicationAnalysisResultToday? today;
  NatalReportPredicationAnalysisResultTomorrow? tomorrow;
  NatalReportPredicationAnalysisResultWeek? week;
  NatalReportPredicationAnalysisResultMonth? month;
  NatalReportPredicationAnalysisResultYear? year;

  NatalReportPredicationAnalysisResult();

  factory NatalReportPredicationAnalysisResult.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportPredicationAnalysisResultFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportPredicationAnalysisResultToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportPredicationAnalysisResultYesterday {
  String? summary;
  String? love;
  String? relationship;
  String? career;
  String? wealth;
  NatalReportPredicationAnalysisResultYesterdayScore? score;
  @JSONField(name: 'do')
  String? dod;
  String? avoid;
  @JSONField(name: 'luck-boosting-tip')
  String? luckBoostingTip;

  NatalReportPredicationAnalysisResultYesterday();

  factory NatalReportPredicationAnalysisResultYesterday.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportPredicationAnalysisResultYesterdayFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportPredicationAnalysisResultYesterdayToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportPredicationAnalysisResultYesterdayScore {
  int? love;
  int? career;
  int? wealth;

  NatalReportPredicationAnalysisResultYesterdayScore();

  factory NatalReportPredicationAnalysisResultYesterdayScore.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportPredicationAnalysisResultYesterdayScoreFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportPredicationAnalysisResultYesterdayScoreToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportPredicationAnalysisResultToday {
  String? summary;
  String? love;
  String? relationship;
  String? career;
  String? wealth;
  NatalReportPredicationAnalysisResultTodayScore? score;
  @JSONField(name: 'do')
  String? dod;
  String? avoid;
  @JSONField(name: 'luck-boosting-tip')
  String? luckBoostingTip;

  NatalReportPredicationAnalysisResultToday();

  factory NatalReportPredicationAnalysisResultToday.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportPredicationAnalysisResultTodayFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportPredicationAnalysisResultTodayToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportPredicationAnalysisResultTodayScore {
  int? love;
  int? career;
  int? wealth;

  NatalReportPredicationAnalysisResultTodayScore();

  factory NatalReportPredicationAnalysisResultTodayScore.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportPredicationAnalysisResultTodayScoreFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportPredicationAnalysisResultTodayScoreToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportPredicationAnalysisResultTomorrow {
  String? summary;
  String? love;
  String? relationship;
  String? career;
  String? wealth;
  NatalReportPredicationAnalysisResultTomorrowScore? score;
  @JSONField(name: 'do')
  String? dod;
  String? avoid;
  @JSONField(name: 'luck-boosting-tip')
  String? luckBoostingTip;

  NatalReportPredicationAnalysisResultTomorrow();

  factory NatalReportPredicationAnalysisResultTomorrow.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportPredicationAnalysisResultTomorrowFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportPredicationAnalysisResultTomorrowToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportPredicationAnalysisResultTomorrowScore {
  int? love;
  int? career;
  int? wealth;

  NatalReportPredicationAnalysisResultTomorrowScore();

  factory NatalReportPredicationAnalysisResultTomorrowScore.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportPredicationAnalysisResultTomorrowScoreFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportPredicationAnalysisResultTomorrowScoreToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportPredicationAnalysisResultWeek {
  @JSONField(name: 'luck-boosting-tip')
  String? luckBoostingTip;
  String? summary;
  String? love;
  String? relationship;
  String? career;
  String? wealth;

  NatalReportPredicationAnalysisResultWeek();

  factory NatalReportPredicationAnalysisResultWeek.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportPredicationAnalysisResultWeekFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportPredicationAnalysisResultWeekToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportPredicationAnalysisResultMonth {
  String? summary;
  List<NatalReportPredicationAnalysisResultMonthDecades>? decades;
  @JSONField(name: 'relationship_summary')
  String? relationshipSummary;
  @JSONField(name: 'career_summary')
  String? careerSummary;
  @JSONField(name: 'wealth_summary')
  String? wealthSummary;

  NatalReportPredicationAnalysisResultMonth();

  factory NatalReportPredicationAnalysisResultMonth.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportPredicationAnalysisResultMonthFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportPredicationAnalysisResultMonthToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportPredicationAnalysisResultMonthDecades {
  String? range;
  String? content;

  NatalReportPredicationAnalysisResultMonthDecades();

  factory NatalReportPredicationAnalysisResultMonthDecades.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportPredicationAnalysisResultMonthDecadesFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportPredicationAnalysisResultMonthDecadesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportPredicationAnalysisResultYear {
  String? summary;
  List<NatalReportPredicationAnalysisResultYearQuarters>? quarters;
  @JSONField(name: 'relationship_summary')
  String? relationshipSummary;
  @JSONField(name: 'career_summary')
  String? careerSummary;
  @JSONField(name: 'wealth_summary')
  String? wealthSummary;

  NatalReportPredicationAnalysisResultYear();

  factory NatalReportPredicationAnalysisResultYear.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportPredicationAnalysisResultYearFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportPredicationAnalysisResultYearToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NatalReportPredicationAnalysisResultYearQuarters {
  String? range;
  String? content;

  NatalReportPredicationAnalysisResultYearQuarters();

  factory NatalReportPredicationAnalysisResultYearQuarters.fromJson(
    Map<String, dynamic> json,
  ) => $NatalReportPredicationAnalysisResultYearQuartersFromJson(json);

  Map<String, dynamic> toJson() =>
      $NatalReportPredicationAnalysisResultYearQuartersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
