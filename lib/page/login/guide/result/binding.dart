part of 'index.dart';

class ResultBinding implements Bindings {
  @override
  void dependencies() => Get.put<ResultLogic>(ResultLogic());
}
