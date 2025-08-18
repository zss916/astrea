part of 'index.dart';

class SplashLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    AppService.to.init().then((service) {
      if (service.deviceIdentifier == null) {
        PageTools.toStart(isRegistered: false);
      } else {
        fetchDevice(deviceId: service.deviceIdentifier);
      }
    });
  }

  Future<void> fetchDevice({String? deviceId}) async {
    // var result = await Http.instance.post(ApiPath.test);

    AccountAPI.fetchDevice(deviceId: deviceId).then((value) {
      if (value) {
        if (AccountService.to.isLogin && !AccountService.to.isNewUser) {
          ///已经更新用户信息,登录成功
          if (AccountService.to.friendId.isEmpty) {
            PageTools.toStart(isRegistered: true);
          } else {
            PageTools.toHome(friendId: AccountService.to.friendId);
          }
        } else {
          ///没有更新用户信息，重新登录
          PageTools.toStart(isRegistered: true);
          // PageTools.toWelcome();
        }
      } else {
        PageTools.toStart(isRegistered: false);
      }
    });
  }
}
