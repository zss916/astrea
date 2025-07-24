import 'package:get/get.dart';
import 'package:astrea/page/home/horoscope/index/logic.dart';

class HoroscopeBinding implements Bindings {
  @override
  void dependencies() => Get.put<HoroscopeLogic>(HoroscopeLogic());
}
