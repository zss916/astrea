part of 'index.dart';

class FileManagementLogic extends GetxController {
  List<FriendEntity> list = [];

  @override
  void onInit() {
    super.onInit();
    initLocalData();
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
  void removeFriend(int index) {
    list.removeAt(index);
    update();
  }
}
