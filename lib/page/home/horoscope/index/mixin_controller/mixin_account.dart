import 'dart:async';

import 'package:astrea/core/bus/app_event_bus.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/net/api/account.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

mixin HoroscopeAccountLogicMixin on GetxController {
  CancelToken accountCancelToken = CancelToken();

  late StreamSubscription<RefreshUserEvent> refreshUserEvent;

  ///账户
  AccountEntity? account;
  String get avatar => account?.headimg ?? "";
  String get nickName => account?.nickName ?? LanKey.oneself.tr;
  String get showBirthday => account?.showBirthDay ?? "--";

  @override
  void onInit() {
    //initLocalData();
    super.onInit();
    refreshUserEvent = AppEventBus.eventBus.on<RefreshUserEvent>().listen((_) {
      loadAccount();
    });
  }

  void initLocalData() {
    account = AccountService.to.getAccount();
  }

  @override
  void onClose() {
    super.onClose();
    accountCancelToken.cancel("account Cancel");
    AppLoading.dismiss();
    refreshUserEvent.cancel();
  }

  ///获取用户信息
  Future<AccountEntity?> loadAccount() async {
    account = await AccountAPI.getAccount(cancelToken: accountCancelToken);
    if (account != null) {
      update();
    }
    return account;
  }

  ///更新用户信息
  Future<bool> updateAccount() async {
    AccountEntity? value = AccountService.to.getAccount();
    if (value != null) {
      bool isSuccessful = await AccountAPI.updateAccount(
        nickName: value.nickName,
        birthday: value.birthday,
        birthHour: value.birthHour,
        birthMinute: value.birthMinute,
        sex: value.sex,
        interests: value.interests,
        lon: num.parse(value.lon ?? "0").toInt(),
        lat: num.parse(value.lat ?? "0").toInt(),
        locality: value.locality,
        avatar: value.headimg,
      );
      return isSuccessful;
    } else {
      ///todo 退出登录
      return false;
    }
  }
}
