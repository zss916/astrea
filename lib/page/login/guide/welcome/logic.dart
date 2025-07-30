part of 'index.dart';

class WelcomeLogic extends GetxController with LoginChannelMixin {
  ///google 登录
  void toGoogleAuth() async {
    // PageTools.toHome();
    googleSignIn(({
      required bool success,
      String? idToken,
      String? token,
      String? id,
      String? nickname,
      String? cover,
    }) async {
      AuthEntity? data = await AuthAPI.googleLogin(token: idToken ?? "");
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
    // PageTools.toHome();
    appleLogin(({
      required bool success,
      String? token,
      String? nickname,
    }) async {
      AuthEntity? data = await AuthAPI.appleLogin(code: token ?? "");
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
}
