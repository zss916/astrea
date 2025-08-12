import 'dart:core';

import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/natal_report_entity.dart';

NatalReportEntity $NatalReportEntityFromJson(Map<String, dynamic> json) {
  final NatalReportEntity natalReportEntity = NatalReportEntity();
  final bool? done = jsonConvert.convert<bool>(json['done']);
  if (done != null) {
    natalReportEntity.done = done;
  }
  final String? natalChartImg = jsonConvert.convert<String>(
    json['natal_chart_img'],
  );
  if (natalChartImg != null) {
    natalReportEntity.natalChartImg = natalChartImg;
  }
  final NatalReportNatalChartResult? natalChartResult = jsonConvert
      .convert<NatalReportNatalChartResult>(json['natal_chart_result']);
  if (natalChartResult != null) {
    natalReportEntity.natalChartResult = natalChartResult;
  }
  final NatalReportNatalChartReport? natalChartReport = jsonConvert
      .convert<NatalReportNatalChartReport>(json['natal_chart_report']);
  if (natalChartReport != null) {
    natalReportEntity.natalChartReport = natalChartReport;
  }
  final NatalReportPredicationAnalysisResult? predicationAnalysisResult =
      jsonConvert.convert<NatalReportPredicationAnalysisResult>(
        json['predication_analysis_result'],
      );
  if (predicationAnalysisResult != null) {
    natalReportEntity.predicationAnalysisResult = predicationAnalysisResult;
  }
  return natalReportEntity;
}

Map<String, dynamic> $NatalReportEntityToJson(NatalReportEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['done'] = entity.done;
  data['natal_chart_img'] = entity.natalChartImg;
  data['natal_chart_result'] = entity.natalChartResult?.toJson();
  data['natal_chart_report'] = entity.natalChartReport?.toJson();
  data['predication_analysis_result'] = entity.predicationAnalysisResult
      ?.toJson();
  return data;
}

extension NatalReportEntityExtension on NatalReportEntity {
  NatalReportEntity copyWith({
    bool? done,
    String? natalChartImg,
    NatalReportNatalChartResult? natalChartResult,
    NatalReportNatalChartReport? natalChartReport,
    NatalReportPredicationAnalysisResult? predicationAnalysisResult,
  }) {
    return NatalReportEntity()
      ..done = done ?? this.done
      ..natalChartImg = natalChartImg ?? this.natalChartImg
      ..natalChartResult = natalChartResult ?? this.natalChartResult
      ..natalChartReport = natalChartReport ?? this.natalChartReport
      ..predicationAnalysisResult =
          predicationAnalysisResult ?? this.predicationAnalysisResult;
  }
}

NatalReportNatalChartResult $NatalReportNatalChartResultFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportNatalChartResult natalReportNatalChartResult =
      NatalReportNatalChartResult();
  final String? sunSign = jsonConvert.convert<String>(json['sun_sign']);
  if (sunSign != null) {
    natalReportNatalChartResult.sunSign = sunSign;
  }
  final String? moonSign = jsonConvert.convert<String>(json['moon_sign']);
  if (moonSign != null) {
    natalReportNatalChartResult.moonSign = moonSign;
  }
  final String? ascendantSign = jsonConvert.convert<String>(
    json['ascendant_sign'],
  );
  if (ascendantSign != null) {
    natalReportNatalChartResult.ascendantSign = ascendantSign;
  }
  final String? element = jsonConvert.convert<String>(json['element']);
  if (element != null) {
    natalReportNatalChartResult.element = element;
  }
  final String? form = jsonConvert.convert<String>(json['form']);
  if (form != null) {
    natalReportNatalChartResult.form = form;
  }
  final String? ruler = jsonConvert.convert<String>(json['ruler']);
  if (ruler != null) {
    natalReportNatalChartResult.ruler = ruler;
  }
  final String? luckColor = jsonConvert.convert<String>(json['luck_color']);
  if (luckColor != null) {
    natalReportNatalChartResult.luckColor = luckColor;
  }
  final String? luckNumber = jsonConvert.convert<String>(json['luck_number']);
  if (luckNumber != null) {
    natalReportNatalChartResult.luckNumber = luckNumber;
  }
  final String? luckGemstone = jsonConvert.convert<String>(
    json['luck_gemstone'],
  );
  if (luckGemstone != null) {
    natalReportNatalChartResult.luckGemstone = luckGemstone;
  }
  return natalReportNatalChartResult;
}

Map<String, dynamic> $NatalReportNatalChartResultToJson(
  NatalReportNatalChartResult entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sun_sign'] = entity.sunSign;
  data['moon_sign'] = entity.moonSign;
  data['ascendant_sign'] = entity.ascendantSign;
  data['element'] = entity.element;
  data['form'] = entity.form;
  data['ruler'] = entity.ruler;
  data['luck_color'] = entity.luckColor;
  data['luck_number'] = entity.luckNumber;
  data['luck_gemstone'] = entity.luckGemstone;
  return data;
}

extension NatalReportNatalChartResultExtension on NatalReportNatalChartResult {
  NatalReportNatalChartResult copyWith({
    String? sunSign,
    String? moonSign,
    String? ascendantSign,
    String? element,
    String? form,
    String? ruler,
    String? luckColor,
    String? luckNumber,
    String? luckGemstone,
  }) {
    return NatalReportNatalChartResult()
      ..sunSign = sunSign ?? this.sunSign
      ..moonSign = moonSign ?? this.moonSign
      ..ascendantSign = ascendantSign ?? this.ascendantSign
      ..element = element ?? this.element
      ..form = form ?? this.form
      ..ruler = ruler ?? this.ruler
      ..luckColor = luckColor ?? this.luckColor
      ..luckNumber = luckNumber ?? this.luckNumber
      ..luckGemstone = luckGemstone ?? this.luckGemstone;
  }
}

NatalReportNatalChartReport $NatalReportNatalChartReportFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportNatalChartReport natalReportNatalChartReport =
      NatalReportNatalChartReport();
  final NatalReportNatalChartReportThreeMainStars? threeMainStars = jsonConvert
      .convert<NatalReportNatalChartReportThreeMainStars>(
        json['three_main_stars'],
      );
  if (threeMainStars != null) {
    natalReportNatalChartReport.threeMainStars = threeMainStars;
  }
  final List<NatalReportNatalChartReportPlanets>? planets =
      (json['planets'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<NatalReportNatalChartReportPlanets>(e)
                    as NatalReportNatalChartReportPlanets,
          )
          .toList();
  if (planets != null) {
    natalReportNatalChartReport.planets = planets;
  }
  return natalReportNatalChartReport;
}

Map<String, dynamic> $NatalReportNatalChartReportToJson(
  NatalReportNatalChartReport entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['three_main_stars'] = entity.threeMainStars?.toJson();
  data['planets'] = entity.planets?.map((v) => v.toJson()).toList();
  return data;
}

extension NatalReportNatalChartReportExtension on NatalReportNatalChartReport {
  NatalReportNatalChartReport copyWith({
    NatalReportNatalChartReportThreeMainStars? threeMainStars,
    List<NatalReportNatalChartReportPlanets>? planets,
  }) {
    return NatalReportNatalChartReport()
      ..threeMainStars = threeMainStars ?? this.threeMainStars
      ..planets = planets ?? this.planets;
  }
}

NatalReportNatalChartReportThreeMainStars
$NatalReportNatalChartReportThreeMainStarsFromJson(Map<String, dynamic> json) {
  final NatalReportNatalChartReportThreeMainStars
  natalReportNatalChartReportThreeMainStars =
      NatalReportNatalChartReportThreeMainStars();
  final NatalReportNatalChartReportThreeMainStarsSun? sun = jsonConvert
      .convert<NatalReportNatalChartReportThreeMainStarsSun>(json['sun']);
  if (sun != null) {
    natalReportNatalChartReportThreeMainStars.sun = sun;
  }
  final NatalReportNatalChartReportThreeMainStarsMoon? moon = jsonConvert
      .convert<NatalReportNatalChartReportThreeMainStarsMoon>(json['moon']);
  if (moon != null) {
    natalReportNatalChartReportThreeMainStars.moon = moon;
  }
  final NatalReportNatalChartReportThreeMainStarsAscendant? ascendant =
      jsonConvert.convert<NatalReportNatalChartReportThreeMainStarsAscendant>(
        json['ascendant'],
      );
  if (ascendant != null) {
    natalReportNatalChartReportThreeMainStars.ascendant = ascendant;
  }
  return natalReportNatalChartReportThreeMainStars;
}

Map<String, dynamic> $NatalReportNatalChartReportThreeMainStarsToJson(
  NatalReportNatalChartReportThreeMainStars entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sun'] = entity.sun?.toJson();
  data['moon'] = entity.moon?.toJson();
  data['ascendant'] = entity.ascendant?.toJson();
  return data;
}

