import 'package:astrea/core/gallery/sheet_gallery.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/net/api/account.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AccountLogic extends GetxController {
  AccountEntity? account;
  String get avatar => account?.headimg ?? "";
  String get nickName => account?.nickName ?? "--";

  @override
  void onInit() {
    super.onInit();
    initLocalData();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  void initLocalData() {
    account = AccountService.to.data;
    update();
  }

  Future<void> loadData() async {
    account = await AccountAPI.getAccount();
    update();
  }

  void toPersonalData() {
    PageTools.toPersonalData(
      account: account,
      onRefresh: () {
        loadData();
      },
    );
  }

  void toAccountInformation() =>
      PageTools.toAccountInformation(account: account);

  void showSheet() {
    showCameraAndGallerySheet(
      onFinish: (url) {
        account?.headimg = url;
        update();
      },
    );
  }
}
