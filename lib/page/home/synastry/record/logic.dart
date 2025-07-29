part of 'index.dart';

class FileManagementLogic extends GetxController {
  List<FriendEntity> list = [];

  late StreamSubscription<RefreshFriendsEvent> refreshEvent;

  bool isClick = false;

  @override
  void onInit() {
    super.onInit();
    initLocalData();
    refreshEvent = AppEventBus.eventBus.on<RefreshFriendsEvent>().listen((
      event,
    ) {
      loadData();
    });
  }

  void initLocalData() {
    list.clear();
    List<FriendEntity> value = AccountService.to.getFriendList();
    list.addAll(value);
    update();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
    refreshEvent.cancel();
  }

  ///加载朋友列表
  Future<void> loadData() async {
    AppLoading.show();
    List<FriendEntity> value = await FriendAPI.getFriends().whenComplete(() {
      AppLoading.dismiss();
    });
    list.clear();
    list.addAll(value);
    AccountService.to.updateFriendList(list);
    update();
  }

  ///删除朋友
  Future<void> removeFriend({
    required String id,
    required int index,
    required Function onFinish,
  }) async {
    AppLoading.show();
    bool value = await FriendAPI.deleteFriend(id: id).whenComplete(() {
      AppLoading.dismiss();
    });
    if (value) {
      list.removeAt(index);
      AccountService.to.updateFriendList(list);
      update();
      onFinish.call();
    }
  }

  void toAddFile() {
    if (list.length < 11) {
      PageTools.toAddFile();
    } else {
      AppLoading.toast("add friend more 10");
    }
  }

  ///删除
  void showDeleteDialog(int index) {
    showCommonDialog(
      content: LanKey.deletePeopleTip.tr,
      leftButtonText: LanKey.ok.tr,
      rightButtonText: LanKey.cancel.tr,
      onLeftButtonCall: () {
        String uid = list[index].id.toString();
        removeFriend(id: uid, index: index, onFinish: () => Get.back());
      },
      onRightButtonCall: () => Get.back(),
      routeName: APages.deletePeopleFileDialog,
    );
  }

  /// 点击
  void tapItem(int index) {
    for (int i = 0; i < list.length; i++) {
      if (!(list[i].isMe)) {
        list[i].isSelected = i == index;
      }
    }
    List<FriendEntity> matchList = list
        .where((e) => (e.isSelected == true))
        .toList();

    bool isMatch = (matchList.length == 2) && (matchList.any((e) => e.isMe));
    isClick = isMatch;
    update();
  }

  ///获取分析报告
  void toDetermine() {
    showRelationshipSheet((value) {
      //debugPrint("showRelationshipSheet $value");
      FriendEntity first = list
          .where((e) => e.isMe && e.isSelected == true)
          .first;
      FriendEntity second = list
          .where((e) => e.isSelected == true && !(e.isMe))
          .first;
      if (first.id != null && second.id != null && value.isNotEmpty) {
        PageTools.toStarReport(
          firstId: first.id ?? 0,
          secondId: second.id ?? 0,
          relationship: value,
          userName: first.nickName ?? "",
          userAvatar: first.headImg ?? "",
          friendName: second.nickName ?? "",
          friendAvatar: second.headImg ?? "",
        );
      }
    });
  }
}
