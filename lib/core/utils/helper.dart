import 'package:flutter/services.dart';
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
