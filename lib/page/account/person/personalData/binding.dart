part of 'index.dart';

class PersonalDataBinding implements Bindings {
  @override
  void dependencies() => Get.put<PersonalDataLogic>(PersonalDataLogic());
}
