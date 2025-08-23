import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_api_availability/google_api_availability.dart';

class AvailabilityHelper {
  /// 检查Google Play服务
  static Future<bool> checkGooglePlay() async {
    try {
      GooglePlayServicesAvailability availability = await GoogleApiAvailability
          .instance
          .checkGooglePlayServicesAvailability(true);
      return availability == GooglePlayServicesAvailability.success;
    } on PlatformException {
      GooglePlayServicesAvailability availability =
          GooglePlayServicesAvailability.unknown;
      return false;
    }
  }
}

///安全find
S? safeFind<S>() {
  if (Get.isRegistered<S>() == true) {
    final s = Get.find<S>();
    return s;
  }
  return null;
}
