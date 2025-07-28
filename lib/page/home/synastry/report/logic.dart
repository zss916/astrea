part of 'index.dart';

class StarReportLogic extends GetxController {
  AnalysisArticleEntity? value;

  @override
  void onInit() {
    super.onInit();
    // initLocalData();
  }

  void initLocalData() {}

  @override
  void onReady() {
    super.onReady();
  }

  ///加载朋友列表
  Future<void> getAnalysis({required String id}) async {
    AppLoading.show();
    value = await SynastryAPI.getAnalysis(id: id).whenComplete(() {
      AppLoading.dismiss();
    });
    update();
  }
}
