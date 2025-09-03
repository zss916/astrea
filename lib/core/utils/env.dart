class Env {
  static const String env = String.fromEnvironment('env', defaultValue: '');

  static const bool showLogger = bool.fromEnvironment(
    'showLogger',
    defaultValue: false,
  );

  static const bool isTest = bool.fromEnvironment('isTest', defaultValue: true);
}

class AppConstant {
  static const String appName = "Astrea";
}
