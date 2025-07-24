part of 'index.dart';

class PersonalDataLogic extends GetxController {
  AccountEntity? account;

  String get avatar => account?.headimg ?? "";
  String get nickName => account?.nickName ?? "";
  String get dateBirth => account?.birthday ?? "";
  String? get placeBirth => account?.locality;
  int get sex => account?.sex ?? 0;

  @override
  void onInit() {
    super.onInit();
    initLocalData();
  }

  @override
  void onReady() {
    super.onReady();
    //loadData();
  }

  void initLocalData() {
    AccountEntity data = Get.arguments ?? AccountEntity();
    if (data.userId != null) {
      account = data;
    } else {
      account = AccountService.to.data ?? AccountEntity();
    }
    update();
  }

  Future<void> loadData() async {
    account = AccountService.to.data ?? AccountEntity();
    update();
  }

  Future<void> saveData({String? nickName}) async {
    await AccountAPI.updateAccount(nickName: nickName);
    if (nickName != null) {
      //AccountService.to.updateUserNickName(nickName);
    }
  }
}
