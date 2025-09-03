import 'package:flutter/material.dart';
import 'package:flutter_onscreen_logger/flutter_onscreen_logger.dart';

class PrintTools {
  /// Add this to your widget tree
  Widget buildLogOverlay(Widget child) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(children: [child, LoggerOverlayWidget()]),
    );
  }

  static logE(dynamic data) {
    OnScreenLog.e(title: 'Error', message: '$data');
  }

  static logW(dynamic data) {
    OnScreenLog.w(title: 'Warning', message: '$data');
  }

  static logI(dynamic data) {
    OnScreenLog.i(title: 'Info', message: '$data');
  }

  static logS(dynamic data) {
    OnScreenLog.s(title: 'Info', message: '$data');
  }
}
