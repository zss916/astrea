import 'dart:async';

import 'package:astrea/core/bus/app_event_bus.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/core/utils/helper.dart';
import 'package:astrea/net/api/friend.dart';
import 'package:astrea/net/bean/friend_entity.dart';
import 'package:astrea/page/home/horoscope/index/logic.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

mixin HoroscopeFriendLogicMixin on GetxController {
  CancelToken friendCancelToken = CancelToken();

  late StreamSubscription<RefreshFriendsEvent> refreshEvent;
  late StreamSubscription<DeleteFriendsEvent> deleteEvent;

  ///不包含用户自己
  List<FriendEntity> friends = [];
  bool isAddFriend = false;

  @override
  void onInit() {
    super.onInit();
    initLocalData();
    refreshEvent = AppEventBus.eventBus.on<RefreshFriendsEvent>().listen((
      event,
    ) {
      loadFriends(id: event.item?.id);
    });
  }

  void initLocalData() {
    friends = AccountService.to.getFriendList().where((e) => !e.isMe).toList();
    isAddFriend = friends.isNotEmpty;
  }

  @override
  void onClose() {
    super.onClose();
    friendCancelToken.cancel("friend Cancel");
    AppLoading.dismiss();
    refreshEvent.cancel();
    deleteEvent.cancel();
  }

  ///获取用户列表
  Future<void> loadFriends({int? id}) async {
    (bool, List<FriendEntity>) value = await FriendAPI.getFriends(
      cancelToken: friendCancelToken,
    );
    if (value.$1) {
      if (id != null) {
        bool isHas = friends
            .where((e) => e.isChecked == true)
            .toList()
            .any((e) => e.id == id);

        if (isHas) {
          ///修改
          List<FriendEntity> list = value.$2
              .map(
                (e) =>
                    e.id == id ? (e..isChecked = true) : (e..isChecked = false),
              )
              .toList();
          AccountService.to.updateFriendList(list);
          friends = list.where((e) => !e.isMe).toList();

          ///change Report
          safeFind<HoroscopeLogic>()?.changeReport(
            id: id.toString(),
            index: friends.indexWhere((element) => element.id == id),
            isOneself: false,
          );
        } else {
          ///添加
          List<int?> ids = friends
              .where((e) => e.isChecked == true)
              .toList()
              .map((e) => e.id)
              .toList();
          if (ids.isNotEmpty) {
            ///选中
            AccountService.to.updateFriendList(
              value.$2
                  .map((e) => ids.contains(e.id) ? (e..isChecked = true) : e)
                  .toList(),
            );
            friends = value.$2
                .where((e) => !e.isMe)
                .toList()
                .map((e) => ids.contains(e.id) ? (e..isChecked = true) : e)
                .toList();
          } else {
            AccountService.to.updateFriendList(value.$2);
            friends = value.$2.where((e) => !e.isMe).toList();
          }
        }
      } else {
        AccountService.to.updateFriendList(value.$2);
        friends = value.$2.where((e) => !e.isMe).toList();
      }
      isAddFriend = friends.isNotEmpty;
      update();
    }
  }
}
