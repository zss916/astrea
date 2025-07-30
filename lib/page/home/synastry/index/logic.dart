import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/net/api/account.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:get/get.dart';

class SynastryLogic extends GetxController {
  AccountEntity? account;
  String get avatar => account?.headimg ?? "";
  String get nickName => account?.nickName ?? LanKey.oneself.tr;

  //https://pic.rmb.bdstatic.com/bjh/news/1c9d537b9264cf94fbbded4c0a46f646.png

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
