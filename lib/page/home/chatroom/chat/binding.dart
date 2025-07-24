part of 'index.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() => Get.put<ChatLogic>(ChatLogic());
}
