part of 'index.dart';

class AddFileLogic extends GetxController {
  String nickName = "";
  int sex = 0;
  String birthday = "";
  int? hourBirth;
  int? minuteBirth;
  num? lon;
  num? lat;
  String? locality;
  String? avatar;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void log() {
    debugPrint("nickName =$nickName, "
        "avatar = $avatar, "
        "birthday = $birthday, "
        "birthHour = $hourBirth,"
        " birthMinute = $minuteBirth,"
        " sex = $sex, "
        "lon = $lon, "
        "lat = $lat, "
        "locality = $locality");
  }

  ///添加朋友（最多10个）
  Future<void> addFriend({
    String? nickName,
    String? avatar,
    String? birthday,
    String? birthHour,
    String? birthMinute,
    int? sex,
    int? lon,
    int? lat,
    String? locality,
  }) async {
    int? id = await FriendAPI.addFriend(
        nickName: nickName,
        avatar: avatar,
        birthday: birthday,
        birthHour: birthHour,
        birthMinute: birthMinute,
        sex: sex,
        lon: lon,
        lat: lat,
        locality: locality);
    if (id != null) {
      Get.back();
    }
  }
}
