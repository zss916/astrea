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

  ///不包含用户自己
  List<FriendEntity> friends = [];
  bool isAddFriend = false;

  @override
  void onInit() {
    // initLocalData();
    super.onInit();
    refreshEvent = AppEventBus.eventBus.on<RefreshFriendsEvent>().listen((_) {
      loadFriends();
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
  }

  ///获取用户列表
  Future<void> loadFriends() async {
    (bool, List<FriendEntity>) value = await FriendAPI.getFriends(
      cancelToken: friendCancelToken,
    );
    if (value.$1) {
      AccountService.to.updateFriendList(value.$2);
      friends = value.$2.where((e) => !e.isMe).toList();
      isAddFriend = friends.isNotEmpty;
      update();
    }
  }
}
