import 'package:get/get.dart';

///安全find
S? safeFind<S>() {
  if (Get.isRegistered<S>() == true) {
    final s = Get.find<S>();
    return s;
  }
  return null;
}
