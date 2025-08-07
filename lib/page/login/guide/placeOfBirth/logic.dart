part of 'index.dart';

class PlaceOfBirthLogic extends GetxController {
  Map<String, List<CountryEntity>> countryData = {};
  Map<String, List<StateEntity>> stateData = {};
  Map<String, List<CityEntity>> cityData = {};

  int get keyCountryCount => countryData.values.length;
  int get keyStateCount => stateData.values.length;
  int get keyCityCount => cityData.values.length;

  List<String> get countryKeys => countryData.keys.toList();
  List<String> get stateKeys => stateData.keys.toList();
  List<String> get cityKeys => cityData.keys.toList();

  int valueCountryCount(int index) =>
      (countryData[countryData.keys.toList()[index]] ?? []).length;

  int valueStateCount(int index) =>
      (stateData[stateData.keys.toList()[index]] ?? []).length;

  int valueCityCount(int index) =>
      (cityData[cityData.keys.toList()[index]] ?? []).length;

  int index = 0;
  String countryName = "";
  String stateName = "";
  String cityName = "";

  CancelToken cancelToken = CancelToken();

  List<CountryEntity> originalCountryData = [];

  List<StateEntity> originalStateData = [];

  List<CityEntity> originalCityData = [];

  int loginType = LoginType.loginAndRegister.index;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is int) {
      loginType = Get.arguments as int;
    }
    // initLocalData();
  }

  toSex() {
    PageTools.toGender(loginType: loginType);
  }

  void initLocalData() async {
    AppLoading.show();
    List<CountryEntity> countryList = await LocationAPI.getLocalCountryList()
        .whenComplete(() => AppLoading.dismiss());
    originalCountryData = countryList;
    countryData = countryList.groupListsBy((e) => e.firstLetter ?? "");
    update();
  }

  @override
  void onReady() {
    super.onReady();
    // loadCountryList(isLoading: true, cancelToken: cancelToken);
    initLocalData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    cancelToken.cancel();
  }

  void loadCountryList({
    bool isLoading = false,
    CancelToken? cancelToken,
  }) async {
    if (isLoading) AppLoading.show();
    List<CountryEntity> countryList =
        await LocationAPI.getCountryList(cancelToken: cancelToken).whenComplete(
          () {
            AppLoading.dismiss();
          },
        );
    originalCountryData = countryList;
    countryData = countryList.groupListsBy((e) => e.firstLetter ?? "");
    update();
  }

  Future<void> loadStateList({
    required int countryId,
    CancelToken? cancelToken,
  }) async {
    AppLoading.show();
    List<StateEntity> states =
        await LocationAPI.getStateList(
          countryId: countryId,
          cancelToken: cancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    originalStateData = states;
    stateData = states.groupListsBy((e) => e.firstLetter ?? "");
  }

  Future<void> loadCityList({required int stateId}) async {
    AppLoading.show();
    List<CityEntity> cities =
        await LocationAPI.getCityList(
          stateId: stateId,
          cancelToken: cancelToken,
        ).whenComplete(() {
          AppLoading.dismiss();
        });
    originalCityData = cities;
    cityData = cities.groupListsBy((e) => e.firstLetter ?? "");
  }

  void selectCountry(
    CountryEntity country, {
    Function(String place, String latitude, String longitude)? onSelect,
  }) async {
    for (var element in countryData.values) {
      for (var element in element) {
        element.isSelected = false;
      }
    }
    countryName = country.name ?? "";
    country.isSelected = true;
    update();
    await loadStateList(countryId: country.id!, cancelToken: cancelToken);
    if (stateData.isNotEmpty) {
      index = 1;
      update();
    } else {
      String place = sprintf("%s", [countryName]).trim();
      onSelect?.call(
        place,
        country.latitude.toString(),
        country.longitude.toString(),
      );
    }
  }

  void selectState(
    StateEntity state, {
    Function(String place, String latitude, String longitude)? onSelect,
  }) async {
    for (var element in stateData.values) {
      for (var element in element) {
        element.isSelected = false;
      }
    }
    stateName = state.name ?? "";
    state.isSelected = true;
    update();
    await loadCityList(stateId: state.id!);
    if (cityData.isNotEmpty) {
      index = 2;
      update();
    } else {
      String place = sprintf("%s,%s", [countryName, stateName]).trim();
      onSelect?.call(
        place,
        state.latitude.toString(),
        state.longitude.toString(),
      );
    }
  }

  void selectCity(
    CityEntity city, {
    Function(String place, String latitude, String longitude)? onSelect,
  }) async {
    for (var element in cityData.values) {
      for (var element in element) {
        element.isSelected = false;
      }
    }
    city.isSelected = true;
    update();
    cityName = city.name ?? "";
    String place = sprintf("%s,%s,%s", [
      countryName,
      stateName,
      cityName,
    ]).trim();
    onSelect?.call(place, city.latitude.toString(), city.longitude.toString());
  }
}
