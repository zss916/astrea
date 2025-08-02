part of 'index.dart';

class HomeLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();

    ///init
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  Future<void> loadData() async {
    if (AccountService.to.getAccount() == null) {
      await AccountAPI.getAccount();
    }
  }
}