extension NatalReportNatalChartReportThreeMainStarsExtension
    on NatalReportNatalChartReportThreeMainStars {
  NatalReportNatalChartReportThreeMainStars copyWith({
    NatalReportNatalChartReportThreeMainStarsSun? sun,
    NatalReportNatalChartReportThreeMainStarsMoon? moon,
    NatalReportNatalChartReportThreeMainStarsAscendant? ascendant,
  }) {
    return NatalReportNatalChartReportThreeMainStars()
      ..sun = sun ?? this.sun
      ..moon = moon ?? this.moon
      ..ascendant = ascendant ?? this.ascendant;
  }
}

NatalReportNatalChartReportThreeMainStarsSun
$NatalReportNatalChartReportThreeMainStarsSunFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportNatalChartReportThreeMainStarsSun
  natalReportNatalChartReportThreeMainStarsSun =
      NatalReportNatalChartReportThreeMainStarsSun();
  final String? sign = jsonConvert.convert<String>(json['sign']);
  if (sign != null) {
    natalReportNatalChartReportThreeMainStarsSun.sign = sign;
  }
  final int? house = jsonConvert.convert<int>(json['house']);
  if (house != null) {
    natalReportNatalChartReportThreeMainStarsSun.house = house;
  }
  final double? zodiacDegree = jsonConvert.convert<double>(
    json['zodiac_degree'],
  );
  if (zodiacDegree != null) {
    natalReportNatalChartReportThreeMainStarsSun.zodiacDegree = zodiacDegree;
  }
  final double? absoluteDegree = jsonConvert.convert<double>(
    json['absolute_degree'],
  );
  if (absoluteDegree != null) {
    natalReportNatalChartReportThreeMainStarsSun.absoluteDegree =
        absoluteDegree;
  }
  final String? interpretation = jsonConvert.convert<String>(
    json['interpretation'],
  );
  if (interpretation != null) {
    natalReportNatalChartReportThreeMainStarsSun.interpretation =
        interpretation;
  }
  return natalReportNatalChartReportThreeMainStarsSun;
}

Map<String, dynamic> $NatalReportNatalChartReportThreeMainStarsSunToJson(
  NatalReportNatalChartReportThreeMainStarsSun entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign'] = entity.sign;
  data['house'] = entity.house;
  data['zodiac_degree'] = entity.zodiacDegree;
  data['absolute_degree'] = entity.absoluteDegree;
  data['interpretation'] = entity.interpretation;
  return data;
}

extension NatalReportNatalChartReportThreeMainStarsSunExtension
    on NatalReportNatalChartReportThreeMainStarsSun {
  NatalReportNatalChartReportThreeMainStarsSun copyWith({
    String? sign,
    int? house,
    double? zodiacDegree,
    double? absoluteDegree,
    String? interpretation,
  }) {
    return NatalReportNatalChartReportThreeMainStarsSun()
      ..sign = sign ?? this.sign
      ..house = house ?? this.house
      ..zodiacDegree = zodiacDegree ?? this.zodiacDegree
      ..absoluteDegree = absoluteDegree ?? this.absoluteDegree
      ..interpretation = interpretation ?? this.interpretation;
  }
}

NatalReportNatalChartReportThreeMainStarsMoon
$NatalReportNatalChartReportThreeMainStarsMoonFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportNatalChartReportThreeMainStarsMoon
  natalReportNatalChartReportThreeMainStarsMoon =
      NatalReportNatalChartReportThreeMainStarsMoon();
  final String? sign = jsonConvert.convert<String>(json['sign']);
  if (sign != null) {
    natalReportNatalChartReportThreeMainStarsMoon.sign = sign;
  }
  final int? house = jsonConvert.convert<int>(json['house']);
  if (house != null) {
    natalReportNatalChartReportThreeMainStarsMoon.house = house;
  }
  final double? zodiacDegree = jsonConvert.convert<double>(
    json['zodiac_degree'],
  );
  if (zodiacDegree != null) {
    natalReportNatalChartReportThreeMainStarsMoon.zodiacDegree = zodiacDegree;
  }
  final double? absoluteDegree = jsonConvert.convert<double>(
    json['absolute_degree'],
  );
  if (absoluteDegree != null) {
    natalReportNatalChartReportThreeMainStarsMoon.absoluteDegree =
        absoluteDegree;
  }
  final String? interpretation = jsonConvert.convert<String>(
    json['interpretation'],
  );
  if (interpretation != null) {
    natalReportNatalChartReportThreeMainStarsMoon.interpretation =
        interpretation;
  }
  return natalReportNatalChartReportThreeMainStarsMoon;
}

Map<String, dynamic> $NatalReportNatalChartReportThreeMainStarsMoonToJson(
  NatalReportNatalChartReportThreeMainStarsMoon entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign'] = entity.sign;
  data['house'] = entity.house;
  data['zodiac_degree'] = entity.zodiacDegree;
  data['absolute_degree'] = entity.absoluteDegree;
  data['interpretation'] = entity.interpretation;
  return data;
}

extension NatalReportNatalChartReportThreeMainStarsMoonExtension
    on NatalReportNatalChartReportThreeMainStarsMoon {
  NatalReportNatalChartReportThreeMainStarsMoon copyWith({
    String? sign,
    int? house,
    double? zodiacDegree,
    double? absoluteDegree,
    String? interpretation,
  }) {
    return NatalReportNatalChartReportThreeMainStarsMoon()
      ..sign = sign ?? this.sign
      ..house = house ?? this.house
      ..zodiacDegree = zodiacDegree ?? this.zodiacDegree
      ..absoluteDegree = absoluteDegree ?? this.absoluteDegree
      ..interpretation = interpretation ?? this.interpretation;
  }
}

NatalReportNatalChartReportThreeMainStarsAscendant
$NatalReportNatalChartReportThreeMainStarsAscendantFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportNatalChartReportThreeMainStarsAscendant
  natalReportNatalChartReportThreeMainStarsAscendant =
      NatalReportNatalChartReportThreeMainStarsAscendant();
  final String? sign = jsonConvert.convert<String>(json['sign']);
  if (sign != null) {
    natalReportNatalChartReportThreeMainStarsAscendant.sign = sign;
  }
  final double? degree = jsonConvert.convert<double>(json['degree']);
  if (degree != null) {
    natalReportNatalChartReportThreeMainStarsAscendant.degree = degree;
  }
  final String? interpretation = jsonConvert.convert<String>(
    json['interpretation'],
  );
  if (interpretation != null) {
    natalReportNatalChartReportThreeMainStarsAscendant.interpretation =
        interpretation;
  }
  return natalReportNatalChartReportThreeMainStarsAscendant;
}

Map<String, dynamic> $NatalReportNatalChartReportThreeMainStarsAscendantToJson(
  NatalReportNatalChartReportThreeMainStarsAscendant entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign'] = entity.sign;
  data['degree'] = entity.degree;
  data['interpretation'] = entity.interpretation;
  return data;
}

extension NatalReportNatalChartReportThreeMainStarsAscendantExtension
    on NatalReportNatalChartReportThreeMainStarsAscendant {
  NatalReportNatalChartReportThreeMainStarsAscendant copyWith({
    String? sign,
    double? degree,
    String? interpretation,
  }) {
    return NatalReportNatalChartReportThreeMainStarsAscendant()
      ..sign = sign ?? this.sign
      ..degree = degree ?? this.degree
      ..interpretation = interpretation ?? this.interpretation;
  }
}

NatalReportNatalChartReportPlanets $NatalReportNatalChartReportPlanetsFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportNatalChartReportPlanets natalReportNatalChartReportPlanets =
      NatalReportNatalChartReportPlanets();
  final NatalReportNatalChartReportPlanetsMercury? mercury = jsonConvert
      .convert<NatalReportNatalChartReportPlanetsMercury>(json['mercury']);
  if (mercury != null) {
    natalReportNatalChartReportPlanets.mercury = mercury;
  }
  final NatalReportNatalChartReportPlanetsVenus? venus = jsonConvert
      .convert<NatalReportNatalChartReportPlanetsVenus>(json['venus']);
  if (venus != null) {
    natalReportNatalChartReportPlanets.venus = venus;
  }
  final NatalReportNatalChartReportPlanetsMars? mars = jsonConvert
      .convert<NatalReportNatalChartReportPlanetsMars>(json['mars']);
  if (mars != null) {
    natalReportNatalChartReportPlanets.mars = mars;
  }
  final NatalReportNatalChartReportPlanetsJupiter? jupiter = jsonConvert
      .convert<NatalReportNatalChartReportPlanetsJupiter>(json['jupiter']);
  if (jupiter != null) {
    natalReportNatalChartReportPlanets.jupiter = jupiter;
  }
  final NatalReportNatalChartReportPlanetsSaturn? saturn = jsonConvert
      .convert<NatalReportNatalChartReportPlanetsSaturn>(json['saturn']);
  if (saturn != null) {
    natalReportNatalChartReportPlanets.saturn = saturn;
  }
  final NatalReportNatalChartReportPlanetsUranus? uranus = jsonConvert
      .convert<NatalReportNatalChartReportPlanetsUranus>(json['uranus']);
  if (uranus != null) {
    natalReportNatalChartReportPlanets.uranus = uranus;
  }
  final NatalReportNatalChartReportPlanetsNeptune? neptune = jsonConvert
      .convert<NatalReportNatalChartReportPlanetsNeptune>(json['neptune']);
  if (neptune != null) {
    natalReportNatalChartReportPlanets.neptune = neptune;
  }
  final NatalReportNatalChartReportPlanetsPluto? pluto = jsonConvert
      .convert<NatalReportNatalChartReportPlanetsPluto>(json['pluto']);
  if (pluto != null) {
    natalReportNatalChartReportPlanets.pluto = pluto;
  }
  return natalReportNatalChartReportPlanets;
}

