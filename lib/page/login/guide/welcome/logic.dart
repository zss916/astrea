part of 'index.dart';

class WelcomeLogic extends GetxController with LoginChannelMixin {
  CancelToken cancelToken = CancelToken();
  int loginType = LoginType.loginAndRegister.index;
  // bool isRegistered = false;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Map) {
      loginType = Get.arguments["loginType"] as int;
      // isRegistered = Get.arguments["isRegistered"] as bool;
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
      if (!success) {
        AppLoading.toast("Login failed, please try again");
        return;
      }
      AppLoading.show();
      AuthEntity? data =
          await AuthAPI.googleLogin(
            token: idToken ?? "",
            loginType: loginType,
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
        if (loginType == LoginType.loginAndRegister.index) {
          if (data.checkNewUser == false) {
            showAccountExistsDialog(
              onLoginAndUpdate: () {
                ///更新
                PageTools.toResult();
              },
              onOnlyLogin: () {
                ///不更新
                PageTools.offAllNamedHome(friendId: data.friendId);
              },
            );
          } else {
            PageTools.toResult();
          }
        } else {
          PageTools.offAllNamedHome(friendId: data.friendId);
        }
        // PageTools.loginToNext(loginType: loginType, friendId: data.friendId);
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
      PrintTools.log("loginType=>${loginType}");
      PrintTools.log("userIdentifier=>${userIdentifier}");
      PrintTools.log("identityToken=>${identityToken}");
      PrintTools.log("authorizationCode=>${authorizationCode}");
      AuthEntity? data =
          await AuthAPI.appleLogin(
            code: authorizationCode ?? "",
            token: identityToken ?? "",
            thirdId: userIdentifier ?? "",
            loginType: loginType,
            cancelToken: cancelToken,
          ).whenComplete(() {
            AppLoading.dismiss();
          });

      PrintTools.log("data=>${data?.toJson()}");
      PrintTools.log("friendId=>${data?.friendId}");

      // debugPrint("data===> ${data.toJson()}");
      if (data != null) {
        AccountService.to.setLoginChannel(LoginChannel.apple.value);
        AccountService.to.updateLocalUserInfo(
          uid: data.userId,
          loginEmail: "-",
          nickName: null,
          authToken: data.authToken ?? "",
        );

        PrintTools.log("save token=>${data.authToken ?? ""}");
        if (loginType == LoginType.loginAndRegister.index) {
          if (data.checkNewUser == false) {
            showAccountExistsDialog(
              onLoginAndUpdate: () {
                ///更新
                PageTools.toResult();
              },
              onOnlyLogin: () {
                ///不更新
                PageTools.offAllNamedHome(friendId: data.friendId);
              },
            );
          } else {
            PageTools.toResult();
          }
        } else {
          PageTools.offAllNamedHome(friendId: data.friendId);
        }
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
