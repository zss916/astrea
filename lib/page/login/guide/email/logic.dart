part of 'index.dart';

class EmailLogic extends GetxController with AppValidatorMixin {
  CancelToken cancelToken = CancelToken();
  bool isEmailError = false;
  bool isPsdError = false;
  int loginType = LoginType.loginAndRegister.index;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is int) {
      loginType = Get.arguments as int;
    }
  }

  @override
  void onClose() {
    cancelToken.cancel("email cancel");
    super.onClose();
    AppLoading.dismiss();
  }

  /// 邮箱登录
  Future<void> toAuthEmail({
    required String email,
    required String pwd,
    bool? isToResult,
  }) async {
    bool isEmailValidate = EmailValidator.validate(email);
    isEmailError = !isEmailValidate;
    update();

    bool isPwdValidate = isPwd(pwd);
    isPsdError = !isPwdValidate;
    update();

    if (!isEmailValidate || !isPwdValidate) {
      return;
    }

    AppLoading.show();
    final (bool isSuccess, AuthEntity? auth, int code) =
        await AuthAPI.emailLogin(
          email: email,
          pwd: pwd,
          loginType: loginType,
          cancelToken: cancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });

    if (isSuccess) {
      AccountService.to.saveAccountAndPsd(email, pwd);
      AccountService.to.setLoginChannel(LoginChannel.email.value);
      AccountService.to.updateLocalUserInfo(
        uid: auth?.userId,
        loginEmail: email,
        authToken: auth?.authToken ?? "",
        isNewUser: auth?.isNewUser,
      );
      if (loginType == LoginType.loginAndRegister.index) {
        if (auth?.checkNewUser == false) {
          showAccountExistsDialog(
            onLoginAndUpdate: () {
              ///更新
              //PageTools.toResult();
              PageTools.toStep(loginType: LoginType.loginAndRegister.index);
            },
            onOnlyLogin: () {
              ///不更新
              PageTools.offAllNamedHome(friendId: auth?.friendId);
            },
          );
        } else {
          PageTools.toStep(loginType: LoginType.loginAndRegister.index);
          //PageTools.toResult();
        }
      } else {
        if ((auth?.isCompleteInfo ?? false)) {
          PageTools.offAllNamedHome(friendId: auth?.friendId);
        } else {
          PageTools.toGuide(loginType: LoginType.loginAndRestart.index);
        }
      }
    }
  }
}