Map<String, dynamic> $NatalReportNatalChartReportPlanetsToJson(
  NatalReportNatalChartReportPlanets entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['mercury'] = entity.mercury?.toJson();
  data['venus'] = entity.venus?.toJson();
  data['mars'] = entity.mars?.toJson();
  data['jupiter'] = entity.jupiter?.toJson();
  data['saturn'] = entity.saturn?.toJson();
  data['uranus'] = entity.uranus?.toJson();
  data['neptune'] = entity.neptune?.toJson();
  data['pluto'] = entity.pluto?.toJson();
  return data;
}

extension NatalReportNatalChartReportPlanetsExtension
    on NatalReportNatalChartReportPlanets {
  NatalReportNatalChartReportPlanets copyWith({
    NatalReportNatalChartReportPlanetsMercury? mercury,
    NatalReportNatalChartReportPlanetsVenus? venus,
    NatalReportNatalChartReportPlanetsMars? mars,
    NatalReportNatalChartReportPlanetsJupiter? jupiter,
    NatalReportNatalChartReportPlanetsSaturn? saturn,
    NatalReportNatalChartReportPlanetsUranus? uranus,
    NatalReportNatalChartReportPlanetsNeptune? neptune,
    NatalReportNatalChartReportPlanetsPluto? pluto,
  }) {
    return NatalReportNatalChartReportPlanets()
      ..mercury = mercury ?? this.mercury
      ..venus = venus ?? this.venus
      ..mars = mars ?? this.mars
      ..jupiter = jupiter ?? this.jupiter
      ..saturn = saturn ?? this.saturn
      ..uranus = uranus ?? this.uranus
      ..neptune = neptune ?? this.neptune
      ..pluto = pluto ?? this.pluto;
  }
}

NatalReportNatalChartReportPlanetsMercury
$NatalReportNatalChartReportPlanetsMercuryFromJson(Map<String, dynamic> json) {
  final NatalReportNatalChartReportPlanetsMercury
  natalReportNatalChartReportPlanetsMercury =
      NatalReportNatalChartReportPlanetsMercury();
  final String? sign = jsonConvert.convert<String>(json['sign']);
  if (sign != null) {
    natalReportNatalChartReportPlanetsMercury.sign = sign;
  }
  final int? house = jsonConvert.convert<int>(json['house']);
  if (house != null) {
    natalReportNatalChartReportPlanetsMercury.house = house;
  }
  final double? zodiacDegree = jsonConvert.convert<double>(
    json['zodiac_degree'],
  );
  if (zodiacDegree != null) {
    natalReportNatalChartReportPlanetsMercury.zodiacDegree = zodiacDegree;
  }
  final double? absoluteDegree = jsonConvert.convert<double>(
    json['absolute_degree'],
  );
  if (absoluteDegree != null) {
    natalReportNatalChartReportPlanetsMercury.absoluteDegree = absoluteDegree;
  }
  final bool? isRetrograde = jsonConvert.convert<bool>(json['is_retrograde']);
  if (isRetrograde != null) {
    natalReportNatalChartReportPlanetsMercury.isRetrograde = isRetrograde;
  }
  final String? interpretation = jsonConvert.convert<String>(
    json['interpretation'],
  );
  if (interpretation != null) {
    natalReportNatalChartReportPlanetsMercury.interpretation = interpretation;
  }
  return natalReportNatalChartReportPlanetsMercury;
}

Map<String, dynamic> $NatalReportNatalChartReportPlanetsMercuryToJson(
  NatalReportNatalChartReportPlanetsMercury entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign'] = entity.sign;
  data['house'] = entity.house;
  data['zodiac_degree'] = entity.zodiacDegree;
  data['absolute_degree'] = entity.absoluteDegree;
  data['is_retrograde'] = entity.isRetrograde;
  data['interpretation'] = entity.interpretation;
  return data;
}

extension NatalReportNatalChartReportPlanetsMercuryExtension
    on NatalReportNatalChartReportPlanetsMercury {
  NatalReportNatalChartReportPlanetsMercury copyWith({
    String? sign,
    int? house,
    double? zodiacDegree,
    double? absoluteDegree,
    bool? isRetrograde,
    String? interpretation,
  }) {
    return NatalReportNatalChartReportPlanetsMercury()
      ..sign = sign ?? this.sign
      ..house = house ?? this.house
      ..zodiacDegree = zodiacDegree ?? this.zodiacDegree
      ..absoluteDegree = absoluteDegree ?? this.absoluteDegree
      ..isRetrograde = isRetrograde ?? this.isRetrograde
      ..interpretation = interpretation ?? this.interpretation;
  }
}

NatalReportNatalChartReportPlanetsVenus
$NatalReportNatalChartReportPlanetsVenusFromJson(Map<String, dynamic> json) {
  final NatalReportNatalChartReportPlanetsVenus
  natalReportNatalChartReportPlanetsVenus =
      NatalReportNatalChartReportPlanetsVenus();
  final String? sign = jsonConvert.convert<String>(json['sign']);
  if (sign != null) {
    natalReportNatalChartReportPlanetsVenus.sign = sign;
  }
  final int? house = jsonConvert.convert<int>(json['house']);
  if (house != null) {
    natalReportNatalChartReportPlanetsVenus.house = house;
  }
  final double? zodiacDegree = jsonConvert.convert<double>(
    json['zodiac_degree'],
  );
  if (zodiacDegree != null) {
    natalReportNatalChartReportPlanetsVenus.zodiacDegree = zodiacDegree;
  }
  final double? absoluteDegree = jsonConvert.convert<double>(
    json['absolute_degree'],
  );
  if (absoluteDegree != null) {
    natalReportNatalChartReportPlanetsVenus.absoluteDegree = absoluteDegree;
  }
  final bool? isRetrograde = jsonConvert.convert<bool>(json['is_retrograde']);
  if (isRetrograde != null) {
    natalReportNatalChartReportPlanetsVenus.isRetrograde = isRetrograde;
  }
  final String? interpretation = jsonConvert.convert<String>(
    json['interpretation'],
  );
  if (interpretation != null) {
    natalReportNatalChartReportPlanetsVenus.interpretation = interpretation;
  }
  return natalReportNatalChartReportPlanetsVenus;
}

Map<String, dynamic> $NatalReportNatalChartReportPlanetsVenusToJson(
  NatalReportNatalChartReportPlanetsVenus entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign'] = entity.sign;
  data['house'] = entity.house;
  data['zodiac_degree'] = entity.zodiacDegree;
  data['absolute_degree'] = entity.absoluteDegree;
  data['is_retrograde'] = entity.isRetrograde;
  data['interpretation'] = entity.interpretation;
  return data;
}

extension NatalReportNatalChartReportPlanetsVenusExtension
    on NatalReportNatalChartReportPlanetsVenus {
  NatalReportNatalChartReportPlanetsVenus copyWith({
    String? sign,
    int? house,
    double? zodiacDegree,
    double? absoluteDegree,
    bool? isRetrograde,
    String? interpretation,
  }) {
    return NatalReportNatalChartReportPlanetsVenus()
      ..sign = sign ?? this.sign
      ..house = house ?? this.house
      ..zodiacDegree = zodiacDegree ?? this.zodiacDegree
      ..absoluteDegree = absoluteDegree ?? this.absoluteDegree
      ..isRetrograde = isRetrograde ?? this.isRetrograde
      ..interpretation = interpretation ?? this.interpretation;
  }
}

NatalReportNatalChartReportPlanetsMars
$NatalReportNatalChartReportPlanetsMarsFromJson(Map<String, dynamic> json) {
  final NatalReportNatalChartReportPlanetsMars
  natalReportNatalChartReportPlanetsMars =
      NatalReportNatalChartReportPlanetsMars();
  final String? sign = jsonConvert.convert<String>(json['sign']);
  if (sign != null) {
    natalReportNatalChartReportPlanetsMars.sign = sign;
  }
  final int? house = jsonConvert.convert<int>(json['house']);
  if (house != null) {
    natalReportNatalChartReportPlanetsMars.house = house;
  }
  final double? zodiacDegree = jsonConvert.convert<double>(
    json['zodiac_degree'],
  );
  if (zodiacDegree != null) {
    natalReportNatalChartReportPlanetsMars.zodiacDegree = zodiacDegree;
  }
  final double? absoluteDegree = jsonConvert.convert<double>(
    json['absolute_degree'],
  );
  if (absoluteDegree != null) {
    natalReportNatalChartReportPlanetsMars.absoluteDegree = absoluteDegree;
  }
  final bool? isRetrograde = jsonConvert.convert<bool>(json['is_retrograde']);
  if (isRetrograde != null) {
    natalReportNatalChartReportPlanetsMars.isRetrograde = isRetrograde;
  }
  final String? interpretation = jsonConvert.convert<String>(
    json['interpretation'],
  );
  if (interpretation != null) {
    natalReportNatalChartReportPlanetsMars.interpretation = interpretation;
  }
  return natalReportNatalChartReportPlanetsMars;
}

