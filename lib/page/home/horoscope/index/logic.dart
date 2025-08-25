import 'dart:async';

import 'package:astrea/core/bus/app_event_bus.dart';
import 'package:astrea/core/enum/view_state.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/friend_entity.dart';
import 'package:astrea/net/bean/natal_report_entity.dart';
import 'package:astrea/page/home/horoscope/index/mixin_controller/mixin_report.dart';
import 'package:astrea/page/home/horoscope/index/mixin_controller/mixin_stars.dart';
import 'package:get/get.dart';

import 'mixin_controller/mixin_account.dart';
import 'mixin_controller/mixin_friend.dart';

class HoroscopeLogic extends GetxController
    with
        HoroscopeFriendLogicMixin,
        HoroscopeAccountLogicMixin,
        HoroscopeReportLogicMixin,
        HoroscopeStarsLogicMixin {
  String? reportId = "";

  ///显示姓名和生日
  String name = "";
  String birthday = "";

  ///默认loading
  int viewState = HomeViewState.loading.index;
  bool isOneself = true;
  bool isCheckUser = true;
  bool isShowOneself = true;
  int selectedStarIndex = 0;

  late StreamSubscription<RefreshUserEvent> refreshUserEvent2;

  @override
  void onInit() {
    super.onInit();
    initLocal();
    refreshUserEvent2 = AppEventBus.eventBus.on<RefreshUserEvent>().listen((_) {
      changeReport(isOneself: true);
    });

    deleteEvent = AppEventBus.eventBus.on<DeleteFriendsEvent>().listen((event) {
      if (isCheckUser) {
        loadFriends(id: null);
        //friends.removeWhere((friend) => friend.id == event.id);
        //isAddFriend = friends.isNotEmpty;
        // AccountService.to.updateFriendList(value.$2);
        //update();
      } else {
        bool isHas = friends
            .where((e) => e.isChecked == true)
            .toList()
            .any((e) => e.id == event.id);
        if (isHas) {
          isCheckUser = true;
          changeReport(isOneself: true);
          loadFriends(id: null);
        } else {
          loadFriends(id: null);
        }
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    refreshUserEvent2.cancel();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
    loadFriends();
    loadAccount().then((value) {
      if (value != null) {
        name = value.nickName ?? "";
        birthday = value.showBirthDay;
        update();
      }
    });
  }

  void initLocal() {
    if (Get.arguments != null && Get.arguments is Map<String, dynamic>) {
      Map map = Get.arguments as Map<String, dynamic>;
      int value = map["viewSate"] as int;
      if (value == HomeViewState.data.index) {
        reportId = map["friendId"] as String?;
        data = (map["data"] as NatalReportEntity?);
        viewState = HomeViewState.data.index;
      }
      if (value == HomeViewState.loading.index) {
        reportId = map["friendId"] as String?;
        viewState = HomeViewState.loading.index;
      }
      if (value == HomeViewState.reload.index) {
        viewState = HomeViewState.reload.index;
      }
      update();
    }
  }

  Future<void> loadData() async {
    if (viewState == HomeViewState.data.index) {
      if (data == null && reportId != null) {
        loadReport(reportId: reportId ?? "");
      }
    } else if (viewState == HomeViewState.loading.index) {
      if (reportId != null) {
        loadReport(reportId: reportId ?? "");
      }
    } else if (viewState == HomeViewState.reload.index) {
      //reloadData();
    }
  }

  Future<void> loadReport({
    required String reportId,
    bool isLoading = true,
  }) async {
    if (isLoading) viewState = HomeViewState.loading.index;
    update();
    (bool, NatalReportEntity) value = await loadAstrologyReport(
      reportId: reportId,
    );
    if (value.$1) {
      viewState = HomeViewState.data.index;
      update();
    } else {
      viewState = HomeViewState.reload.index;
      update();
    }
  }

  ///点击reload
  Future<void> reloadData() async {
    viewState = HomeViewState.loading.index;
    update();
    if (isOneself) {
      account = await loadAccount();
      if (account?.isNew == true) {
        bool isSuccessful = await updateAccount();
        if (isSuccessful) {
          account = await loadAccount();
          if (account?.friendId != null) {
            reportId = account?.friendId;
            loadReport(reportId: reportId ?? "");
          } else {
            viewState = HomeViewState.reload.index;
            update();
          }
        } else {
          viewState = HomeViewState.reload.index;
          update();
        }
      } else {
        loadReport(reportId: reportId ?? "");
      }
    } else {
      loadReport(reportId: reportId ?? "");
    }
  }

  ///刷新
  toRefresh() {
    loadReport(reportId: reportId ?? "", isLoading: false);
  }

  ///切换星盘
  Future<void> changeReport({
    String? id,
    int? index,
    bool isOneself = true,
  }) async {
    isOneself = isOneself;
    AppLoading.show();
    if (isOneself) {
      await loadAccount();
      name = nickName;
      birthday = showBirthday;
      reportId = account?.friendId;
      update();
      await loadReport(reportId: reportId ?? "", isLoading: false);
      AppLoading.dismiss();
    } else {
      FriendEntity account = friends[(index ?? 0)];
      name = account.nickName ?? "";
      birthday = account.showBirthDay;
      update();
      reportId = id;
      await loadReport(reportId: reportId ?? "", isLoading: false);
      AppLoading.dismiss();
    }
  }
}
