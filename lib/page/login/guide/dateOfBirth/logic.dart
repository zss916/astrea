part of 'index.dart';

class DateOfBirthLogic extends GetxController {
  String birthday =
      "${DateTime.now().year - 25}-${(DateTime.now().month).formatted}-15";

  void toNext() {
    AccountService.to.updateUserBirth(CalculateTools.formattedDate(birthday));
    PageTools.toTimeOfBirth();
  }
}
