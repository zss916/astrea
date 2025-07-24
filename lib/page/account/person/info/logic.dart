part of 'index.dart';

class AccountInfoLogic extends GetxController {
  String email = "-";
  String loginChannel = "-";
  String userID = "-";

  @override
  void onInit() {
    super.onInit();
    email = AccountService.to.loginEmail;
    loginChannel = LoginChannel.getSymbol(AccountService.to.loginChannelIndex);
    userID = AccountService.to.userID;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    loadAccount();
  }

  ///获取账号信息
  Future<void> loadAccount() async {
    AccountEntity data = await AccountAPI.getAccount();
    userID = data.userIdStr;
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
