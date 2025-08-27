part of 'index.dart';

class StarReportLogic extends GetxController {
  AnalysisArticleEntity? article;

  ///灵魂
  num get soul => (article?.scores?.soulIndex ?? 0);

  ///情感
  num get emotion => (article?.scores?.emotionalIndex ?? 0);

  ///吸引
  num get attraction => (article?.scores?.attractionIndex ?? 0);

  ///思考
  num get thoughtResonance => (article?.scores?.thoughtResonanceIndex ?? 0);

  ///相互增长
  num get mutualGrowth => (article?.scores?.mutualGrowthIndex ?? 0);

  ///舒适边界
  num get comfortBoundary => (article?.scores?.comfortBoundaryIndex ?? 0);

  /// 安全
  num get emotionalSecurity => (article?.scores?.emotionalSecurityIndex ?? 0);

  /// 因果报应
  num get karma => (article?.scores?.karmaIndex ?? 0);

  /// 无条件支持
  num get unconditionalSupport =>
      (article?.scores?.unconditionalSupportIndex ?? 0);

  /// 沟通顺畅
  num get smoothCommunication =>
      (article?.scores?.smoothCommunicationIndex ?? 0);

  /// 领导结构
  num get authoritativeStructure =>
      (article?.scores?.authoritativeStructureIndex ?? 0);

  /// 成长与培养
  num get growthAndCultivation =>
      (article?.scores?.growthAndCultivationIndex ?? 0);

  /// 行动协调
  num get actionCoordination => (article?.scores?.actionCoordinationIndex ?? 0);

  /// 总结
  String get summary => (article?.summary ?? "");

  /// 详细
  String get analysis => (article?.analysis ?? "");

  /// 每日建议
  String get dailyAdvice => (article?.dailyAdvice ?? "");

  /// 趋势
  String get trend3Months => (article?.trend3Months ?? "");
  List<AnalysisArticleMeanings> get meanings => (article?.meanings ?? []);

  ///lover => soul,emotion,attraction
  ///family => unconditionalSupport,karma,emotionalSecurity
  ///friend => thoughtResonance,mutualGrowth,comfortBoundary
  ///customers => smoothCommunication,mutualGrowth,comfortBoundary
  ///Colleagues => authoritativeStructure,growthAndCultivation,actionCoordination

  Map<String, dynamic> get json => {
    "lover": {
      "key1": "Soul\nMatch",
      "value1": soul,
      "key2": "Emotion\nSync",
      "value2": emotion,
      "key3": "Attraction\n",
      "value3": attraction,
    },
    "family": {
      "key1": "Emotional\nSecurity",
      "value1": unconditionalSupport,
      "key2": "Karmic\nBond",
      "value2": karma,
      "key3": "Full\nSupport",
      "value3": emotionalSecurity,
    },
    "friend": {
      "key1": "Ideology\nMatch",
      "value1": thoughtResonance,
      "key2": "Mutual\nGrowth",
      "value2": mutualGrowth,
      "key3": " Comfort\nZone",
      "value3": comfortBoundary,
    },
    "client": {
      "key1": "Flow\nChat",
      "value1": smoothCommunication,
      "key2": "Mutual\nGrowth",
      "value2": mutualGrowth,
      "key3": "Comfort\nZone",
      "value3": comfortBoundary,
    },
    "colleague": {
      "key1": "Flow\nChat",
      "value1": authoritativeStructure,
      "key2": "Long\nPartnership",
      "value2": growthAndCultivation,
      "key3": "Wealth\nGrowth",
      "value3": actionCoordination,
    },
    "partners": {
      "key1": "partners",
      "value1": 0,
      "key2": "partners",
      "value2": 0,
      "key3": "partners",
      "value3": 0,
    },
  };

  num? firstId;
  num? secondId;
  String? relationship;
  bool? isSave;

  int viewState = Status.init.index;

  String? userName;
  String? userAvatar;
  String? friendName;
  String? friendAvatar;

  String? id;

