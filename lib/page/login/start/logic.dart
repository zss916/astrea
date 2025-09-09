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

  void toStep() =>
      PageTools.toWelcome(loginType: LoginType.loginAndRegister.index);

  ///跳转注册
  void toStep2() =>
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
    bool isSuccess = await AvailabilityHelper.checkGooglePlay();
    if (!isSuccess) {
      return;
    }
    AppLoading.show();
    googleSignIn(({
      required bool success,
      String? idToken,
      String? token,
      String? id,
      String? nickname,
      String? cover,
    }) async {
      if (!success) {
        AppLoading.toast("Login failed, please try again");
        return;
      }
      AuthEntity? data =
          await AuthAPI.googleLogin(
            token: idToken ?? "",
            loginType: LoginType.onlyLogin.index,
            cancelToken: cancelToken,
          ).whenComplete(() {
            AppLoading.dismiss();
          });
      //debugPrint("data===> ${data.toJson()}");
      if (data != null) {
        AccountService.to.setLoginChannel(LoginChannel.google.value);
        AccountService.to.updateLocalUserInfo(
          uid: data.userId,
          loginEmail: "-",
          nickName: nickname,
          authToken: data.authToken ?? "",
        );

        if (data.isCompleteInfo) {
          PageTools.offAllNamedHome(friendId: data.friendId);
        } else {
          PageTools.toGuide(loginType: LoginType.loginAndRegister.index);
        }
      }
    });
  }

  ///apple 登录
  void toAppleAuth() async {
    appleLogin(({
      required bool success,
      String? nickname,
      String? authorizationCode,
      String? identityToken,
      String? userIdentifier,
    }) async {
      if (!success) {
        AppLoading.toast("Login failed, please try again");
        return;
      }
      AppLoading.show();
      AuthEntity? data =
          await AuthAPI.appleLogin(
            code: authorizationCode ?? "",
            token: identityToken ?? "",
            thirdId: userIdentifier ?? "",
            loginType: LoginType.onlyLogin.index,
            cancelToken: cancelToken,
          ).whenComplete(() {
            AppLoading.dismiss();
          });
      // debugPrint("data===> ${data.toJson()}");
      if (data != null) {
        AccountService.to.setLoginChannel(LoginChannel.apple.value);
        AccountService.to.updateLocalUserInfo(
          uid: data.userId,
          loginEmail: "-",
          nickName: nickname,
          authToken: data.authToken ?? "",
        );

        if (data.isCompleteInfo) {
          PageTools.offAllNamedHome(friendId: data.friendId);
        } else {
          PageTools.toGuide(loginType: LoginType.loginAndRegister.index);
        }
      }
    });
  }
}
