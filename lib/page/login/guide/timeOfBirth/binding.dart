part of 'index.dart';

class TimeOfBirthBinding implements Bindings {
  @override
  void dependencies() => Get.put<TimeOfBirthLogic>(TimeOfBirthLogic());
}
