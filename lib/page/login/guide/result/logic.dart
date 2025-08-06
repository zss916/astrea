part of 'index.dart';

class ResultLogic extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  Future<void> loadData() async {
    AccountEntity? account = AccountService.to.getAccount();
    bool isSuccessful = await AccountAPI.updateAccount(
      nickName: account?.nickName,
      birthday: account?.birthday,
      birthHour: account?.birthHour,
      birthMinute: account?.birthMinute,
      sex: account?.sex,
      interests: account?.interests,
      lon: num.parse(account?.lon ?? "0").toInt(),
      lat: num.parse(account?.lat ?? "0").toInt(),
      locality: account?.locality,
      avatar: account?.headimg,
    );
    if (isSuccessful) {
      AccountEntity? account = await AccountAPI.getAccount();
      if (account?.friendId != null) {
        (bool, NatalReportEntity) value = await AstrologyAPI.getAstrologyReport(
          id: account?.friendId ?? "",
        );
        if (value.$1) {
          AstrologyService.to.update(value.$2);
          AccountService.to.setLoginFinish(isFinish: true);
          PageTools.offAllNamedHome(data: value.$2);
        } else {
          AppLoading.toast("get astrology report failed");
          AccountService.to.setLoginFinish(isFinish: false);
        }
      } else {
        AppLoading.toast("get account failed");
        AccountService.to.setLoginFinish(isFinish: false);
      }
    } else {
      AppLoading.toast("update account failed");
      AccountService.to.setLoginFinish(isFinish: false);
    }
  }
}
