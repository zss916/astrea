import 'package:event_bus/event_bus.dart';

class AppEventBus {
  static final EventBus eventBus = EventBus();
}

class TabEvent {
  int index;
  TabEvent(this.index);
}

class RefreshFriendsEvent {
  int? id;
  RefreshFriendsEvent({this.id});
}

class DeleteFriendsEvent {
  int? id;
  DeleteFriendsEvent({this.id});
}

class RefreshUserEvent {
  RefreshUserEvent();
}
