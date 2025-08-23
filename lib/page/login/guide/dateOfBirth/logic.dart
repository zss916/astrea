part of 'index.dart';

class DateOfBirthLogic extends GetxController {
  String? birthday;

  int loginType = LoginType.loginAndRegister.index;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is int) {
      loginType = Get.arguments as int;
    }
  }

  void toNext() {
    if ((birthday ?? "").isEmpty) {
      final (int year, int month, int day) = AccountService.to.getUserBirth();
      AccountService.to.updateUserBirth(
        CalculateTools.formattedDate(
          "$year-${month.formatted}-${day.formatted}",
        ),
      );
    } else {
      AccountService.to.updateUserBirth(
        CalculateTools.formattedDate(birthday ?? ""),
      );
    }
    PageTools.toTimeOfBirth(loginType: loginType);
  }
}
