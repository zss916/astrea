part of 'index.dart';

class DateOfBirthLogic extends GetxController {
  String birthday =
      "${DateTime.now().year - 25}-${(DateTime.now().month).formatted}-15";

  int loginType = LoginType.loginAndRegister.index;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is int) {
      loginType = Get.arguments as int;
    }
  }

  void toNext() {
    AccountService.to.updateUserBirth(CalculateTools.formattedDate(birthday));
    // debugPrint("getbirthday => ${AccountService.to.getAccount()?.birthday}");
    PageTools.toTimeOfBirth(loginType: loginType);
  }
}
