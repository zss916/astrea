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
