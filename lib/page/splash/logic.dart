part of 'index.dart';

class SplashLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      ///是否已经登录
      if (AccountService.to.isLogin) {
        PageTools.toHome();
      } else {
        ///是否有数据
        PageTools.toStart();
        // PageTools.toWelcome();
      }
    });
  }
}
