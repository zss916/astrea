part of 'index.dart';

class StartLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toStep() => PageTools.toStep();

  void toLogin() => PageTools.toWelcome();

  void toPrivacy() {
    PageTools.toWeb(
      title: LanKey.startPrivacyPolicy.tr,
      url: AppSetting.policy,
    );
  }

  void toService() {
    PageTools.toWeb(title: LanKey.startTermsOfService.tr, url: AppSetting.term);
  }
}
