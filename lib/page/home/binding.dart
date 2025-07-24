part of 'index.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeLogic>(HomeLogic());
    Get.put<AccountLogic>(AccountLogic());
    Get.put<HoroscopeLogic>(HoroscopeLogic());
  }
}