Map<String, dynamic> $NatalReportNatalChartReportPlanetsMarsToJson(
  NatalReportNatalChartReportPlanetsMars entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign'] = entity.sign;
  data['house'] = entity.house;
  data['zodiac_degree'] = entity.zodiacDegree;
  data['absolute_degree'] = entity.absoluteDegree;
  data['is_retrograde'] = entity.isRetrograde;
  data['interpretation'] = entity.interpretation;
  return data;
}

extension NatalReportNatalChartReportPlanetsMarsExtension
    on NatalReportNatalChartReportPlanetsMars {
  NatalReportNatalChartReportPlanetsMars copyWith({
    String? sign,
    int? house,
    double? zodiacDegree,
    double? absoluteDegree,
    bool? isRetrograde,
    String? interpretation,
  }) {
    return NatalReportNatalChartReportPlanetsMars()
      ..sign = sign ?? this.sign
      ..house = house ?? this.house
      ..zodiacDegree = zodiacDegree ?? this.zodiacDegree
      ..absoluteDegree = absoluteDegree ?? this.absoluteDegree
      ..isRetrograde = isRetrograde ?? this.isRetrograde
      ..interpretation = interpretation ?? this.interpretation;
  }
}

NatalReportNatalChartReportPlanetsJupiter
$NatalReportNatalChartReportPlanetsJupiterFromJson(Map<String, dynamic> json) {
  final NatalReportNatalChartReportPlanetsJupiter
  natalReportNatalChartReportPlanetsJupiter =
      NatalReportNatalChartReportPlanetsJupiter();
  final String? sign = jsonConvert.convert<String>(json['sign']);
  if (sign != null) {
    natalReportNatalChartReportPlanetsJupiter.sign = sign;
  }
  final int? house = jsonConvert.convert<int>(json['house']);
  if (house != null) {
    natalReportNatalChartReportPlanetsJupiter.house = house;
  }
  final double? zodiacDegree = jsonConvert.convert<double>(
    json['zodiac_degree'],
  );
  if (zodiacDegree != null) {
    natalReportNatalChartReportPlanetsJupiter.zodiacDegree = zodiacDegree;
  }
  final double? absoluteDegree = jsonConvert.convert<double>(
    json['absolute_degree'],
  );
  if (absoluteDegree != null) {
    natalReportNatalChartReportPlanetsJupiter.absoluteDegree = absoluteDegree;
  }
  final bool? isRetrograde = jsonConvert.convert<bool>(json['is_retrograde']);
  if (isRetrograde != null) {
    natalReportNatalChartReportPlanetsJupiter.isRetrograde = isRetrograde;
  }
  final String? interpretation = jsonConvert.convert<String>(
    json['interpretation'],
  );
  if (interpretation != null) {
    natalReportNatalChartReportPlanetsJupiter.interpretation = interpretation;
  }
  return natalReportNatalChartReportPlanetsJupiter;
}

Map<String, dynamic> $NatalReportNatalChartReportPlanetsJupiterToJson(
  NatalReportNatalChartReportPlanetsJupiter entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign'] = entity.sign;
  data['house'] = entity.house;
  data['zodiac_degree'] = entity.zodiacDegree;
  data['absolute_degree'] = entity.absoluteDegree;
  data['is_retrograde'] = entity.isRetrograde;
  data['interpretation'] = entity.interpretation;
  return data;
}

extension NatalReportNatalChartReportPlanetsJupiterExtension
    on NatalReportNatalChartReportPlanetsJupiter {
  NatalReportNatalChartReportPlanetsJupiter copyWith({
    String? sign,
    int? house,
    double? zodiacDegree,
    double? absoluteDegree,
    bool? isRetrograde,
    String? interpretation,
  }) {
    return NatalReportNatalChartReportPlanetsJupiter()
      ..sign = sign ?? this.sign
      ..house = house ?? this.house
      ..zodiacDegree = zodiacDegree ?? this.zodiacDegree
      ..absoluteDegree = absoluteDegree ?? this.absoluteDegree
      ..isRetrograde = isRetrograde ?? this.isRetrograde
      ..interpretation = interpretation ?? this.interpretation;
  }
}

NatalReportNatalChartReportPlanetsSaturn
$NatalReportNatalChartReportPlanetsSaturnFromJson(Map<String, dynamic> json) {
  final NatalReportNatalChartReportPlanetsSaturn
  natalReportNatalChartReportPlanetsSaturn =
      NatalReportNatalChartReportPlanetsSaturn();
  final String? sign = jsonConvert.convert<String>(json['sign']);
  if (sign != null) {
    natalReportNatalChartReportPlanetsSaturn.sign = sign;
  }
  final int? house = jsonConvert.convert<int>(json['house']);
  if (house != null) {
    natalReportNatalChartReportPlanetsSaturn.house = house;
  }
  final double? zodiacDegree = jsonConvert.convert<double>(
    json['zodiac_degree'],
  );
  if (zodiacDegree != null) {
    natalReportNatalChartReportPlanetsSaturn.zodiacDegree = zodiacDegree;
  }
  final double? absoluteDegree = jsonConvert.convert<double>(
    json['absolute_degree'],
  );
  if (absoluteDegree != null) {
    natalReportNatalChartReportPlanetsSaturn.absoluteDegree = absoluteDegree;
  }
  final bool? isRetrograde = jsonConvert.convert<bool>(json['is_retrograde']);
  if (isRetrograde != null) {
    natalReportNatalChartReportPlanetsSaturn.isRetrograde = isRetrograde;
  }
  final String? interpretation = jsonConvert.convert<String>(
    json['interpretation'],
  );
  if (interpretation != null) {
    natalReportNatalChartReportPlanetsSaturn.interpretation = interpretation;
  }
  return natalReportNatalChartReportPlanetsSaturn;
}

Map<String, dynamic> $NatalReportNatalChartReportPlanetsSaturnToJson(
  NatalReportNatalChartReportPlanetsSaturn entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign'] = entity.sign;
  data['house'] = entity.house;
  data['zodiac_degree'] = entity.zodiacDegree;
  data['absolute_degree'] = entity.absoluteDegree;
  data['is_retrograde'] = entity.isRetrograde;
  data['interpretation'] = entity.interpretation;
  return data;
}

extension NatalReportNatalChartReportPlanetsSaturnExtension
    on NatalReportNatalChartReportPlanetsSaturn {
  NatalReportNatalChartReportPlanetsSaturn copyWith({
    String? sign,
    int? house,
    double? zodiacDegree,
    double? absoluteDegree,
    bool? isRetrograde,
    String? interpretation,
  }) {
    return NatalReportNatalChartReportPlanetsSaturn()
      ..sign = sign ?? this.sign
      ..house = house ?? this.house
      ..zodiacDegree = zodiacDegree ?? this.zodiacDegree
      ..absoluteDegree = absoluteDegree ?? this.absoluteDegree
      ..isRetrograde = isRetrograde ?? this.isRetrograde
      ..interpretation = interpretation ?? this.interpretation;
  }
}

NatalReportNatalChartReportPlanetsUranus
$NatalReportNatalChartReportPlanetsUranusFromJson(Map<String, dynamic> json) {
  final NatalReportNatalChartReportPlanetsUranus
  natalReportNatalChartReportPlanetsUranus =
      NatalReportNatalChartReportPlanetsUranus();
  final String? sign = jsonConvert.convert<String>(json['sign']);
  if (sign != null) {
    natalReportNatalChartReportPlanetsUranus.sign = sign;
  }
  final int? house = jsonConvert.convert<int>(json['house']);
  if (house != null) {
    natalReportNatalChartReportPlanetsUranus.house = house;
  }
  final double? zodiacDegree = jsonConvert.convert<double>(
    json['zodiac_degree'],
  );
  if (zodiacDegree != null) {
    natalReportNatalChartReportPlanetsUranus.zodiacDegree = zodiacDegree;
  }
  final double? absoluteDegree = jsonConvert.convert<double>(
    json['absolute_degree'],
  );
  if (absoluteDegree != null) {
    natalReportNatalChartReportPlanetsUranus.absoluteDegree = absoluteDegree;
  }
  final bool? isRetrograde = jsonConvert.convert<bool>(json['is_retrograde']);
  if (isRetrograde != null) {
    natalReportNatalChartReportPlanetsUranus.isRetrograde = isRetrograde;
  }
  final String? interpretation = jsonConvert.convert<String>(
    json['interpretation'],
  );
  if (interpretation != null) {
    natalReportNatalChartReportPlanetsUranus.interpretation = interpretation;
  }
  return natalReportNatalChartReportPlanetsUranus;
}

