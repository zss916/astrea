part of 'index.dart';

class DateOfBirthBinding implements Bindings {
  @override
  void dependencies() => Get.put<DateOfBirthLogic>(DateOfBirthLogic());
}
