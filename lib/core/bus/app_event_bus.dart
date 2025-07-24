import 'package:event_bus/event_bus.dart';

class AppEventBus {
  static final EventBus eventBus = EventBus();
}

class TabEvent {
  int index;
  TabEvent(this.index);
}
