part of 'index.dart';

class SplashLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();

    Future.delayed(Duration(seconds: 3), () {
      if (AccountService.to.getLoginFinish()) {
        if (AccountService.to.isLogin && !AccountService.to.isNewUser) {
          ///登录成功
          PageTools.toHome();
        } else {
          ///重新登录
          PageTools.toStart();
          // PageTools.toWelcome();
        }
      } else {
        ///登录失败
        PageTools.toResult();
      }
    });
  }
}
