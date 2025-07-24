part of 'index.dart';

class AccountInfoBinding implements Bindings {
  @override
  void dependencies() => Get.put<AccountInfoLogic>(AccountInfoLogic());
}
