part of 'index.dart';

class AddFileLogic extends GetxController with AppValidatorMixin {
  bool isSave = false;
  bool isUser = false;
  int? id;
  bool homeToAdd = false;
  bool isEditFile = false;

  CancelToken cancelToken = CancelToken();

  AwesomeDateTime? initDateTime;

  FriendEntity data = FriendEntity();

  FriendEntity originalData = FriendEntity();

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() {
    if (Get.arguments != null && Get.arguments["isEditFile"] is bool) {
      isEditFile = Get.arguments["isEditFile"] as bool;
      // debugPrint("===>> $isEditFile");
    }
    if (Get.arguments != null && Get.arguments["homeToAdd"] is bool) {
      homeToAdd = Get.arguments["homeToAdd"] as bool;
    }
    if (Get.arguments != null && Get.arguments["data"] is FriendEntity) {
      data = Get.arguments["data"] as FriendEntity;
      originalData = data;
      isUser = data.isMe ?? false;
      id = data.id;
      //isSave = true;
      initDateTime = data.getAwesomeDateTime(
        data.birthday ?? "",
        data.birthHour ?? 0,
        data.birthMinute ?? 0,
      );
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    AppLoading.dismiss();
    cancelToken.cancel();
    super.onClose();
  }

  void updateButtonState() {
    isSave =
        ((data.nickName ?? "").isNotEmpty) &&
        // ((avatar ?? "").isNotEmpty) &&
        ((data.sex ?? 2) != 0) &&
        ((data.birthday ?? "").isNotEmpty) &&
        ((data.birthHour) != null) &&
        ((data.birthMinute) != null) &&
        ((data.lon) != null) &&
        ((data.lat) != null) &&
        ((data.interests) != null) &&
        ((data.locality) != null);
    update();
  }

  ///添加朋友（最多10个）
  Future<void> addFriend() async {
    if (!isMatchName(data.nickName ?? "")) {
      AppLoading.toast(LanKey.nameMatchHint.tr);
      return;
    }
    AppLoading.show();
    int? id =
        await FriendAPI.addFriend(
          nickName: data.nickName,
          avatar: data.headImg ?? "",
          birthday: data.birthday,
          birthHour: data.birthHour,
          birthMinute: data.birthMinute,
          sex: data.sex ?? 2,
          lon: data.showLon,
          lat: data.showLat,
          locality: data.locality,
          interests: data.interests,
          cancelToken: cancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    if (id != null) {
      AppLoading.toast("Successful").whenComplete(() {
        if (homeToAdd) {
          FriendEntity value = data
            ..isChecked = true
            ..id = id;
          Get.back<FriendEntity>(result: value);
        } else {
          FriendEntity value = data
            ..isSelected = false
            ..id = id;
          AppEventBus.eventBus.fire(RefreshFriendsEvent(item: value));
          Get.back();
        }
      });
    } else {
      AppLoading.toast("Failed");
    }
  }

  void showSheet() {
    showCameraAndGallerySheet(
      onFinish: (url) {
        data.headImg = url;
        updateButtonState();
        if (isEditFile) {
          updateFriendAvatar(url: url);
        } else {
          AppLoading.dismiss();
        }
      },
    );
  }

  ///修改朋友
  Future<void> updateFriend() async {
    if (id == null) {
      AppLoading.dismiss();
      return;
    }
    if (!isMatchName(data.nickName ?? "")) {
      AppLoading.toast(LanKey.nameMatchHint.tr);
      return;
    }
    AppLoading.show();
    bool isSuccessful =
        await FriendAPI.updateFriend(
          id: id.toString(),
          nickName: data.nickName,
          avatar: data.headImg ?? "",
          birthday: data.birthday,
          birthHour: data.birthHour,
          birthMinute: data.birthMinute,
          sex: data.sex ?? 2,
          lon: data.showLon,
          lat: data.showLat,
          locality: data.locality,
          interests: data.interests,
          cancelToken: cancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    if (isSuccessful) {
      AppLoading.toast("Successful").whenComplete(() {
        //  AccountService.to.updateFriend(data);
        AppEventBus.eventBus.fire(RefreshFriendsEvent(item: data));
        Get.back();
      });
    } else {
      AppLoading.toast("Failed");
    }
  }

  updateFriendAvatar({required String url}) async {
    if (id == null) {
      AppLoading.dismiss();
      return;
    }
    bool isSuccessful =
        await FriendAPI.updateFriend(
          id: id.toString(),
          avatar: url,
          nickName: originalData.nickName,
          birthday: originalData.birthday,
          birthHour: originalData.birthHour,
          birthMinute: originalData.birthMinute,
          sex: originalData.sex ?? 2,
          lon: originalData.showLon,
          lat: originalData.showLat,
          locality: originalData.locality,
          interests: originalData.interests,
          cancelToken: cancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    if (isSuccessful) {
      AppLoading.toast("Successful").whenComplete(() {
        AppEventBus.eventBus.fire(RefreshFriendsEvent(item: data));
      });
    }
  }
}
