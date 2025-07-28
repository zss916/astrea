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
  String get showBirthDay {
    if ((birthday ?? "").isNotEmpty) {
      return "${CalculateTools.formattedTime2(birthday)}\n${(hourBirth ?? 0).formatted}:${(minuteBirth ?? 0).formatted} ${CalculateTools.formattedAmOrPm(hourBirth ?? 0)}";
    } else {
      return "";
    }
  }

  bool isSave = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    EventBus;
  }

  void log() {
    debugPrint(
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
        //  ((avatar ?? "").isNotEmpty) &&
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
          avatar: avatar ?? "xxxxxx",
          birthday: birthday,
          birthHour: hourBirth,
          birthMinute: minuteBirth,
          sex: sex,
          lon: lon,
          lat: lat,
          locality: locality,
          interests: interests,
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    if (id != null) {
      AppLoading.toast("Successful");
      AppEventBus.eventBus.fire(RefreshFriendsEvent());
      Get.back();
    }
  }
}
