part of 'index.dart';

class LogsBinding implements Bindings {
  @override
  void dependencies() => Get.put<LogsLogic>(LogsLogic());
}