Map<String, dynamic> $NatalReportNatalChartReportPlanetsUranusToJson(
  NatalReportNatalChartReportPlanetsUranus entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign'] = entity.sign;
  data['house'] = entity.house;
  data['zodiac_degree'] = entity.zodiacDegree;
  data['absolute_degree'] = entity.absoluteDegree;
  data['is_retrograde'] = entity.isRetrograde;
  data['interpretation'] = entity.interpretation;
  return data;
}

extension NatalReportNatalChartReportPlanetsUranusExtension
    on NatalReportNatalChartReportPlanetsUranus {
  NatalReportNatalChartReportPlanetsUranus copyWith({
    String? sign,
    int? house,
    double? zodiacDegree,
    double? absoluteDegree,
    bool? isRetrograde,
    String? interpretation,
  }) {
    return NatalReportNatalChartReportPlanetsUranus()
      ..sign = sign ?? this.sign
      ..house = house ?? this.house
      ..zodiacDegree = zodiacDegree ?? this.zodiacDegree
      ..absoluteDegree = absoluteDegree ?? this.absoluteDegree
      ..isRetrograde = isRetrograde ?? this.isRetrograde
      ..interpretation = interpretation ?? this.interpretation;
  }
}

NatalReportNatalChartReportPlanetsNeptune
$NatalReportNatalChartReportPlanetsNeptuneFromJson(Map<String, dynamic> json) {
  final NatalReportNatalChartReportPlanetsNeptune
  natalReportNatalChartReportPlanetsNeptune =
      NatalReportNatalChartReportPlanetsNeptune();
  final String? sign = jsonConvert.convert<String>(json['sign']);
  if (sign != null) {
    natalReportNatalChartReportPlanetsNeptune.sign = sign;
  }
  final int? house = jsonConvert.convert<int>(json['house']);
  if (house != null) {
    natalReportNatalChartReportPlanetsNeptune.house = house;
  }
  final double? zodiacDegree = jsonConvert.convert<double>(
    json['zodiac_degree'],
  );
  if (zodiacDegree != null) {
    natalReportNatalChartReportPlanetsNeptune.zodiacDegree = zodiacDegree;
  }
  final double? absoluteDegree = jsonConvert.convert<double>(
    json['absolute_degree'],
  );
  if (absoluteDegree != null) {
    natalReportNatalChartReportPlanetsNeptune.absoluteDegree = absoluteDegree;
  }
  final bool? isRetrograde = jsonConvert.convert<bool>(json['is_retrograde']);
  if (isRetrograde != null) {
    natalReportNatalChartReportPlanetsNeptune.isRetrograde = isRetrograde;
  }
  final String? interpretation = jsonConvert.convert<String>(
    json['interpretation'],
  );
  if (interpretation != null) {
    natalReportNatalChartReportPlanetsNeptune.interpretation = interpretation;
  }
  return natalReportNatalChartReportPlanetsNeptune;
}

Map<String, dynamic> $NatalReportNatalChartReportPlanetsNeptuneToJson(
  NatalReportNatalChartReportPlanetsNeptune entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign'] = entity.sign;
  data['house'] = entity.house;
  data['zodiac_degree'] = entity.zodiacDegree;
  data['absolute_degree'] = entity.absoluteDegree;
  data['is_retrograde'] = entity.isRetrograde;
  data['interpretation'] = entity.interpretation;
  return data;
}

extension NatalReportNatalChartReportPlanetsNeptuneExtension
    on NatalReportNatalChartReportPlanetsNeptune {
  NatalReportNatalChartReportPlanetsNeptune copyWith({
    String? sign,
    int? house,
    double? zodiacDegree,
    double? absoluteDegree,
    bool? isRetrograde,
    String? interpretation,
  }) {
    return NatalReportNatalChartReportPlanetsNeptune()
      ..sign = sign ?? this.sign
      ..house = house ?? this.house
      ..zodiacDegree = zodiacDegree ?? this.zodiacDegree
      ..absoluteDegree = absoluteDegree ?? this.absoluteDegree
      ..isRetrograde = isRetrograde ?? this.isRetrograde
      ..interpretation = interpretation ?? this.interpretation;
  }
}

NatalReportNatalChartReportPlanetsPluto
$NatalReportNatalChartReportPlanetsPlutoFromJson(Map<String, dynamic> json) {
  final NatalReportNatalChartReportPlanetsPluto
  natalReportNatalChartReportPlanetsPluto =
      NatalReportNatalChartReportPlanetsPluto();
  final String? sign = jsonConvert.convert<String>(json['sign']);
  if (sign != null) {
    natalReportNatalChartReportPlanetsPluto.sign = sign;
  }
  final int? house = jsonConvert.convert<int>(json['house']);
  if (house != null) {
    natalReportNatalChartReportPlanetsPluto.house = house;
  }
  final double? zodiacDegree = jsonConvert.convert<double>(
    json['zodiac_degree'],
  );
  if (zodiacDegree != null) {
    natalReportNatalChartReportPlanetsPluto.zodiacDegree = zodiacDegree;
  }
  final double? absoluteDegree = jsonConvert.convert<double>(
    json['absolute_degree'],
  );
  if (absoluteDegree != null) {
    natalReportNatalChartReportPlanetsPluto.absoluteDegree = absoluteDegree;
  }
  final bool? isRetrograde = jsonConvert.convert<bool>(json['is_retrograde']);
  if (isRetrograde != null) {
    natalReportNatalChartReportPlanetsPluto.isRetrograde = isRetrograde;
  }
  final String? interpretation = jsonConvert.convert<String>(
    json['interpretation'],
  );
  if (interpretation != null) {
    natalReportNatalChartReportPlanetsPluto.interpretation = interpretation;
  }
  return natalReportNatalChartReportPlanetsPluto;
}

Map<String, dynamic> $NatalReportNatalChartReportPlanetsPlutoToJson(
  NatalReportNatalChartReportPlanetsPluto entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sign'] = entity.sign;
  data['house'] = entity.house;
  data['zodiac_degree'] = entity.zodiacDegree;
  data['absolute_degree'] = entity.absoluteDegree;
  data['is_retrograde'] = entity.isRetrograde;
  data['interpretation'] = entity.interpretation;
  return data;
}

extension NatalReportNatalChartReportPlanetsPlutoExtension
    on NatalReportNatalChartReportPlanetsPluto {
  NatalReportNatalChartReportPlanetsPluto copyWith({
    String? sign,
    int? house,
    double? zodiacDegree,
    double? absoluteDegree,
    bool? isRetrograde,
    String? interpretation,
  }) {
    return NatalReportNatalChartReportPlanetsPluto()
      ..sign = sign ?? this.sign
      ..house = house ?? this.house
      ..zodiacDegree = zodiacDegree ?? this.zodiacDegree
      ..absoluteDegree = absoluteDegree ?? this.absoluteDegree
      ..isRetrograde = isRetrograde ?? this.isRetrograde
      ..interpretation = interpretation ?? this.interpretation;
  }
}

NatalReportPredicationAnalysisResult
$NatalReportPredicationAnalysisResultFromJson(Map<String, dynamic> json) {
  final NatalReportPredicationAnalysisResult
  natalReportPredicationAnalysisResult = NatalReportPredicationAnalysisResult();
  final NatalReportPredicationAnalysisResultYesterday? yesterday = jsonConvert
      .convert<NatalReportPredicationAnalysisResultYesterday>(
        json['yesterday'],
      );
  if (yesterday != null) {
    natalReportPredicationAnalysisResult.yesterday = yesterday;
  }
  final NatalReportPredicationAnalysisResultToday? today = jsonConvert
      .convert<NatalReportPredicationAnalysisResultToday>(json['today']);
  if (today != null) {
    natalReportPredicationAnalysisResult.today = today;
  }
  final NatalReportPredicationAnalysisResultTomorrow? tomorrow = jsonConvert
      .convert<NatalReportPredicationAnalysisResultTomorrow>(json['tomorrow']);
  if (tomorrow != null) {
    natalReportPredicationAnalysisResult.tomorrow = tomorrow;
  }
  final NatalReportPredicationAnalysisResultWeek? week = jsonConvert
      .convert<NatalReportPredicationAnalysisResultWeek>(json['week']);
  if (week != null) {
    natalReportPredicationAnalysisResult.week = week;
  }
  final NatalReportPredicationAnalysisResultMonth? month = jsonConvert
      .convert<NatalReportPredicationAnalysisResultMonth>(json['month']);
  if (month != null) {
    natalReportPredicationAnalysisResult.month = month;
  }
  final NatalReportPredicationAnalysisResultYear? year = jsonConvert
      .convert<NatalReportPredicationAnalysisResultYear>(json['year']);
  if (year != null) {
    natalReportPredicationAnalysisResult.year = year;
  }
  return natalReportPredicationAnalysisResult;
}

