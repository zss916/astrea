import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:get/get.dart';

enum LoginChannel {
  email(value: 0, symbol: 'Email'),
  google(value: 1, symbol: 'Google'),
  apple(value: 2, symbol: 'Apple');

  final int value;
  final String symbol;

  const LoginChannel({required this.value, required this.symbol});

  static String getSymbol(int value) =>
      LoginChannel.values.firstWhere((e) => e.value == value).symbol;
}

enum LoginStep {
  step0(value: 0, symbol: 'birth chart'),
  step1(value: 1, symbol: 'date of birth'),
  step2(value: 2, symbol: 'time of birth'),
  step3(value: 3, symbol: 'place of birth'),
  step4(value: 4, symbol: 'your gender'),
  step5(value: 5, symbol: 'your name'),
  step6(value: 6, symbol: 'interests'),
  stepFinish(value: 7, symbol: 'finish record');

  final int value;
  final String symbol;

  const LoginStep({required this.value, required this.symbol});

  static String getSymbol(int value) =>
      LoginStep.values.firstWhere((e) => e.value == value).symbol;
}

enum AppPlanets {
  aries(value: 0, symbol: 'Aries'),
  taurus(value: 1, symbol: 'Taurus'),
  gemini(value: 3, symbol: 'Gemini'),
  cancer(value: 4, symbol: 'Cancer,'),
  leo(value: 5, symbol: 'Leo'),
  virgo(value: 6, symbol: 'Virgo'),
  libra(value: 7, symbol: 'Libra'),
  scorpio(value: 8, symbol: 'Scorpio'),
  sagittarius(value: 9, symbol: 'Sagittarius'),
  capricorn(value: 10, symbol: 'Capricorn'),
  aquarius(value: 11, symbol: 'Aquarius'),
  pisces(value: 12, symbol: 'Pisces');

  final int value;
  final String symbol;

  const AppPlanets({required this.value, required this.symbol});

  static String getSymbol(int value) =>
      AppPlanets.values.firstWhere((e) => e.value == value).symbol;
}

List<Map<String, dynamic>> get starIcons => [
  {"img": Assets.imageAnalysisAries, "name": LanKey.aries.tr},
  {"img": Assets.imageAnalysisTaurus, "name": LanKey.taurus.tr},
  {"img": Assets.imageAnalysisGemini, "name": LanKey.gemini.tr},
  {"img": Assets.imageAnalysisCancer, "name": LanKey.cancer.tr},
  {"img": Assets.imageAnalysisLeo, "name": LanKey.leo.tr},
  {"img": Assets.imageAnalysisVirgo, "name": LanKey.virgo.tr},
  {"img": Assets.imageAnalysisLibra, "name": LanKey.libra.tr},
  {"img": Assets.imageAnalysisScorpio, "name": LanKey.scorpio.tr},
  {"img": Assets.imageAnalysisSagittarius, "name": LanKey.sagittarius.tr},
  {"img": Assets.imageAnalysisCapricorn, "name": LanKey.capricorn.tr},
  {"img": Assets.imageAnalysisAquarius, "name": LanKey.aquarius.tr},
  {"img": Assets.imageAnalysisPisces, "name": LanKey.pisces.tr},
];

enum Status { init, data, empty, error }
