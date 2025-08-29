part of 'index.dart';

class StartLogic extends GetxController with LoginChannelMixin {
  bool isRegistered = false;

  CancelToken cancelToken = CancelToken();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      isRegistered = Get.arguments["isRegistered"];
      debugPrint("isRegistered:$isRegistered");
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
    cancelToken.cancel("login cancel");
    AppLoading.dismiss();
  }

  ///跳转注册
  void toStep() =>
      PageTools.toStep(loginType: LoginType.loginAndRegister.index);

  ///邮箱登录
  void toEmail() => PageTools.toEmail(loginType: LoginType.onlyLogin.index);
  void toLogin() => PageTools.toWelcome(loginType: LoginType.onlyLogin.index);

  ///隐私
  void toPrivacy() => PageTools.toWeb(
    title: LanKey.startPrivacyPolicy.tr,
    url: AppSetting.policy,
  );

  ///服务
  void toService() => PageTools.toWeb(
    title: LanKey.startTermsOfService.tr,
    url: AppSetting.term,
  );

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
        PageTools.loginToNext(
          loginType: LoginType.onlyLogin.index,
          friendId: data.friendId,
        );
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
        PageTools.loginToNext(
          loginType: LoginType.onlyLogin.index,
          friendId: data.friendId,
        );
      } else {
        AppLoading.toast("login failed");
      }
    });
  }
}
