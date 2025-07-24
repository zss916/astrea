import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/net/api/account.dart';
import 'package:astrea/net/bean/account_entity.dart';

class AccountLogic extends GetxController {
  AccountEntity? account;

  String get avatar => account?.headimg ?? "";
  String get nickName => account?.nickName ?? "--";
  AccountEntity get data => account ?? AccountEntity();

  @override
  void onInit() {
    super.onInit();
    initLocalData();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  void initLocalData() {
    account = AccountService.to.data ?? AccountEntity();
    update();
  }

  Future<void> loadData() async {
    account = await AccountAPI.getAccount();
    update();
  }
}
