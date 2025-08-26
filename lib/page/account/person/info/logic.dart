part of 'index.dart';

class AccountInfoLogic extends GetxController {
  AccountEntity? account;

  String email = AccountService.to.loginEmail ?? "-";
  String get loginChannel =>
      LoginChannel.getSymbol((account?.loginChannel ?? 0));
  String get userID =>
      (account?.userId == null) ? "-" : (account?.showID).toString();

  CancelToken cancelToken = CancelToken();

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

  @override
  void onClose() {
    cancelToken.cancel();
    super.onClose();
    AppLoading.dismiss();
  }

  ///获取账号信息
  Future<void> loadAccount() async {
    account = await AccountAPI.getAccount(cancelToken: cancelToken);
    update();
  }

  ///删除账号
  Future<void> deleteAccount() async {
    AppLoading.show();
    bool isSuccessful = await AccountAPI.deleteAccount(cancelToken: cancelToken)
        .whenComplete(() {
          AppLoading.dismiss();
        });
    if (isSuccessful) {
      AccountService.to.deleteAccount();
    } else {
      AppLoading.toast("Failed");
    }
  }

  ///登出
  Future<void> toLogOut() async {
    AppLoading.show();
    bool isSuccessful = await AuthAPI.logOut(cancelToken: cancelToken)
        .whenComplete(() {
          AppLoading.dismiss();
        });
    if (isSuccessful) {
      AccountService.to.logout();
    } else {
      AppLoading.toast("Failed");
    }
  }
}
