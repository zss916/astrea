part of 'index.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() => Get.put<WelcomeLogic>(WelcomeLogic());
}
