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
    loadAccount();
  }

  void initLocalData() {
    if (Get.arguments != null && Get.arguments is AccountEntity) {
      account = Get.arguments as AccountEntity;
    } else {
      account = AccountService.to.getAccount();
    }
    update();
  }

  Future<void> loadAccount() async {
    if (account != null) {
      account = await AccountAPI.getAccount();
      update();
    }
  }

  Future<void> saveData({String? nickName}) async {
    await AccountAPI.updateAccount(nickName: nickName);
    if (nickName != null) {
      //AccountService.to.updateUserNickName(nickName);
    }
  }
}
