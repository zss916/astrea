part of 'index.dart';

class AccountInfoLogic extends GetxController {
  AccountEntity? account;

  String email = AccountService.to.loginEmail ?? "-";
  String get loginChannel =>
      LoginChannel.getSymbol((account?.loginChannel ?? 0));
  String get userID => account?.userId ?? "-";

  @override
  void onInit() {
    super.onInit();
    initLocalData();
  }

  void initLocalData() {
    if (Get.arguments != null && Get.arguments is AccountEntity) {
      account = Get.arguments as AccountEntity;
    } else {
      account = AccountService.to.getAccount();
    }
    update();
  }

  @override
  void onReady() {
    super.onReady();
    loadAccount();
  }

  ///获取账号信息
  Future<void> loadAccount() async {
    account = await AccountAPI.getAccount();
    update();
  }

  ///删除账号
  Future<void> deleteAccount() async {
    AppLoading.show();
    bool isSuccessful = await AccountAPI.deleteAccount().whenComplete(() {
      AppLoading.dismiss();
    });
    if (isSuccessful) {
      AccountService.to.deleteAccount();
    } else {
      AppLoading.toast("delete account");
    }
  }

  ///登出
  Future<void> toLogOut() async {
    AppLoading.show();
    bool isSuccessful = await AuthAPI.logOut().whenComplete(() {
      AppLoading.dismiss();
    });
    if (isSuccessful) {
      AccountService.to.logout();
    }
  }
}
