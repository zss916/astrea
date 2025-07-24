import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astrea/net/bean/country_entity.dart';
import 'package:astrea/page/login/guide/placeOfBirth/index.dart';
import 'package:astrea/page/login/guide/placeOfBirth/place/place_item.dart';

class CountryListWidget extends StatelessWidget {
  final PlaceOfBirthLogic logic;
  final Function(String place, String latitude, String longitude)? onSelect;
  const CountryListWidget({super.key, required this.logic, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 80.h, top: 20.h),
      itemCount: logic.keyCountryCount,
      itemBuilder: (_, index) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: logic.valueCountryCount(index),
        itemBuilder: (_, i) {
          CountryEntity country =
              (logic.countryData[logic.countryData.keys.toList()[index]] ??
              [])[i];
          return InkWell(
            onTap: () {
              logic.selectCountry(
                country,
                onSelect: (String place, String latitude, String longitude) {
                  onSelect?.call(place, latitude, longitude);
                },
              );
            },
            child: PlaceItem(
              index: i,
              isSelected: country.isSelected ?? false,
              firstLetter: country.firstLetter ?? "",
              name: country.name ?? "",
            ),
          );
        },
      ),
    );
  }
}
