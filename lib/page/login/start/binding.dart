part of 'index.dart';

class StartBinding implements Bindings {
  @override
  void dependencies() => Get.put<StartLogic>(StartLogic());
}
