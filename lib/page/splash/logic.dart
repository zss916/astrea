part of 'index.dart';

class SplashLogic extends GetxController {
  ///ATT
  void checkAppTrackingTransparency() async {
    final status = await AppTrackingTransparency.requestTrackingAuthorization();
    if (await AppTrackingTransparency.trackingAuthorizationStatus ==
        TrackingStatus.notDetermined) {
      // await showCustomTrackingDialog(Get.context!);
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  /*Future<void> showCustomTrackingDialog(BuildContext context) async =>
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('亲爱的用户'),
          content: const Text(
            '我们关心您的隐私和数据安全。我们通过展示广告保持应用免费。\n'
                '我们可以继续使用您的数据为您定制广告吗？\n\n'
                '您可以在应用设置中随时更改选择。\n'
                '我们的合作伙伴将在您的设备上收集数据并使用唯一标识符向您展示广告。',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('继续'),
            ),
          ],
        ),
      );
*/

  @override
  void onReady() {
    super.onReady();
    if (GetPlatform.isIOS) {
      checkAppTrackingTransparency();
    }
    AppService.to.init().then((service) {
      if (service.deviceIdentifier == null) {
        PageTools.toStart(isRegistered: false);
      } else {
        fetchDevice(deviceId: service.deviceIdentifier);
      }
    });
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
