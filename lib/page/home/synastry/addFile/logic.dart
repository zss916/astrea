part of 'index.dart';

class AddFileLogic extends GetxController with AppValidatorMixin {
  String nickName = "";
  int sex = 2;
  String birthday = "";
  int? hourBirth;
  int? minuteBirth;
  String? lon;
  String? lat;
  String? locality;
  String? avatar;
  String? interests;

  String get showBirthDay {
    if ((birthday ?? "").isNotEmpty) {
      return "${CalculateTools.formattedTime2(birthday)} ${(hourBirth ?? 0).formatted}:${(minuteBirth ?? 0).formatted} ${CalculateTools.formattedAmOrPm(hourBirth ?? 0)}";
    } else {
      return "";
    }
  }

  bool isSave = false;
  bool isUser = false;
  int? id;

  CancelToken cancelToken = CancelToken();

  AwesomeDateTime? initDateTime;

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
      initDateTime = getAwesomeDateTime(
        birthday,
        hourBirth ?? 0,
        minuteBirth ?? 0,
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
    // AppLoading.dismiss();
    cancelToken.cancel();
    super.onClose();
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
    if (!isMatchName(nickName)) {
      AppLoading.toast(LanKey.nameMatchHint.tr);
      return;
    }
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
      AppLoading.toast("Successful").whenComplete(() {
        AppEventBus.eventBus.fire(RefreshFriendsEvent());
        Get.back();
      });
    } else {
      AppLoading.toast("Failed");
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
    if (!isMatchName(nickName)) {
      AppLoading.toast(LanKey.nameMatchHint.tr);
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
      AppLoading.toast("Successful").whenComplete(() {
        AppEventBus.eventBus.fire(RefreshFriendsEvent());
        Get.back();
      });
    } else {
      AppLoading.toast("Failed");
    }
  }

  AwesomeDateTime? getAwesomeDateTime(String? birthday, int hour, int minute) {
    if (birthday != null && birthday.contains("-")) {
      List<String> value = (birthday ?? "").split("-");
      if (value.isNotEmpty) {
        return AwesomeDateTime(
          date: AwesomeDate(
            year: int.parse(value[0]),
            month: int.parse(value[1]),
            day: int.parse(value[2]),
          ),
          time: AwesomeTime(hour: hour, minute: minute),
        );
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
