part of 'index.dart';

class EmailBinding implements Bindings {
  @override
  void dependencies() => Get.put<EmailLogic>(EmailLogic());
}
