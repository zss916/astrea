part of 'index.dart';

class AddFileBinding implements Bindings {
  @override
  void dependencies() => Get.put<AddFileLogic>(AddFileLogic());
}
