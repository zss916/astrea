import 'package:astrea/net/api/location.dart';
import 'package:astrea/net/bean/country_entity.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();
  Map<String, List<CountryEntity>> countryData = {};

  @override
  void onInit() {
    super.onInit();
    // loadData();
  }

  Future<void> loadData() async {
    countryData.clear();
    List<CountryEntity> countryList = await LocationAPI.getCountryList();
    countryData = countryList.groupListsBy((e) => e.firstLetter ?? "");
  }
}
