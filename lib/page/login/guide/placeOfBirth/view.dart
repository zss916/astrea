part of 'index.dart';

class PlaceOfBirthPage extends StatelessWidget {
  const PlaceOfBirthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlaceOfBirthLogic>(
      init: PlaceOfBirthLogic(),
      builder: (logic) {
        return PopScope(
          /* canPop: false,
              onPopInvokedWithResult: (bool didPop, _) {
                if (logic.index == 0) {
                  Get.back();
                } else {
                  logic.index--;
                  logic.update();
                }
              },*/
          child: Scaffold(
            appBar: ComAppBar(
              back: () {
                if (logic.index == 0) {
                  Get.back();
                } else {
                  logic.index--;
                  logic.update();
                }
              },
            ),
            backgroundColor: AppColor.pageBackground,
            body: Column(
              children: [
                SizedBox(height: 20.h),
                StepIndicator(index: 3),
                SizedBox(height: 35.h),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
                  width: double.maxFinite,
                  child: Text(
                    LanKey.selectBirthLocation.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.textTitleColor,
                      fontSize: 28.sp,
                      fontFamily: AppFonts.titleFontFamily,
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: 16.h, bottom: 40.h),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      if (logic.index == 0)
                        Text(
                          LanKey.selectCountryOrRegion.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF91929D),
                            fontSize: 16.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      if (logic.index == 1)
                        Text(
                          LanKey.selectStateOrProvince.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF91929D),
                            fontSize: 16,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      if (logic.index == 2)
                        Text(
                          LanKey.selectCity.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF91929D),
                            fontSize: 16,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: IndexedStack(
                    index: logic.index,
                    children: [
                      CountryWidget(
                        az: logic.countryKeys,
                        logic: logic,
                        onSelect:
                            (String place, String latitude, String longitude) {
                              AccountService.to.updatePlaceBirth(
                                place,
                                latitude,
                                longitude,
                              );
                              logic.toSex();
                            },
                      ),
                      StatesWidget(
                        az: logic.stateKeys,
                        logic: logic,
                        onSelect:
                            (String place, String latitude, String longitude) {
                              AccountService.to.updatePlaceBirth(
                                place,
                                latitude,
                                longitude,
                              );
                              logic.toSex();
                            },
                      ),
                      CitiesWidget(
                        az: logic.cityKeys,
                        logic: logic,
                        onSelect:
                            (String place, String latitude, String longitude) {
                              AccountService.to.updatePlaceBirth(
                                place,
                                latitude,
                                longitude,
                              );
                              logic.toSex();
                            },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildNew(PlaceOfBirthLogic logic) => Expanded(
    child: IndexedStack(
      index: logic.index,
      children: [
        LocalCacheCountryWidget(
          logic: logic,
          onSelect: (String place, String latitude, String longitude) {
            AccountService.to.updatePlaceBirth(place, latitude, longitude);
            logic.toSex();
          },
        ),
        NetWorkStatesWidget(
          logic: logic,
          onSelect: (String place, String latitude, String longitude) {
            AccountService.to.updatePlaceBirth(place, latitude, longitude);
            logic.toSex();
          },
        ),
        NetWorkCitiesWidget(
          logic: logic,
          onSelect: (String place, String latitude, String longitude) {
            AccountService.to.updatePlaceBirth(place, latitude, longitude);
            logic.toSex();
          },
        ),
      ],
    ),
  );
}
