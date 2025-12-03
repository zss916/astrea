part of 'index.dart';

class SplashLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    if (GetPlatform.isIOS) {
      ATT.checkAppTrackingTransparency();
    }
    AppService.to.init().then((service) {
      if (service.deviceIdentifier == null) {
        PageTools.toStart(isRegistered: false);
      } else {
        fetchDevice(deviceId: service.deviceIdentifier);
      }
    });

    // AccountAPI.config();
  }

  Future<void> fetchDevice({String? deviceId}) async {
    AccountAPI.fetchDevice(deviceId: deviceId).then((value) {
      if (value) {
        if (AccountService.to.isLogin) {
          if (!AccountService.to.isNewUser) {
            ///已经更新用户信息,登录成功
            if (AccountService.to.friendId.isEmpty) {
              PageTools.toStart(isRegistered: true);
            } else {
              PageTools.toHome(friendId: AccountService.to.friendId);
            }
          } else {
            ///没有更新用户信息,已经登录
            PageTools.toStep(loginType: LoginType.loginAndRestart.index);
          }
        } else {
          ///重新登录
          PageTools.toStart(isRegistered: true);
        }
      } else {
        PageTools.toStart(isRegistered: false);
      }
    });
  }
}
