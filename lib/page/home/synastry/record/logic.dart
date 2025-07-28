part of 'index.dart';

class FileManagementLogic extends GetxController {
  List<FriendEntity> list = [];

  late StreamSubscription<RefreshFriendsEvent> refreshEvent;

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
      update();
      onFinish.call();
    }
  }

  void toAddFile() {
    if (list.length < 11) {
      PageTools.toAddFile(
        onRefresh: () {
          // loadData();
        },
      );
    } else {
      AppLoading.toast("add friend more 10");
    }
  }
}
