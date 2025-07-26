import 'package:astrea/page/home/synastry/index/logic.dart';
import 'package:get/get.dart';

class SynastryBinding implements Bindings {
  @override
  void dependencies() => Get.put<SynastryLogic>(SynastryLogic());
}
