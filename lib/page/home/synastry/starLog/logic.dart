part of 'index.dart';

class LogsLogic extends GetxController {
  List<AnalysisEntity> list = [];

  int viewState = Status.init.index;

  ///0 loading, 1 data, 2 empty

  @override
  void onInit() {
    super.onInit();
    initView();
  }

  void initView() {
    viewState = Status.init.index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  ///加载朋友列表
  Future<void> loadData() async {
    //AppLoading.show();
    List<AnalysisEntity> value = await SynastryAPI.getAnalysisList()
        .whenComplete(() {
          // AppLoading.dismiss();
        });
    list.clear();
    list.addAll(value);
    viewState = list.isNotEmpty ? Status.data.index : Status.empty.index;
    update();
  }
}
