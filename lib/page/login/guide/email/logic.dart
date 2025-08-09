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
    (bool isSuccess, AuthEntity? auth, int code) data =
        await AuthAPI.emailLogin(
          email: email,
          pwd: pwd,
          loginType: loginType,
          cancelToken: cancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });

    if (data.$1) {
      AccountService.to.saveAccountAndPsd(email, pwd);
      AccountService.to.updateLocalUserInfo(
        uid: data.$2?.userId,
        loginEmail: email,
        loginChannel: LoginChannel.email.value,
        authToken: data.$2?.authToken ?? "",
        isNewUser: data.$2?.isNewUser,
      );
      if (loginType == LoginType.loginAndRegister.index) {
        if (data.$2?.checkNewUser == false) {
          showAccountExistsDialog(
            onLoginAndUpdate: () {
              ///更新
              PageTools.toResult();
            },
            onOnlyLogin: () {
              ///不更新
              PageTools.offAllNamedHome(friendId: data.$2?.friendId);
            },
          );
        } else {
          PageTools.toResult();
        }
      } else {
        PageTools.offAllNamedHome(friendId: data.$2?.friendId);
      }
    }
  }
}