Map<String, dynamic> $NatalReportPredicationAnalysisResultToJson(
  NatalReportPredicationAnalysisResult entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['yesterday'] = entity.yesterday?.toJson();
  data['today'] = entity.today?.toJson();
  data['tomorrow'] = entity.tomorrow?.toJson();
  data['week'] = entity.week?.toJson();
  data['month'] = entity.month?.toJson();
  data['year'] = entity.year?.toJson();
  return data;
}

extension NatalReportPredicationAnalysisResultExtension
    on NatalReportPredicationAnalysisResult {
  NatalReportPredicationAnalysisResult copyWith({
    NatalReportPredicationAnalysisResultYesterday? yesterday,
    NatalReportPredicationAnalysisResultToday? today,
    NatalReportPredicationAnalysisResultTomorrow? tomorrow,
    NatalReportPredicationAnalysisResultWeek? week,
    NatalReportPredicationAnalysisResultMonth? month,
    NatalReportPredicationAnalysisResultYear? year,
  }) {
    return NatalReportPredicationAnalysisResult()
      ..yesterday = yesterday ?? this.yesterday
      ..today = today ?? this.today
      ..tomorrow = tomorrow ?? this.tomorrow
      ..week = week ?? this.week
      ..month = month ?? this.month
      ..year = year ?? this.year;
  }
}

NatalReportPredicationAnalysisResultYesterday
$NatalReportPredicationAnalysisResultYesterdayFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportPredicationAnalysisResultYesterday
  natalReportPredicationAnalysisResultYesterday =
      NatalReportPredicationAnalysisResultYesterday();
  final String? summary = jsonConvert.convert<String>(json['summary']);
  if (summary != null) {
    natalReportPredicationAnalysisResultYesterday.summary = summary;
  }
  final String? love = jsonConvert.convert<String>(json['love']);
  if (love != null) {
    natalReportPredicationAnalysisResultYesterday.love = love;
  }
  final String? relationship = jsonConvert.convert<String>(
    json['relationship'],
  );
  if (relationship != null) {
    natalReportPredicationAnalysisResultYesterday.relationship = relationship;
  }
  final String? career = jsonConvert.convert<String>(json['career']);
  if (career != null) {
    natalReportPredicationAnalysisResultYesterday.career = career;
  }
  final String? wealth = jsonConvert.convert<String>(json['wealth']);
  if (wealth != null) {
    natalReportPredicationAnalysisResultYesterday.wealth = wealth;
  }
  final NatalReportPredicationAnalysisResultYesterdayScore? score = jsonConvert
      .convert<NatalReportPredicationAnalysisResultYesterdayScore>(
        json['score'],
      );
  if (score != null) {
    natalReportPredicationAnalysisResultYesterday.score = score;
  }
  final String? dod = jsonConvert.convert<String>(json['do']);
  if (dod != null) {
    natalReportPredicationAnalysisResultYesterday.dod = dod;
  }
  final String? avoid = jsonConvert.convert<String>(json['avoid']);
  if (avoid != null) {
    natalReportPredicationAnalysisResultYesterday.avoid = avoid;
  }
  final String? luckBoostingTip = jsonConvert.convert<String>(
    json['luck-boosting-tip'],
  );
  if (luckBoostingTip != null) {
    natalReportPredicationAnalysisResultYesterday.luckBoostingTip =
        luckBoostingTip;
  }
  return natalReportPredicationAnalysisResultYesterday;
}

Map<String, dynamic> $NatalReportPredicationAnalysisResultYesterdayToJson(
  NatalReportPredicationAnalysisResultYesterday entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['summary'] = entity.summary;
  data['love'] = entity.love;
  data['relationship'] = entity.relationship;
  data['career'] = entity.career;
  data['wealth'] = entity.wealth;
  data['score'] = entity.score?.toJson();
  data['do'] = entity.dod;
  data['avoid'] = entity.avoid;
  data['luck-boosting-tip'] = entity.luckBoostingTip;
  return data;
}

extension NatalReportPredicationAnalysisResultYesterdayExtension
    on NatalReportPredicationAnalysisResultYesterday {
  NatalReportPredicationAnalysisResultYesterday copyWith({
    String? summary,
    String? love,
    String? relationship,
    String? career,
    String? wealth,
    NatalReportPredicationAnalysisResultYesterdayScore? score,
    String? dod,
    String? avoid,
    String? luckBoostingTip,
  }) {
    return NatalReportPredicationAnalysisResultYesterday()
      ..summary = summary ?? this.summary
      ..love = love ?? this.love
      ..relationship = relationship ?? this.relationship
      ..career = career ?? this.career
      ..wealth = wealth ?? this.wealth
      ..score = score ?? this.score
      ..dod = dod ?? this.dod
      ..avoid = avoid ?? this.avoid
      ..luckBoostingTip = luckBoostingTip ?? this.luckBoostingTip;
  }
}

NatalReportPredicationAnalysisResultYesterdayScore
$NatalReportPredicationAnalysisResultYesterdayScoreFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportPredicationAnalysisResultYesterdayScore
  natalReportPredicationAnalysisResultYesterdayScore =
      NatalReportPredicationAnalysisResultYesterdayScore();
  final int? love = jsonConvert.convert<int>(json['love']);
  if (love != null) {
    natalReportPredicationAnalysisResultYesterdayScore.love = love;
  }
  final int? career = jsonConvert.convert<int>(json['career']);
  if (career != null) {
    natalReportPredicationAnalysisResultYesterdayScore.career = career;
  }
  final int? wealth = jsonConvert.convert<int>(json['wealth']);
  if (wealth != null) {
    natalReportPredicationAnalysisResultYesterdayScore.wealth = wealth;
  }
  return natalReportPredicationAnalysisResultYesterdayScore;
}

Map<String, dynamic> $NatalReportPredicationAnalysisResultYesterdayScoreToJson(
  NatalReportPredicationAnalysisResultYesterdayScore entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['love'] = entity.love;
  data['career'] = entity.career;
  data['wealth'] = entity.wealth;
  return data;
}

extension NatalReportPredicationAnalysisResultYesterdayScoreExtension
    on NatalReportPredicationAnalysisResultYesterdayScore {
  NatalReportPredicationAnalysisResultYesterdayScore copyWith({
    int? love,
    int? career,
    int? wealth,
  }) {
    return NatalReportPredicationAnalysisResultYesterdayScore()
      ..love = love ?? this.love
      ..career = career ?? this.career
      ..wealth = wealth ?? this.wealth;
  }
}

NatalReportPredicationAnalysisResultToday
$NatalReportPredicationAnalysisResultTodayFromJson(Map<String, dynamic> json) {
  final NatalReportPredicationAnalysisResultToday
  natalReportPredicationAnalysisResultToday =
      NatalReportPredicationAnalysisResultToday();
  final String? summary = jsonConvert.convert<String>(json['summary']);
  if (summary != null) {
    natalReportPredicationAnalysisResultToday.summary = summary;
  }
  final String? love = jsonConvert.convert<String>(json['love']);
  if (love != null) {
    natalReportPredicationAnalysisResultToday.love = love;
  }
  final String? relationship = jsonConvert.convert<String>(
    json['relationship'],
  );
  if (relationship != null) {
    natalReportPredicationAnalysisResultToday.relationship = relationship;
  }
  final String? career = jsonConvert.convert<String>(json['career']);
  if (career != null) {
    natalReportPredicationAnalysisResultToday.career = career;
  }
  final String? wealth = jsonConvert.convert<String>(json['wealth']);
  if (wealth != null) {
    natalReportPredicationAnalysisResultToday.wealth = wealth;
  }
  final NatalReportPredicationAnalysisResultTodayScore? score = jsonConvert
      .convert<NatalReportPredicationAnalysisResultTodayScore>(json['score']);
  if (score != null) {
    natalReportPredicationAnalysisResultToday.score = score;
  }
  final String? dod = jsonConvert.convert<String>(json['do']);
  if (dod != null) {
    natalReportPredicationAnalysisResultToday.dod = dod;
  }
  final String? avoid = jsonConvert.convert<String>(json['avoid']);
  if (avoid != null) {
    natalReportPredicationAnalysisResultToday.avoid = avoid;
  }
  final String? luckBoostingTip = jsonConvert.convert<String>(
    json['luck-boosting-tip'],
  );
  if (luckBoostingTip != null) {
    natalReportPredicationAnalysisResultToday.luckBoostingTip = luckBoostingTip;
  }
  return natalReportPredicationAnalysisResultToday;
}

Map<String, dynamic> $NatalReportPredicationAnalysisResultTodayToJson(
  NatalReportPredicationAnalysisResultToday entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['summary'] = entity.summary;
  data['love'] = entity.love;
  data['relationship'] = entity.relationship;
  data['career'] = entity.career;
  data['wealth'] = entity.wealth;
  data['score'] = entity.score?.toJson();
  data['do'] = entity.dod;
  data['avoid'] = entity.avoid;
  data['luck-boosting-tip'] = entity.luckBoostingTip;
  return data;
}

