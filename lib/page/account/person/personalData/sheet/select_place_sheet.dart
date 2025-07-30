import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/login/guide/placeOfBirth/index.dart';
import 'package:astrea/page/login/guide/placeOfBirth/place/city_list_widget.dart';
import 'package:astrea/page/login/guide/placeOfBirth/place/country_list_widget.dart';
import 'package:astrea/page/login/guide/placeOfBirth/place/state_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showSelectPlaceSheet({
  Function(String place, String latitude, String longitude)? onSelect,
}) {
  Get.bottomSheet(
    SelectPlaceWidget(onSelect: onSelect),
    isScrollControlled: true,
  );
}

class SelectPlaceWidget extends StatelessWidget {
  final Function(String place, String latitude, String longitude)? onSelect;
  const SelectPlaceWidget({super.key, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: Get.height - 140,
        padding: EdgeInsetsDirectional.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFF5F5FD),
          borderRadius: BorderRadiusDirectional.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<PlaceOfBirthLogic>(
                init: PlaceOfBirthLogic(),
                builder: (logic) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          if (logic.index != 0)
                            InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                logic.index--;
                                logic.update();
                              },
                              child: Image.asset(
                                Assets.imageBackIcon,
                                matchTextDirection: true,
                                width: 40,
                                height: 40,
                              ),
                            )
                          else
                            SizedBox(width: 40, height: 40),
                          Expanded(
                            child: Container(
                              margin: EdgeInsetsDirectional.only(top: 5),
                              child: Text(
                                LanKey.placeOfBirth.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF323133),
                                  fontSize: 22,
                                  fontFamily: AppFonts.textFontFamily,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 40, height: 40),
                        ],
                      ),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
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
                            CountryListWidget(
                              logic: logic,
                              onSelect:
                                  (
                                    String place,
                                    String latitude,
                                    String longitude,
                                  ) {
                                    AccountService.to.updatePlaceBirth(
                                      place,
                                      latitude,
                                      longitude,
                                    );
                                    onSelect?.call(place, latitude, longitude);
                                  },
                            ),
                            StateListWidget(
                              logic: logic,
                              onSelect:
                                  (
                                    String place,
                                    String latitude,
                                    String longitude,
                                  ) {
                                    AccountService.to.updatePlaceBirth(
                                      place,
                                      latitude,
                                      longitude,
                                    );
                                    onSelect?.call(place, latitude, longitude);
                                  },
                            ),
                            CityListWidget(
                              logic: logic,
                              onSelect:
                                  (
                                    String place,
                                    String latitude,
                                    String longitude,
                                  ) {
                                    AccountService.to.updatePlaceBirth(
                                      place,
                                      latitude,
                                      longitude,
                                    );
                                    onSelect?.call(place, latitude, longitude);
                                  },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
