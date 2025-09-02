import 'package:flutter/material.dart';
import 'package:flutter_dev_toolkit/core/default_logger.dart';
import 'package:flutter_dev_toolkit/core/dev_toolkit_config.dart';
import 'package:flutter_dev_toolkit/flutter_dev_toolkit.dart';
import 'package:flutter_dev_toolkit/models/built_in_plugin_type.dart';
import 'package:flutter_dev_toolkit/ui/log_overlay.dart';

class DevTools {
  /// 初始化
  static void init() {
    ///本地调试工具(在runApp 之前)
    FlutterDevToolkit.init(
      config: DevToolkitConfig(
        logger: DefaultLogger(),
        disableBuiltInPlugins: [
          // BuiltInPluginType.logs,
          BuiltInPluginType.network,
          BuiltInPluginType.routes,
          BuiltInPluginType.deviceInfo,
        ],
      ),
    );
  }

  /// 打开调试工具（builder ）
  static Widget openDevOverlay(Widget child) {
    return Stack(
      children: [
        child,

        ///本地调试工具
        const DevOverlay(),
      ],
    );
  }

  /// 打印日志
  static log(dynamic data) => FlutterDevToolkit.logger.log('$data');
}
