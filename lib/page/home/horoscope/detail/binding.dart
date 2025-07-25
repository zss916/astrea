part of 'index.dart';

class AnalysisBinding implements Bindings {
  @override
  void dependencies() => Get.put<AnalysisLogic>(AnalysisLogic());
}
