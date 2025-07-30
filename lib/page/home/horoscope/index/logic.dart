import 'package:astrea/components/star.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/storage/astrology_service.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/net/api/astro.dart';
import 'package:astrea/net/api/friend.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:astrea/net/bean/friend_entity.dart';
import 'package:astrea/net/bean/natal_report_entity.dart';
import 'package:get/get.dart';

class HoroscopeLogic extends GetxController {
  NatalReportEntity? data;
  AccountEntity? account;

  ///账户
  String get nickName => account?.nickName ?? LanKey.oneself.tr;
  String get avatar => account?.headimg ?? "";
  String get showBirthday => account?.showBirthDay ?? "--";

  ///星盘
  String get natalChartImage => data?.natalChartImg ?? "";
  //String get natalChartImage => "https://img.alicdn.com/imgextra/i4/O1CN01Z5paLz1O0zuCC7osS_!!6000000001644-55-tps-83-82.svg";
  String get sunSign => data?.natalChartResult?.sunSign ?? "";
  String? get sunSignIcon => AppStarIcon.selectSign(sunSign);
  String get moonSign => data?.natalChartResult?.moonSign ?? "";
  String? get moonSignIcon => AppStarIcon.selectSign(moonSign);
  String get ascendantSign => data?.natalChartResult?.ascendantSign ?? "";
  String? get ascendantSignIcon => AppStarIcon.selectSign(ascendantSign);
  String get element => data?.natalChartResult?.element ?? "";
  String get form => data?.natalChartResult?.form ?? "";
  String get ruler => data?.natalChartResult?.ruler ?? "";

  ///三大主行
  String get sunSignInterpretation =>
      data?.natalChartReport?.threeMainStars?.sun?.interpretation ?? "";
  String get moonSignInterpretation =>
      data?.natalChartReport?.threeMainStars?.moon?.interpretation ?? "";
  String get ascendantSignInterpretation =>
      data?.natalChartReport?.threeMainStars?.ascendant?.interpretation ?? "";

  ///yesterday
  String get yesterdaySummary =>
      data?.predicationAnalysisResult?.yesterday?.summary ?? "";

  ///today
  String get todaySummary =>
      data?.predicationAnalysisResult?.today?.summary ?? "";
  String get todayShould => data?.predicationAnalysisResult?.today?.dod ?? "";
  String get todayAvoid => data?.predicationAnalysisResult?.today?.avoid ?? "";
  int get loveValue => data?.predicationAnalysisResult?.today?.score?.love ?? 0;
  int get careerValue =>
      data?.predicationAnalysisResult?.today?.score?.career ?? 0;
  int get wealthValue =>
      data?.predicationAnalysisResult?.today?.score?.wealth ?? 0;
  String get todayGuide =>
      data?.predicationAnalysisResult?.today?.luckBoostingTip ?? "";

  String get todayLove => data?.predicationAnalysisResult?.today?.love ?? "";
  String get todayCareer =>
      data?.predicationAnalysisResult?.today?.career ?? "";
  String get todayWealth =>
      data?.predicationAnalysisResult?.today?.wealth ?? "";

  ///tomorrow
  String get tomorrowSummary =>
      data?.predicationAnalysisResult?.tomorrow?.summary ?? "";
  String get tomorrowGuide =>
      data?.predicationAnalysisResult?.tomorrow?.luckBoostingTip ?? "";

  /// week
  String get weekSummary =>
      data?.predicationAnalysisResult?.week?.summary ?? "";

  String get weekGuide =>
      data?.predicationAnalysisResult?.week?.luckBoostingTip ?? "";

  /// month
  String get monthSummary =>
      data?.predicationAnalysisResult?.month?.summary ?? "";

  /// year
  String get yearSummary =>
      data?.predicationAnalysisResult?.year?.summary ?? "";

  int viewState = 0;

  bool isAddFriend = false;

  ///不包含用户自己
  List<FriendEntity> friends = [];

  @override
  void onInit() {
    super.onInit();
    initLocalData();
  }

  void initLocalData() {
    if (Get.arguments != null && Get.arguments is NatalReportEntity) {
      data = Get.arguments as NatalReportEntity;
    } else {
      data = AstrologyService.to.getNatalValue();
    }
    account = AccountService.to.getAccount();
    friends = AccountService.to.getFriendList().where((e) => !e.isMe).toList();
    // debugPrint("data=> ${data}, account => ${account}");
    if (data == null) {
      viewState = 1;
    }
    update();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
    getFriends();
  }

  Future<void> loadData() async {
    (bool, NatalReportEntity) value = await AstrologyAPI.getAstrologyReport(
      id: AccountService.to.friendId,
    );
    if (value.$1) {
      viewState = 0;
      data = value.$2;
      update();
    }
  }

  Future<void> refreshData() async {
    viewState = 2;
    update();

    (bool, NatalReportEntity) value = await AstrologyAPI.getAstrologyReport(
      id: AccountService.to.friendId,
    );
    if (value.$1) {
      viewState = 0;
      data = value.$2;
      update();
    } else {
      viewState = 1;
      update();
    }
  }

  Future<void> getFriends() async {
    int len = AccountService.to.getFriendList().length;
    if (len >= 2) {
      isAddFriend = true;
      update();
    } else {
      List<FriendEntity> data = await FriendAPI.getFriends();
      friends = data.where((e) => !e.isMe).toList();
      AccountService.to.updateFriendList(friends);
      isAddFriend = (friends.length >= 2);
      update();
    }
  }
}
