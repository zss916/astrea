part of 'index.dart';

class LogsLogic extends GetxController {
  List<dynamic> list = [];

  @override
  void onInit() {
    super.onInit();
    // initLocalData();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  ///加载朋友列表
  Future<void> loadData() async {
    AppLoading.show();
    List<AnalysisEntity> value = await SynastryAPI.getAnalysisList()
        .whenComplete(() {
          AppLoading.dismiss();
        });
    list.clear();
    list.addAll(value);
    update();
  }
}
