part of 'index.dart';

class WelcomeLogic extends GetxController with LoginChannelMixin {
  CancelToken cancelToken = CancelToken();
  int loginType = LoginType.loginAndRegister.index;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is int) {
      loginType = Get.arguments as int;
    }

    if (loginType == LoginType.loginAndRegister.index) {
      AccountService.to.updateCurrentRoute(route: APages.welcome);
    }
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
    cancelToken.cancel("welcome cancel");
  }

  ///google 登录
  void toGoogleAuth() async {
    bool isSuccess = await AvailabilityHelper.checkGooglePlay();
    if (!isSuccess) {
      return;
    }
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
        PageTools.loginToNext(loginType: loginType, friendId: data.friendId);
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
        PageTools.loginToNext(loginType: loginType, friendId: data.friendId);
      } else {
        AppLoading.toast("login failed");
      }
    });
  }

  ///邮箱登录
  void toEmailAuth() => PageTools.toEmail(loginType: loginType);

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
}
