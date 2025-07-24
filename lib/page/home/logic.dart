part of 'index.dart';

class HomeLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  void loadData() async {
    //AccountEntity account = await AccountAPI.getAccount();
    /*AccountService.to.updateLocalUserInfo(
        uid: account.userId,
        loginEmail: account.email,
        loginChannel: account.loginChannel,
        authToken: account.authToken,
        isNewUser: account.isNewUser);*/
  }
}
