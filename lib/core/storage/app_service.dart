import 'dart:async';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();

  String? deviceIdentifier;
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  final _androidIdPlugin = const AndroidId();

  //Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onReady() {
    super.onReady();
    /*_timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      final now = DateTime.now();
      if (now.hour == 0 && now.minute == 0) {
        // _refreshData(); // 执行接口刷新
      }
    });*/
  }

  @override
  void onClose() {
    super.onClose();
    //_timer?.cancel();
  }

  Future<AppService> init() async {
    if (GetPlatform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin.iosInfo;
      deviceIdentifier = iosDeviceInfo.identifierForVendor ?? "";
    } else if (GetPlatform.isAndroid) {
      final String? androidId = await _androidIdPlugin.getId();
      AndroidDeviceInfo androidDeviceInfo = await _deviceInfoPlugin.androidInfo;
      deviceIdentifier = "$androidId-${androidDeviceInfo.brand}";
    }
    return this;
  }
}