  ///scores
  String? title1;
  num? value1;
  String? title2;
  num? value2;
  String? title3;
  num? value3;

  CancelToken cancelToken = CancelToken();
  CancelToken analysisCancelToken = CancelToken();

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onClose() {
    cancelToken.cancel();
    analysisCancelToken.cancel("analysis Cancel");
    super.onClose();
    AppLoading.dismiss();
    SynastryAPI.stopPolling();
  }

  void initData() {
    _parseArguments();
    _parseParameters();
    viewState = Status.init.index;
    update();
  }

  /// 解析传递的参数
  void _parseArguments() {
    if (Get.arguments is Map) {
      final map = Get.arguments as Map;
      firstId = map["firstId"];
      secondId = map["secondId"];
      relationship = map["relationship"];
      isSave = map["isSave"];
      id = map["id"];
    }
  }

  /// 解析路由参数
  void _parseParameters() {
    userName = Get.parameters["userName"];
    userAvatar = Get.parameters["userAvatar"];
    friendName = Get.parameters["friendName"];
    friendAvatar = Get.parameters["friendAvatar"];
    relationship = Get.parameters["relationship"];
  }

  @override
  void onReady() {
    super.onReady();
    if (isSave == true) {
      getAnalysis(id: id ?? "");
    } else {
      loadAnalysis(
        firstId: firstId ?? 0,
        secondId: secondId ?? 0,
        relationship: relationship ?? "",
      );
    }
  }

  ///处理json
  void _processRelationshipData() {
    if (relationship != null) {
      Map<String, dynamic> jsonValue = json[relationship!.toLowerCase()];
      title1 = jsonValue["key1"];
      value1 = jsonValue["value1"];
      title2 = jsonValue["key2"];
      value2 = jsonValue["value2"];
      title3 = jsonValue["key3"];
      value3 = jsonValue["value3"];
    }
  }

  ///获取合盘分析
  Future<void> loadAnalysis({
    required num firstId,
    required num secondId,
    required String relationship,
  }) async {
    //AppLoading.show();
    final (
      bool issuccessfuul,
      AnalysisIdentityEntity? value,
    ) = await SynastryAPI.loopAndReturnAnalysis(
      userId: firstId,
      otherId: secondId,
      relationship: relationship,
      cancelToken: analysisCancelToken,
    );

    /*final (bool issuccessfuul,AnalysisIdentityEntity? value) = await SynastryAPI.updateAnalysis(
      userId: firstId,
      otherId: secondId,
      relationship: relationship,
    );*/
    if (value != null) {
      if (value.synastryId != null) {
        id = value.synastryId.toString();
        article = await SynastryAPI.getAnalysis(
          id: id ?? "",
          cancelToken: analysisCancelToken,
        );
        _processRelationshipData();
        viewState = article != null ? Status.data.index : Status.empty.index;
        update();
      } else {
        viewState = article != null ? Status.data.index : Status.empty.index;
        update();
      }
    } else {
      viewState = article != null ? Status.data.index : Status.empty.index;
      update();
    }
  }

  ///获取合盘分析内容
  Future<void> getAnalysis({required String id}) async {
    //AppLoading.show();
    article =
        await SynastryAPI.getAnalysis(
          id: id,
          cancelToken: analysisCancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    _processRelationshipData();
    viewState = article != null ? Status.data.index : Status.empty.index;
    update();
  }

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
        onLeftButtonCall: () {
          Get.back(closeOverlays: true);
        },
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
    bool isSuccessful =
        await SynastryAPI.postCollection(
          id: id,
          cancelToken: cancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    if (isSuccessful) {
      isSave = true;
    }
    update();
    onSuccess?.call();
  }

  ///取消收藏
  Future<void> deleteCollection({required String id}) async {
    AppLoading.show();
    bool isSuccessful =
        await SynastryAPI.deleteCollection(
          id: id,
          cancelToken: cancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    if (isSuccessful) {
      AppEventBus.eventBus.fire(RefreshLogEvent());
      isSave = false;
    }
    update();
  }
}
