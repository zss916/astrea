import 'package:astrea/net/bean/star_item_entity.dart';
import 'package:get/get.dart';

mixin HoroscopeStarsLogicMixin on GetxController {
  List<StarItemEntity> starList = [
    StarItemEntity(),
    StarItemEntity(),
    StarItemEntity(),
    StarItemEntity(),
    StarItemEntity(),
    StarItemEntity(),
    StarItemEntity(),
    StarItemEntity(),
    StarItemEntity(),
    StarItemEntity(),
    StarItemEntity(),
    StarItemEntity(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
