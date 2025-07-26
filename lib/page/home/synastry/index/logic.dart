import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/net/api/account.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:get/get.dart';

class SynastryLogic extends GetxController {
  AccountEntity? account;
  String get avatar => account?.headimg ?? "";
  String get nickName => account?.nickName ?? "--";

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
    account = AccountService.to.data;
    update();
  }

  Future<void> loadData() async {
    if (account == null) {
      account = await AccountAPI.getAccount();
      update();
    }
  }
}
