part of 'index.dart';

class WelcomeLogic extends GetxController with LoginChannelMixin {
  CancelToken cancelToken = CancelToken();

  @override
  void onClose() {
    cancelToken.cancel();
    super.onClose();
  }

  ///google 登录
  void toGoogleAuth() async {
    googleSignIn(({
      required bool success,
      String? idToken,
      String? token,
      String? id,
      String? nickname,
      String? cover,
    }) async {
      AppLoading.show();
      AuthEntity? data =
          await AuthAPI.googleLogin(
            token: idToken ?? "",
            cancelToken: cancelToken,
          ).whenComplete(() {
            AppLoading.dismiss();
          });
      //debugPrint("data===> ${data.toJson()}");
      if (data != null) {
        AccountService.to.updateLocalUserInfo(
          uid: data.userId,
          loginEmail: "-",
          loginChannel: LoginChannel.google.value,
          nickName: nickname,
          authToken: data.authToken ?? "",
        );
        PageTools.loginToNext();
      } else {
        AppLoading.toast("login failed");
      }
    });
  }

  ///apple 登录
  void toAppleAuth() async {
    appleLogin(({
      required bool success,
      String? token,
      String? nickname,
    }) async {
      AuthEntity? data = await AuthAPI.appleLogin(
        code: token ?? "",
        cancelToken: cancelToken,
      );
      // debugPrint("data===> ${data.toJson()}");
      if (data != null) {
        AccountService.to.updateLocalUserInfo(
          uid: data.userId,
          loginEmail: "-",
          loginChannel: LoginChannel.apple.value,
          nickName: nickname,
          authToken: data.authToken ?? "",
        );
        PageTools.loginToNext();
      } else {
        AppLoading.toast("login failed");
      }
    });
  }

  ///邮箱登录
  void toEmailAuth() => PageTools.toEmail();

  ///隐私
  void toPrivacy() {
    ///
  }

  ///服务
  void toService() {
    ///
  }
}
