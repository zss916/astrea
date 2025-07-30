part of 'index.dart';

class EmailLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    //AccountAPI.getAccount();
  }

  /// 邮箱登录
  Future<void> toAuthEmail({required String email, required String pwd}) async {
    AppLoading.show();
    (bool isSuccess, AuthEntity auth) data =
        await AuthAPI.emailLogin(email: email, pwd: pwd).whenComplete(() {
          AppLoading.dismiss();
        });

    if (data.$1) {
      /// 更新本地用户信息
      AccountService.to.updateLocalUserInfo(
        uid: data.$2.userId,
        // friendId: data.$2.friendId,
        loginEmail: email,
        loginChannel: LoginChannel.email.value,
        authToken: data.$2.authToken ?? "",
        isNewUser: data.$2.isNewUser,
      );

      PageTools.loginToNext();
    }
  }
}
