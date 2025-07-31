part of 'index.dart';

class EmailLogic extends GetxController {
  CancelToken cancelToken = CancelToken();

  @override
  void onReady() {
    super.onReady();

    ///
  }

  @override
  void onClose() {
    cancelToken.cancel();
    super.onClose();
  }

  /// 邮箱登录
  Future<void> toAuthEmail({required String email, required String pwd}) async {
    AppLoading.show();
    (bool isSuccess, AuthEntity? auth) data =
        await AuthAPI.emailLogin(
          email: email,
          pwd: pwd,
          cancelToken: cancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });

    if (data.$1) {
      AccountService.to.updateLocalUserInfo(
        uid: data.$2?.userId,
        loginEmail: email,
        loginChannel: LoginChannel.email.value,
        authToken: data.$2?.authToken ?? "",
        isNewUser: data.$2?.isNewUser,
      );
      PageTools.loginToNext();
    } else {
      AppLoading.toast("login failed");
    }
  }
}
