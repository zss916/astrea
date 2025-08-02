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

    /*if (AccountService.to.isNewUser) {
      ///判断是否完成资料录入
      if (AccountService.to.isFinishRecord) {
        debugPrint("ddd===>> ${AccountService.to.friendId}");
        AccountService.to.userID;
        AccountService.to.isLogin;
        PageTools.toResult();
      } else {
        PageTools.toStep();
      }
    } else {
      PageTools.offAllNamedHome();
    }*/

    if (data.$1) {
      ///判断是否是同一个用户
      if (AccountService.to.getAccount()?.userId == data.$2?.userId) {
        PageTools.offAllNamedHome();
      } else {
        AccountService.to.updateLocalUserInfo(
          uid: data.$2?.userId,
          loginEmail: email,
          loginChannel: LoginChannel.email.value,
          authToken: data.$2?.authToken ?? "",
          isNewUser: data.$2?.isNewUser,
        );
        PageTools.loginToNext();
      }
    } else {
      AppLoading.toast("login failed");
    }
  }
}
