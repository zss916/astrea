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
                    LanKey.placeOfBirth.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF323133),
                      fontSize: 32,
                      fontFamily: AppFonts.textFontFamily,
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: 20.h, bottom: 40.h),
                  child: Text(
                    logic.index == 2
                        ? LanKey.selectCity.tr
                        : LanKey.selectCountryOrRegion.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF91929D),
                      fontSize: 16,
                      fontFamily: AppFonts.textFontFamily,
                    ),
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
                              PageTools.toGender();
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
                              PageTools.toGender();
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
                              PageTools.toGender();
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
}
