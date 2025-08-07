part of 'index.dart';

class SplashLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      if (AccountService.to.isLogin && !AccountService.to.isNewUser) {
        ///已经更新用户信息,登录成功
        if (AccountService.to.friendId.isEmpty) {
          PageTools.toStart();
        } else {
          PageTools.toHome(friendId: AccountService.to.friendId);
        }
      } else {
        ///没有更新用户信息，重新登录
        PageTools.toStart();
        // PageTools.toWelcome();
      }
    });
  }
}
