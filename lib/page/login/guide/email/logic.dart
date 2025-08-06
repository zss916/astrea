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
    bool isEmailValidate = EmailValidator.validate(email);
    isEmailError = !isEmailValidate;
    update();

    bool isPwdValidate = isPwd(pwd);
    isPsdError = !isPwdValidate;
    update();

    if (!isEmailValidate || !isPwdValidate) {
      return;
    }

    // return;

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
      AccountService.to.updateLocalUserInfo(
        uid: data.$2?.userId,
        loginEmail: email,
        loginChannel: LoginChannel.email.value,
        authToken: data.$2?.authToken ?? "",
        isNewUser: data.$2?.isNewUser,
      );
      if (data.$2?.checkNewUser == true) {
        //账号未更新信息，update -> getFriendId -> getReport -> home page
        PageTools.toResult();
      } else {
        //账号已经更新信息
        PageTools.offAllNamedHome();
      }
      // /* AccountEntity? account = await AccountAPI.getAccount(isCache: false);
      // if (account != null) {
      //   if (account.isNew) {
      //     //账号未更新信息，update -> getFriendId -> getReport -> home page
      //     PageTools.toResult();
      //   } else {
      //     //账号已经更新信息
      //     PageTools.offAllNamedHome();
      //   }
      //   PageTools.loginToNext(loginType: loginType);
      // } else {
      //   AppLoading.toast("getAccount failed");
      // }*/
    } else {
      if (data.$3 == 1005) {
        ///邮箱不存在(type = 1)
        showAccountLostDialog(
          onEditEmail: () {
            //修改邮箱
          },
          onLogin: () {
            //注册
            //  loginType = LoginType.loginAndRegister.index;
            //  toAuthEmail(email: email, pwd: pwd);
            toLoginAndRegister(email: email, pwd: pwd);
          },
        );
      } else if (data.$3 == 1007) {
        ///账号已存在(type = 0)
        showAccountExistsDialog(
          onEditEmail: () {},
          onLogin: () {
            //登录
            // loginType = LoginType.onlyLogin.index;
            toOnlyLogin(email: email, pwd: pwd);
            //toOnlyLogin(email: email, pwd: pwd);
          },
        );
      }
    }
  }

  /// 仅邮箱登录
  Future<void> toOnlyLogin({required String email, required String pwd}) async {
    (bool isSuccess, AuthEntity? auth, int code) data =
        await AuthAPI.emailLogin(
          email: email,
          pwd: pwd,
          loginType: LoginType.onlyLogin.index,
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

      PageTools.offAllNamedHome();

      ///判断是否有用户信息，调用获取用户信息接口判断
      // AccountEntity? account = await AccountAPI.getAccount(isCache: false);
      // if (account != null) {
      //   if (account.isNew) {
      //     //todo 可能本地用户资料少
      //     String? birthday = AccountService.to.getAccount()?.birthday;
      //     if (birthday != null) {
      //       ///账号未更新信息，update -> getFriendId -> getReport -> home page
      //       PageTools.toResult();
      //     } else {
      //       //todo 去更新信息
      //     }
      //   } else {
      //     //账号已经更新信息
      //     PageTools.offAllNamedHome();
      //   }
      //   PageTools.loginToNext(loginType: loginType);
      // } else {
      //   AppLoading.toast("getAccount failed");
      // }

      ///todo 是否更新信息
      // PageTools.offAllNamedHome();
    } else {
      AppLoading.toast("emailLogin failed");
    }
  }

  /// 登录并注册
  Future<void> toLoginAndRegister({
    required String email,
    required String pwd,
  }) async {
    (bool isSuccess, AuthEntity? auth, int code) data =
        await AuthAPI.emailLogin(
          email: email,
          pwd: pwd,
          loginType: LoginType.loginAndRegister.index,
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
      PageTools.toGuide(loginType: LoginType.loginAndRegister.index);
    } else {
      AppLoading.toast("Email Login failed");
    }
  }
}
