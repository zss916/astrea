import 'dart:async';

import 'package:astrea/core/bus/app_event_bus.dart';
import 'package:astrea/core/gallery/sheet_gallery.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/net/api/account.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:get/get.dart';

class AccountLogic extends GetxController {
  AccountEntity? account;
  String get avatar => account?.headimg ?? "";
  String get nickName => account?.nickName ?? LanKey.oneself.tr;
  late StreamSubscription<RefreshUserEvent> refreshUserEvent;

  @override
  void onInit() {
    super.onInit();
    initLocalData();
    refreshUserEvent = AppEventBus.eventBus.on<RefreshUserEvent>().listen((
      event,
    ) {
      loadData();
    });
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
    refreshUserEvent.cancel();
  }

  void initLocalData() {
    account = AccountService.to.getAccount();
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