extension NatalReportPredicationAnalysisResultTodayExtension
    on NatalReportPredicationAnalysisResultToday {
  NatalReportPredicationAnalysisResultToday copyWith({
    String? summary,
    String? love,
    String? relationship,
    String? career,
    String? wealth,
    NatalReportPredicationAnalysisResultTodayScore? score,
    String? dod,
    String? avoid,
    String? luckBoostingTip,
  }) {
    return NatalReportPredicationAnalysisResultToday()
      ..summary = summary ?? this.summary
      ..love = love ?? this.love
      ..relationship = relationship ?? this.relationship
      ..career = career ?? this.career
      ..wealth = wealth ?? this.wealth
      ..score = score ?? this.score
      ..dod = dod ?? this.dod
      ..avoid = avoid ?? this.avoid
      ..luckBoostingTip = luckBoostingTip ?? this.luckBoostingTip;
  }
}

NatalReportPredicationAnalysisResultTodayScore
$NatalReportPredicationAnalysisResultTodayScoreFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportPredicationAnalysisResultTodayScore
  natalReportPredicationAnalysisResultTodayScore =
      NatalReportPredicationAnalysisResultTodayScore();
  final int? love = jsonConvert.convert<int>(json['love']);
  if (love != null) {
    natalReportPredicationAnalysisResultTodayScore.love = love;
  }
  final int? career = jsonConvert.convert<int>(json['career']);
  if (career != null) {
    natalReportPredicationAnalysisResultTodayScore.career = career;
  }
  final int? wealth = jsonConvert.convert<int>(json['wealth']);
  if (wealth != null) {
    natalReportPredicationAnalysisResultTodayScore.wealth = wealth;
  }
  return natalReportPredicationAnalysisResultTodayScore;
}

Map<String, dynamic> $NatalReportPredicationAnalysisResultTodayScoreToJson(
  NatalReportPredicationAnalysisResultTodayScore entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['love'] = entity.love;
  data['career'] = entity.career;
  data['wealth'] = entity.wealth;
  return data;
}

extension NatalReportPredicationAnalysisResultTodayScoreExtension
    on NatalReportPredicationAnalysisResultTodayScore {
  NatalReportPredicationAnalysisResultTodayScore copyWith({
    int? love,
    int? career,
    int? wealth,
  }) {
    return NatalReportPredicationAnalysisResultTodayScore()
      ..love = love ?? this.love
      ..career = career ?? this.career
      ..wealth = wealth ?? this.wealth;
  }
}

NatalReportPredicationAnalysisResultTomorrow
$NatalReportPredicationAnalysisResultTomorrowFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportPredicationAnalysisResultTomorrow
  natalReportPredicationAnalysisResultTomorrow =
      NatalReportPredicationAnalysisResultTomorrow();
  final String? summary = jsonConvert.convert<String>(json['summary']);
  if (summary != null) {
    natalReportPredicationAnalysisResultTomorrow.summary = summary;
  }
  final String? love = jsonConvert.convert<String>(json['love']);
  if (love != null) {
    natalReportPredicationAnalysisResultTomorrow.love = love;
  }
  final String? relationship = jsonConvert.convert<String>(
    json['relationship'],
  );
  if (relationship != null) {
    natalReportPredicationAnalysisResultTomorrow.relationship = relationship;
  }
  final String? career = jsonConvert.convert<String>(json['career']);
  if (career != null) {
    natalReportPredicationAnalysisResultTomorrow.career = career;
  }
  final String? wealth = jsonConvert.convert<String>(json['wealth']);
  if (wealth != null) {
    natalReportPredicationAnalysisResultTomorrow.wealth = wealth;
  }
  final NatalReportPredicationAnalysisResultTomorrowScore? score = jsonConvert
      .convert<NatalReportPredicationAnalysisResultTomorrowScore>(
        json['score'],
      );
  if (score != null) {
    natalReportPredicationAnalysisResultTomorrow.score = score;
  }
  final String? dod = jsonConvert.convert<String>(json['do']);
  if (dod != null) {
    natalReportPredicationAnalysisResultTomorrow.dod = dod;
  }
  final String? avoid = jsonConvert.convert<String>(json['avoid']);
  if (avoid != null) {
    natalReportPredicationAnalysisResultTomorrow.avoid = avoid;
  }
  final String? luckBoostingTip = jsonConvert.convert<String>(
    json['luck-boosting-tip'],
  );
  if (luckBoostingTip != null) {
    natalReportPredicationAnalysisResultTomorrow.luckBoostingTip =
        luckBoostingTip;
  }
  return natalReportPredicationAnalysisResultTomorrow;
}

Map<String, dynamic> $NatalReportPredicationAnalysisResultTomorrowToJson(
  NatalReportPredicationAnalysisResultTomorrow entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['summary'] = entity.summary;
  data['love'] = entity.love;
  data['relationship'] = entity.relationship;
  data['career'] = entity.career;
  data['wealth'] = entity.wealth;
  data['score'] = entity.score?.toJson();
  data['do'] = entity.dod;
  data['avoid'] = entity.avoid;
  data['luck-boosting-tip'] = entity.luckBoostingTip;
  return data;
}

extension NatalReportPredicationAnalysisResultTomorrowExtension
    on NatalReportPredicationAnalysisResultTomorrow {
  NatalReportPredicationAnalysisResultTomorrow copyWith({
    String? summary,
    String? love,
    String? relationship,
    String? career,
    String? wealth,
    NatalReportPredicationAnalysisResultTomorrowScore? score,
    String? dod,
    String? avoid,
    String? luckBoostingTip,
  }) {
    return NatalReportPredicationAnalysisResultTomorrow()
      ..summary = summary ?? this.summary
      ..love = love ?? this.love
      ..relationship = relationship ?? this.relationship
      ..career = career ?? this.career
      ..wealth = wealth ?? this.wealth
      ..score = score ?? this.score
      ..dod = dod ?? this.dod
      ..avoid = avoid ?? this.avoid
      ..luckBoostingTip = luckBoostingTip ?? this.luckBoostingTip;
  }
}

NatalReportPredicationAnalysisResultTomorrowScore
$NatalReportPredicationAnalysisResultTomorrowScoreFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportPredicationAnalysisResultTomorrowScore
  natalReportPredicationAnalysisResultTomorrowScore =
      NatalReportPredicationAnalysisResultTomorrowScore();
  final int? love = jsonConvert.convert<int>(json['love']);
  if (love != null) {
    natalReportPredicationAnalysisResultTomorrowScore.love = love;
  }
  final int? career = jsonConvert.convert<int>(json['career']);
  if (career != null) {
    natalReportPredicationAnalysisResultTomorrowScore.career = career;
  }
  final int? wealth = jsonConvert.convert<int>(json['wealth']);
  if (wealth != null) {
    natalReportPredicationAnalysisResultTomorrowScore.wealth = wealth;
  }
  return natalReportPredicationAnalysisResultTomorrowScore;
}

Map<String, dynamic> $NatalReportPredicationAnalysisResultTomorrowScoreToJson(
  NatalReportPredicationAnalysisResultTomorrowScore entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['love'] = entity.love;
  data['career'] = entity.career;
  data['wealth'] = entity.wealth;
  return data;
}

extension NatalReportPredicationAnalysisResultTomorrowScoreExtension
    on NatalReportPredicationAnalysisResultTomorrowScore {
  NatalReportPredicationAnalysisResultTomorrowScore copyWith({
    int? love,
    int? career,
    int? wealth,
  }) {
    return NatalReportPredicationAnalysisResultTomorrowScore()
      ..love = love ?? this.love
      ..career = career ?? this.career
      ..wealth = wealth ?? this.wealth;
  }
}

NatalReportPredicationAnalysisResultWeek
$NatalReportPredicationAnalysisResultWeekFromJson(Map<String, dynamic> json) {
  final NatalReportPredicationAnalysisResultWeek
  natalReportPredicationAnalysisResultWeek =
      NatalReportPredicationAnalysisResultWeek();
  final String? luckBoostingTip = jsonConvert.convert<String>(
    json['luck-boosting-tip'],
  );
  if (luckBoostingTip != null) {
    natalReportPredicationAnalysisResultWeek.luckBoostingTip = luckBoostingTip;
  }
  final String? summary = jsonConvert.convert<String>(json['summary']);
  if (summary != null) {
    natalReportPredicationAnalysisResultWeek.summary = summary;
  }
  final String? love = jsonConvert.convert<String>(json['love']);
  if (love != null) {
    natalReportPredicationAnalysisResultWeek.love = love;
  }
  final String? relationship = jsonConvert.convert<String>(
    json['relationship'],
  );
  if (relationship != null) {
    natalReportPredicationAnalysisResultWeek.relationship = relationship;
  }
  final String? career = jsonConvert.convert<String>(json['career']);
  if (career != null) {
    natalReportPredicationAnalysisResultWeek.career = career;
  }
  final String? wealth = jsonConvert.convert<String>(json['wealth']);
  if (wealth != null) {
    natalReportPredicationAnalysisResultWeek.wealth = wealth;
  }
  return natalReportPredicationAnalysisResultWeek;
}

