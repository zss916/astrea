import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();

  String? deviceIdentifier;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  final _androidIdPlugin = const AndroidId();

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
