part of 'index.dart';

class TimeOfBirthLogic extends GetxController {
  int birthHour = DateTime.now().hour;
  int birthMinute = DateTime.now().minute;

  int loginType = LoginType.loginAndRegister.index;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is int) {
      loginType = Get.arguments as int;
    }
  }

  void toNext() {
    AccountService.to.updateUserBirthHAndM(birthHour, birthMinute);
    // initValue = AccountService.to.getUserBirthHAndM();
    PageTools.toPlaceOfBirth(loginType: loginType);
  }
}
