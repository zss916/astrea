import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astrea/net/bean/city_entity.dart';
import 'package:astrea/page/login/guide/placeOfBirth/index.dart';
import 'package:astrea/page/login/guide/placeOfBirth/place/place_item.dart';

class CityListWidget extends StatelessWidget {
  final PlaceOfBirthLogic logic;
  final Function(String place, String latitude, String longitude)? onSelect;
  const CityListWidget({super.key, required this.logic, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 80.h, top: 20.h),
      itemCount: logic.keyCityCount,
      itemBuilder: (_, index) => ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: logic.valueCityCount(index),
        itemBuilder: (_, i) {
          CityEntity city =
              (logic.cityData[logic.cityData.keys.toList()[index]] ?? [])[i];
          return InkWell(
            onTap: () {
              logic.selectCity(
                city,
                onSelect: (String place, String latitude, String longitude) {
                  onSelect?.call(place, latitude, longitude);
                },
              );
            },
            child: PlaceItem(
              index: i,
              isSelected: city.isSelected ?? false,
              firstLetter: city.firstLetter ?? "",
              name: city.name ?? "",
            ),
          );
        },
      ),
    );
  }
}
