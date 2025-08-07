part of 'index.dart';

class AddFileLogic extends GetxController {
  String nickName = "";
  int sex = 0;
  String birthday = "";
  int? hourBirth;
  int? minuteBirth;
  String? lon;
  String? lat;
  String? locality;
  String? avatar;
  String? interests;
  String showInterests() {
    List<String> parts = (interests ?? "").split(",");
    return parts.length >= 3
        ? '${parts.sublist(0, 3).join(',')}\n${parts.sublist(3).join(',')}'
        : (interests ?? "");
  }

  String get showBirthDay {
    if ((birthday ?? "").isNotEmpty) {
      return "${CalculateTools.formattedTime2(birthday)}\n${(hourBirth ?? 0).formatted}:${(minuteBirth ?? 0).formatted} ${CalculateTools.formattedAmOrPm(hourBirth ?? 0)}";
    } else {
      return "";
    }
  }

  bool isSave = false;
  bool isUser = false;
  int? id;

  CancelToken cancelToken = CancelToken();

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() {
    if (Get.arguments != null && Get.arguments["data"] is FriendEntity) {
      FriendEntity data = Get.arguments["data"] as FriendEntity;
      nickName = data.nickName ?? "";
      sex = data.sex ?? 0;
      birthday = data.birthday ?? "";
      hourBirth = data.birthHour;
      minuteBirth = data.birthMinute;
      lon = (data.lon ?? 0).toString();
      lat = (data.lat ?? 0).toString();
      locality = data.locality ?? "";
      avatar = data.headImg ?? "";
      interests = data.interests ?? "";
      isUser = data.isMe;
      id = data.id;
      //isSave = true;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cancelToken.cancel();
    super.onClose();
    AppLoading.dismiss();
  }

  void log() {
    debugPrint(
      "id = $id, "
      "nickName =$nickName, "
      "avatar = $avatar, "
      "birthday = $birthday, "
      "birthHour = $hourBirth,"
      " birthMinute = $minuteBirth,"
      " sex = $sex, "
      "lon = $lon, "
      "lat = $lat, "
      "locality = $locality, "
      "interests = $interests",
    );
  }

  void updateButtonState() {
    isSave =
        (nickName.isNotEmpty) &&
        // ((avatar ?? "").isNotEmpty) &&
        (sex != 0) &&
        (birthday.isNotEmpty) &&
        (hourBirth != null) &&
        (minuteBirth != null) &&
        (lon != null) &&
        (lat != null) &&
        (interests != null) &&
        (locality != null);
    update();
  }

  ///添加朋友（最多10个）
  Future<void> addFriend() async {
    log();
    AppLoading.show();
    int? id =
        await FriendAPI.addFriend(
          nickName: nickName,
          avatar: avatar ?? "",
          birthday: birthday,
          birthHour: hourBirth,
          birthMinute: minuteBirth,
          sex: sex,
          lon: lon,
          lat: lat,
          locality: locality,
          interests: interests,
          cancelToken: cancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    if (id != null) {
      AppLoading.toast("Successful");
      AppEventBus.eventBus.fire(RefreshFriendsEvent());
      Get.back();
    }
  }

  void showSheet() {
    showCameraAndGallerySheet(
      onFinish: (url) {
        avatar = url;
        updateButtonState();
      },
    );
  }

  ///修改朋友
  Future<void> updateFriend() async {
    log();
    if (id == null) {
      return;
    }
    AppLoading.show();
    bool isSuccessful =
        await FriendAPI.updateFriend(
          id: id.toString(),
          nickName: nickName,
          avatar: avatar ?? "",
          birthday: birthday,
          birthHour: hourBirth,
          birthMinute: minuteBirth,
          sex: sex,
          lon: lon,
          lat: lat,
          locality: locality,
          interests: interests,
          cancelToken: cancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    if (isSuccessful) {
      AppLoading.toast("Successful");
      AppEventBus.eventBus.fire(RefreshFriendsEvent());
      Get.back();
    }
  }
}
