part of 'index.dart';

class ResultLogic extends GetxController {
  CancelToken cancelToken = CancelToken();

  @override
  void onInit() {
    super.onInit();
    // 预加载视频资源
    PlayerPreloader().preloadVideos();
  }

  @override
  void onClose() {
    super.onClose();
    cancelToken.cancel("result cancel");
    AstrologyAPI.stopPolling();
  }

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
      cancelToken: cancelToken,
    );
    if (isSuccessful) {
      AccountEntity? account = await AccountAPI.getAccount(
        cancelToken: cancelToken,
      );
      if (account?.friendId != null) {
        /*AstrologyAPI.loopReport(
          id: account?.friendId ?? "",
          cancelToken: cancelToken,
          onFinish: (value) {
            AstrologyService.to.update(value);
            PageTools.offAllNamedHome(data: value, friendId: account?.friendId);
          },
          onError: () {
            PageTools.offAllNamedHome(friendId: account?.friendId);
          },
        );*/

        final (
          bool isSuccessful,
          NatalReportEntity report,
        ) = await AstrologyAPI.loopAndReturnReport(
          id: account?.friendId ?? "",
          cancelToken: cancelToken,
        );
        if (isSuccessful) {
          PageTools.offAllNamedHome(data: report, friendId: account?.friendId);
        } else {
          debugPrint("get astrology report failed");
          PageTools.offAllNamedHome(friendId: account?.friendId);
        }

        /*final (bool success, NatalReportEntity report) = await AstrologyAPI.getAstrologyReport(
          id: account?.friendId ?? "",
          cancelToken: cancelToken,
        );
        if (success) {
          AstrologyService.to.update(report);
          PageTools.offAllNamedHome(
            data: report,
            friendId: account?.friendId,
          );
        } else {
          debugPrint("get astrology report failed");
          PageTools.offAllNamedHome(friendId: account?.friendId);
        }*/
      } else {
        debugPrint("get account failed");
        PageTools.offAllNamedHome();
      }
    } else {
      debugPrint("update account failed");
      PageTools.offAllNamedHome();
    }
  }
}