Map<String, dynamic> $NatalReportPredicationAnalysisResultWeekToJson(
  NatalReportPredicationAnalysisResultWeek entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['luck-boosting-tip'] = entity.luckBoostingTip;
  data['summary'] = entity.summary;
  data['love'] = entity.love;
  data['relationship'] = entity.relationship;
  data['career'] = entity.career;
  data['wealth'] = entity.wealth;
  return data;
}

extension NatalReportPredicationAnalysisResultWeekExtension
    on NatalReportPredicationAnalysisResultWeek {
  NatalReportPredicationAnalysisResultWeek copyWith({
    String? luckBoostingTip,
    String? summary,
    String? love,
    String? relationship,
    String? career,
    String? wealth,
  }) {
    return NatalReportPredicationAnalysisResultWeek()
      ..luckBoostingTip = luckBoostingTip ?? this.luckBoostingTip
      ..summary = summary ?? this.summary
      ..love = love ?? this.love
      ..relationship = relationship ?? this.relationship
      ..career = career ?? this.career
      ..wealth = wealth ?? this.wealth;
  }
}

NatalReportPredicationAnalysisResultMonth
$NatalReportPredicationAnalysisResultMonthFromJson(Map<String, dynamic> json) {
  final NatalReportPredicationAnalysisResultMonth
  natalReportPredicationAnalysisResultMonth =
      NatalReportPredicationAnalysisResultMonth();
  final String? summary = jsonConvert.convert<String>(json['summary']);
  if (summary != null) {
    natalReportPredicationAnalysisResultMonth.summary = summary;
  }
  final List<NatalReportPredicationAnalysisResultMonthDecades>? decades =
      (json['decades'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<
                      NatalReportPredicationAnalysisResultMonthDecades
                    >(e)
                    as NatalReportPredicationAnalysisResultMonthDecades,
          )
          .toList();
  if (decades != null) {
    natalReportPredicationAnalysisResultMonth.decades = decades;
  }
  final String? relationshipSummary = jsonConvert.convert<String>(
    json['relationship_summary'],
  );
  if (relationshipSummary != null) {
    natalReportPredicationAnalysisResultMonth.relationshipSummary =
        relationshipSummary;
  }
  final String? careerSummary = jsonConvert.convert<String>(
    json['career_summary'],
  );
  if (careerSummary != null) {
    natalReportPredicationAnalysisResultMonth.careerSummary = careerSummary;
  }
  final String? wealthSummary = jsonConvert.convert<String>(
    json['wealth_summary'],
  );
  if (wealthSummary != null) {
    natalReportPredicationAnalysisResultMonth.wealthSummary = wealthSummary;
  }
  return natalReportPredicationAnalysisResultMonth;
}

Map<String, dynamic> $NatalReportPredicationAnalysisResultMonthToJson(
  NatalReportPredicationAnalysisResultMonth entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['summary'] = entity.summary;
  data['decades'] = entity.decades?.map((v) => v.toJson()).toList();
  data['relationship_summary'] = entity.relationshipSummary;
  data['career_summary'] = entity.careerSummary;
  data['wealth_summary'] = entity.wealthSummary;
  return data;
}

extension NatalReportPredicationAnalysisResultMonthExtension
    on NatalReportPredicationAnalysisResultMonth {
  NatalReportPredicationAnalysisResultMonth copyWith({
    String? summary,
    List<NatalReportPredicationAnalysisResultMonthDecades>? decades,
    String? relationshipSummary,
    String? careerSummary,
    String? wealthSummary,
  }) {
    return NatalReportPredicationAnalysisResultMonth()
      ..summary = summary ?? this.summary
      ..decades = decades ?? this.decades
      ..relationshipSummary = relationshipSummary ?? this.relationshipSummary
      ..careerSummary = careerSummary ?? this.careerSummary
      ..wealthSummary = wealthSummary ?? this.wealthSummary;
  }
}

NatalReportPredicationAnalysisResultMonthDecades
$NatalReportPredicationAnalysisResultMonthDecadesFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportPredicationAnalysisResultMonthDecades
  natalReportPredicationAnalysisResultMonthDecades =
      NatalReportPredicationAnalysisResultMonthDecades();
  final String? range = jsonConvert.convert<String>(json['range']);
  if (range != null) {
    natalReportPredicationAnalysisResultMonthDecades.range = range;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    natalReportPredicationAnalysisResultMonthDecades.content = content;
  }
  return natalReportPredicationAnalysisResultMonthDecades;
}

Map<String, dynamic> $NatalReportPredicationAnalysisResultMonthDecadesToJson(
  NatalReportPredicationAnalysisResultMonthDecades entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['range'] = entity.range;
  data['content'] = entity.content;
  return data;
}

extension NatalReportPredicationAnalysisResultMonthDecadesExtension
    on NatalReportPredicationAnalysisResultMonthDecades {
  NatalReportPredicationAnalysisResultMonthDecades copyWith({
    String? range,
    String? content,
  }) {
    return NatalReportPredicationAnalysisResultMonthDecades()
      ..range = range ?? this.range
      ..content = content ?? this.content;
  }
}

NatalReportPredicationAnalysisResultYear
$NatalReportPredicationAnalysisResultYearFromJson(Map<String, dynamic> json) {
  final NatalReportPredicationAnalysisResultYear
  natalReportPredicationAnalysisResultYear =
      NatalReportPredicationAnalysisResultYear();
  final String? summary = jsonConvert.convert<String>(json['summary']);
  if (summary != null) {
    natalReportPredicationAnalysisResultYear.summary = summary;
  }
  final List<NatalReportPredicationAnalysisResultYearQuarters>? quarters =
      (json['quarters'] as List<dynamic>?)
          ?.map(
            (e) =>
                jsonConvert.convert<
                      NatalReportPredicationAnalysisResultYearQuarters
                    >(e)
                    as NatalReportPredicationAnalysisResultYearQuarters,
          )
          .toList();
  if (quarters != null) {
    natalReportPredicationAnalysisResultYear.quarters = quarters;
  }
  final String? relationshipSummary = jsonConvert.convert<String>(
    json['relationship_summary'],
  );
  if (relationshipSummary != null) {
    natalReportPredicationAnalysisResultYear.relationshipSummary =
        relationshipSummary;
  }
  final String? careerSummary = jsonConvert.convert<String>(
    json['career_summary'],
  );
  if (careerSummary != null) {
    natalReportPredicationAnalysisResultYear.careerSummary = careerSummary;
  }
  final String? wealthSummary = jsonConvert.convert<String>(
    json['wealth_summary'],
  );
  if (wealthSummary != null) {
    natalReportPredicationAnalysisResultYear.wealthSummary = wealthSummary;
  }
  return natalReportPredicationAnalysisResultYear;
}

Map<String, dynamic> $NatalReportPredicationAnalysisResultYearToJson(
  NatalReportPredicationAnalysisResultYear entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['summary'] = entity.summary;
  data['quarters'] = entity.quarters?.map((v) => v.toJson()).toList();
  data['relationship_summary'] = entity.relationshipSummary;
  data['career_summary'] = entity.careerSummary;
  data['wealth_summary'] = entity.wealthSummary;
  return data;
}

extension NatalReportPredicationAnalysisResultYearExtension
    on NatalReportPredicationAnalysisResultYear {
  NatalReportPredicationAnalysisResultYear copyWith({
    String? summary,
    List<NatalReportPredicationAnalysisResultYearQuarters>? quarters,
    String? relationshipSummary,
    String? careerSummary,
    String? wealthSummary,
  }) {
    return NatalReportPredicationAnalysisResultYear()
      ..summary = summary ?? this.summary
      ..quarters = quarters ?? this.quarters
      ..relationshipSummary = relationshipSummary ?? this.relationshipSummary
      ..careerSummary = careerSummary ?? this.careerSummary
      ..wealthSummary = wealthSummary ?? this.wealthSummary;
  }
}

NatalReportPredicationAnalysisResultYearQuarters
$NatalReportPredicationAnalysisResultYearQuartersFromJson(
  Map<String, dynamic> json,
) {
  final NatalReportPredicationAnalysisResultYearQuarters
  natalReportPredicationAnalysisResultYearQuarters =
      NatalReportPredicationAnalysisResultYearQuarters();
  final String? range = jsonConvert.convert<String>(json['range']);
  if (range != null) {
    natalReportPredicationAnalysisResultYearQuarters.range = range;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    natalReportPredicationAnalysisResultYearQuarters.content = content;
  }
  return natalReportPredicationAnalysisResultYearQuarters;
}

Map<String, dynamic> $NatalReportPredicationAnalysisResultYearQuartersToJson(
  NatalReportPredicationAnalysisResultYearQuarters entity,
) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['range'] = entity.range;
  data['content'] = entity.content;
  return data;
}

extension NatalReportPredicationAnalysisResultYearQuartersExtension
    on NatalReportPredicationAnalysisResultYearQuarters {
  NatalReportPredicationAnalysisResultYearQuarters copyWith({
    String? range,
    String? content,
  }) {
    return NatalReportPredicationAnalysisResultYearQuarters()
      ..range = range ?? this.range
      ..content = content ?? this.content;
  }
}
