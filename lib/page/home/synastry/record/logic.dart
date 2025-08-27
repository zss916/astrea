part of 'index.dart';

class FileManagementLogic extends GetxController {
  List<FriendEntity> list = [];

  final collection = FixedSizeCollection<FriendEntity>();

  late StreamSubscription<RefreshFriendsEvent> refreshEvent;

  bool isClick = false;

  CancelToken cancelToken = CancelToken();

  int viewState = Status.init.index;

  @override
  void onInit() {
    super.onInit();
    initLocalData();
    refreshEvent = AppEventBus.eventBus.on<RefreshFriendsEvent>().listen((
      event,
    ) {
      refreshData(cancelToken: cancelToken);
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
    loadData(cancelToken: cancelToken);
  }

  @override
  void onClose() {
    super.onClose();
    refreshEvent.cancel();
    cancelToken.cancel();
    AppLoading.dismiss();
  }

  ///加载朋友列表
  Future<void> loadData({CancelToken? cancelToken}) async {
    viewState = Status.init.index;
    update();
    // AppLoading.show();
    (bool, List<FriendEntity>) value =
        await FriendAPI.getFriends(cancelToken: cancelToken).whenComplete(() {
          AppLoading.dismiss();
        });
    if (value.$1) {
      list.clear();
      List<FriendEntity> data = value.$2
          .map((e) => e.isMe ? (e..isSelected = true) : e)
          .toList();
      list.addAll(data);
      AccountService.to.updateFriendList(list);
      checkMatch();
      viewState = Status.data.index;
      update();
      // AppLoading.toast("Successful");
    } else {
      viewState = Status.data.index;
      AppLoading.dismiss();
      AppLoading.toast("Failed");
    }
  }

  ///刷新数据
  Future<void> refreshData({CancelToken? cancelToken}) async {
    // AppLoading.show();
    viewState = Status.init.index;
    update();
    List<int?> ids = list
        .where((e) => e.isSelected == true)
        .map((e) => e.id)
        .toList();
    (bool, List<FriendEntity>) value =
        await FriendAPI.getFriends(cancelToken: cancelToken).whenComplete(() {
          AppLoading.dismiss();
        });
    if (value.$1) {
      List<FriendEntity> data = value.$2
          .map((e) => ids.contains(e.id) ? (e..isSelected = true) : e)
          .toList();
      list.clear();
      list.addAll(data);
      AccountService.to.updateFriendList(list);
      checkMatch();
      viewState = Status.data.index;
      update();
      // AppLoading.toast("Successful");
    } else {
      viewState = Status.data.index;
      AppLoading.dismiss();
      AppLoading.toast("Failed");
    }
  }

  ///删除朋友
  Future<void> removeFriend({
    required String id,
    required int index,
    required Function onFinish,
  }) async {
    AppLoading.show();
    bool value = await FriendAPI.deleteFriend(id: id, cancelToken: cancelToken)
        .whenComplete(() {
          AppLoading.dismiss();
        });
    if (value) {
      AppEventBus.eventBus.fire(DeleteFriendsEvent(id: int.parse(id)));
      list.removeAt(index);
      checkMatch();
      AccountService.to.updateFriendList(list);
      update();
      onFinish.call();
    } else {
      AppLoading.toast("Failed");
    }
  }

  void toAddFile() {
    if (list.length < 11) {
      PageTools.toAddFile();
    } else {
      AppLoading.toast(LanKey.moreFriends.tr);
    }
  }

  ///删除
  void showDeleteDialog(int index) {
    showCommonDialog(
      content: LanKey.deletePeopleTip.tr,
      leftButtonText: LanKey.delete.tr,
      rightButtonText: LanKey.cancel.tr,
      onLeftButtonCall: () {
        String uid = list[index].id.toString();
        removeFriend(id: uid, index: index, onFinish: () => Get.back());
      },
      onRightButtonCall: () => Get.back(),
      routeName: APages.deletePeopleFileDialog,
    );
  }

  void tapItem(int index) {
    if (list[index].isSelected == true) {
      collection.add(list[index]);
    }

    List<FriendEntity> matchList = list
        .where((e) => (e.isSelected == true))
        .toList();

    if (matchList.length > 2) {
      List<int?> ids = collection.items.map((e) => e.id).toList();
      List<FriendEntity> data = list
          .map((e) => (e..isSelected = ids.contains(e.id)))
          .toList();
      list.clear();
      list.addAll(data);
    }

    /*List<FriendEntity> matchSelect = list
        .where((e) => (e.isSelected == true))
        .toList();

    bool isMatch = matchSelect.length == 2;
    isClick = isMatch;*/
    checkMatch();
    update();
  }

  void checkMatch() {
    List<FriendEntity> matchSelect = list
        .where((e) => (e.isSelected == true))
        .toList();

    bool isMatch = matchSelect.length == 2;
    isClick = isMatch;
  }

  /// 点击
  /*  void tapItem2(int index) {
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
  }*/

  ///获取分析报告
  void toDetermine() {
    checkMatch();
    if (isClick) {
      showRelationshipSheet((value) {
        //debugPrint("showRelationshipSheet $value");
        FriendEntity first = list
            .where((e) => e.isSelected == true)
            .toList()[0];
        FriendEntity second = list
            .where((e) => e.isSelected == true)
            .toList()[1];
        /*FriendEntity second = list
            .where((e) => e.isSelected == true && !(e.isMe))
            .first;*/
        // List<FriendEntity> data = collection.items;
        //FriendEntity first = data.first;
        //FriendEntity second = data.last;

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
    } else {
      AppLoading.toast("Please select at least two friends");
    }
  }
}
