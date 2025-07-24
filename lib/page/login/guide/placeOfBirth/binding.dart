part of 'index.dart';

class PlaceOfBirthBinding implements Bindings {
  @override
  void dependencies() => Get.put<PlaceOfBirthLogic>(PlaceOfBirthLogic());
}
