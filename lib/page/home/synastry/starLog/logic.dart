part of 'index.dart';

class LogsLogic extends GetxController {
  List<AnalysisEntity> list = [];

  int viewState = Status.init.index;
  CancelToken cancelToken = CancelToken();

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

  @override
  void onClose() {
    cancelToken.cancel();
    super.onClose();
  }

  ///加载朋友列表
  Future<void> loadData() async {
    viewState = Status.init.index;
    update();
    (bool, List<AnalysisEntity>) value = await SynastryAPI.getAnalysisList(
      cancelToken: cancelToken,
    );
    if (!value.$1) {
      viewState = Status.error.index;
      update();
      return;
    } else {
      list.clear();
      list.addAll(value.$2);
      viewState = list.isNotEmpty ? Status.data.index : Status.empty.index;
      update();
    }
  }
}
