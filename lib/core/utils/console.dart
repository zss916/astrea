part of 'index.dart';

abstract class Console {
  static final _log = Logger(filter: _LogFilter());

  static void log(dynamic message) {
    ///本地调试
    FlutterDevToolkit.logger.log("message:$message", level: LogLevel.error);
    return _log.d(message);
  }
}

class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => !kReleaseMode;
}
