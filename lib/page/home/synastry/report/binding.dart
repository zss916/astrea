part of 'index.dart';

class StarReportBinding implements Bindings {
  @override
  void dependencies() => Get.put<StarReportLogic>(StarReportLogic());
}
