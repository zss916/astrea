part of 'index.dart';

class StarReportLogic extends GetxController {
  AnalysisArticleEntity? article;

  num get soul => (article?.scores?.soulIndex ?? 0);
  num get emotion => (article?.scores?.emotionalIndex ?? 0);
  num get attraction => (article?.scores?.attractionIndex ?? 0);
  String get summary => (article?.summary ?? "");
  String get analysis => (article?.analysis ?? "");
  List<AnalysisArticleMeanings> get meanings => (article?.meanings ?? []);

  num? firstId;
  num? secondId;
  String? relationship;
  bool? isSave;

  int viewState = Status.init.index;

  String? userName;
  String? userAvatar;
  String? friendName;
  String? friendAvatar;

  int? id;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() {
    if ((Get.arguments != null) && (Get.arguments is Map)) {
      Map map = Get.arguments as Map;
      firstId = map["firstId"];
      secondId = map["secondId"];
      relationship = map["relationship"];
      isSave = map["isSave"];
    }

    if (Get.parameters["userName"] != null) {
      userName = Get.parameters["userName"];
    }
    if (Get.parameters["userAvatar"] != null) {
      userAvatar = Get.parameters["userAvatar"];
    }
    if (Get.parameters["friendName"] != null) {
      friendName = Get.parameters["friendName"];
    }
    if (Get.parameters["friendAvatar"] != null) {
      friendAvatar = Get.parameters["friendAvatar"];
    }
    viewState = Status.init.index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    loadAnalysis(
      firstId: firstId ?? 0,
      secondId: secondId ?? 0,
      relationship: relationship ?? "",
    );
  }

  ///获取合盘分析
  Future<void> loadAnalysis({
    required num firstId,
    required num secondId,
    required String relationship,
  }) async {
    //AppLoading.show();
    await SynastryAPI.updateAnalysis(
      userId: firstId,
      otherId: secondId,
      relationship: relationship,
    ).then((value) async {
      id = value.synastryId;
      if (id != null) {
        article = await SynastryAPI.getAnalysis(id: id.toString());
        viewState = article != null ? Status.data.index : Status.empty.index;
        update();
      }
    });
  }

  ///获取合盘分析内容
  /*Future<void> getAnalysis({required String id}) async {
    AppLoading.show();
    article = await SynastryAPI.getAnalysis(id: id).whenComplete(() {
      AppLoading.dismiss();
    });
    update();
  }*/

  void toCollection() {
    if (isSave == true) {
      deleteCollection(id: id.toString());
    } else {
      postCollection(id: id.toString());
    }
  }

  void toBack() {
    if (isSave != true) {
      showCommonDialog(
        content: LanKey.saveTip.tr,
        contentStyle: TextStyle(
          color: const Color(0xFF6A676C),
          fontSize: 17,
          fontFamily: AppFonts.textFontFamily,
        ),
        leftButtonText: LanKey.cancel.tr,
        rightButtonText: LanKey.save.tr,
        onRightButtonCall: () {
          postCollection(
            id: id.toString(),
            onSuccess: () {
              Get.back(closeOverlays: true);
            },
          );
        },
        routeName: APages.chartReportDialog,
      );
    } else {
      Get.back(closeOverlays: true);
    }
  }

  ///收藏
  Future<void> postCollection({required String id, Function? onSuccess}) async {
    AppLoading.show();
    bool isSuccessful = await SynastryAPI.postCollection(id: id).whenComplete(
      () {
        AppLoading.dismiss();
      },
    );
    if (isSuccessful) {
      isSave = true;
    }
    update();
    onSuccess?.call();
  }

  ///取消收藏
  Future<void> deleteCollection({required String id}) async {
    AppLoading.show();
    bool isSuccessful = await SynastryAPI.deleteCollection(id: id).whenComplete(
      () {
        AppLoading.dismiss();
      },
    );
    if (isSuccessful) {
      isSave = false;
    }
    update();
  }
}
