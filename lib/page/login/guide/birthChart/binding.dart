part of 'index.dart';

class GuideBinding implements Bindings {
  @override
  void dependencies() => Get.put<GuideLogic>(GuideLogic());
}
