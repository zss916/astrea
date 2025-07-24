part of 'index.dart';

class TimeOfBirthLogic extends GetxController {
  int birthHour = DateTime.now().hour;
  int birthMinute = DateTime.now().minute;

  void toNext() {
    AccountService.to.updateUserBirthHAndM(birthHour, birthMinute);
    PageTools.toPlaceOfBirth();
  }
}
