import 'package:get/get.dart';
import 'package:astrea/page/home/account/index/logic.dart';

class AccountBinding implements Bindings {
  @override
  void dependencies() => Get.put<AccountLogic>(AccountLogic());
}
