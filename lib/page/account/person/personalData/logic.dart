part of 'index.dart';

class PersonalDataLogic extends GetxController {
  AccountEntity? account;

  String get avatar => account?.headimg ?? "";
  String get nickName => account?.nickName ?? "";
  String get dateBirth => account?.showBirthDayContent ?? "";
  String? get placeBirth =>
      account?.showLocality ?? AccountService.to.showLocality;
  int get sex => account?.sex ?? 0;

  @override
  void onInit() {
    super.onInit();
    initLocalData();
  }

  @override
  void onReady() {
    super.onReady();
    loadAccount();
  }

  @override
  void onClose() {
    super.onClose();
    AppLoading.dismiss();
  }

  void initLocalData() {
    if (Get.arguments != null && Get.arguments is AccountEntity) {
      account = Get.arguments as AccountEntity;
    } else {
      account = AccountService.to.getAccount();
    }
    update();
  }

  Future<void> loadAccount() async {
    account = await AccountAPI.getAccount();
    update();
  }

  Future<void> updateData() async {
    AppLoading.show();
    bool isSuccessful =
        await AccountAPI.updateAccount(
          birthday: account?.birthday,
          nickName: account?.nickName,
          birthMinute: account?.birthMinute,
          birthHour: account?.birthHour,
          interests: account?.interests,
          lon: (account?.lon == null)
              ? null
              : num.parse(account?.lon ?? "0").toInt(),
          lat: (account?.lat == null)
              ? null
              : num.parse(account?.lat ?? "0").toInt(),
          locality: account?.locality,
          sex: account?.sex,
          avatar: account?.headimg,
        ).whenComplete(() {
          AppLoading.dismiss();
          AppEventBus.eventBus.fire(RefreshFriendsEvent());
          AppEventBus.eventBus.fire(RefreshUserEvent());
        });
    if (isSuccessful) {
      if ((account?.headimg ?? "").isNotEmpty) {
        AccountService.to.updateUserAvatar(avatar);
      }
      if ((account?.nickName ?? "").isNotEmpty) {
        AccountService.to.updateUserNickName(nickName);
      }
      if (account?.sex != null) {
        AccountService.to.updateUserSex(account!.sex!);
      }
      if (account?.birthday != null) {
        AccountService.to.updateUserBirth(account!.birthday!);
      }
      if (account?.birthHour != null && account?.birthMinute != null) {
        AccountService.to.updateUserBirthHAndM(
          account!.birthHour!,
          account!.birthMinute!,
        );
      }
      if (account?.lat != null &&
          account?.lon != null &&
          account?.locality != null) {
        AccountService.to.updatePlaceBirth(
          account!.locality!,
          account!.lat!,
          account!.lon!,
        );
      }
    } else {
      debugPrint("upload  failed");
    }
  }

  void showPhotoSheet() {
    showCameraAndGallerySheet(
      onFinish: (url) {
        account?.headimg = url;
        update();
      },
    );
  }
}
