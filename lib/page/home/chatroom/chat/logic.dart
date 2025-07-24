part of 'index.dart';

class ChatLogic extends GetxController {
  List<dynamic> historyMsg = [];
  List<dynamic> currentMsg = [
    "Will my financial luck impro?",
    "When designing a layout or creating a digital project"
  ];

  bool isOpenVip = false;

  @override
  void onReady() {
    super.onReady();
    // showOpenVipSheet();
  }
}
