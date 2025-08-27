import 'package:astrea/net/bean/friend_entity.dart';
import 'package:event_bus/event_bus.dart';

class AppEventBus {
  static final EventBus eventBus = EventBus();
}

class TabEvent {
  int index;
  TabEvent(this.index);
}

class RefreshFriendsEvent {
  FriendEntity? item;
  RefreshFriendsEvent({this.item});
}

class DeleteFriendsEvent {
  int? id;
  DeleteFriendsEvent({this.id});
}

class RefreshUserEvent {
  RefreshUserEvent();
}

class RefreshLogEvent {
  RefreshLogEvent();
}
