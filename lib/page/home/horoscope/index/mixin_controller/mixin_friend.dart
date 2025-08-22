import 'dart:async';

import 'package:astrea/core/bus/app_event_bus.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/api/friend.dart';
import 'package:astrea/net/bean/friend_entity.dart';
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
      loadFriends(id: event.id);
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
        List<FriendEntity> list = value.$2
            .map(
              (e) =>
                  e.id == id ? (e..isChecked = true) : (e..isChecked = false),
            )
            .toList();
        AccountService.to.updateFriendList(list);
        friends = list.where((e) => !e.isMe).toList();
      } else {
        AccountService.to.updateFriendList(value.$2);
        friends = value.$2.where((e) => !e.isMe).toList();
      }
      isAddFriend = friends.isNotEmpty;
      update();
    }
  }
}
