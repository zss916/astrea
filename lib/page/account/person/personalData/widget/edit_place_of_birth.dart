import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/account/person/personalData/sheet/select_place_sheet.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPlaceOfBirth extends StatelessWidget {
  final String? showPlace;
  final Function(String, String, String) onChange;
  const EditPlaceOfBirth({super.key, this.showPlace, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSelectPlaceSheet(
          onSelect: (String place, String latitude, String longitude) {
            String showPlace = place
                .split("/")
                .where((e) => e.isNotEmpty)
                .toList()
                .join(",");
            //String showPlace = place.replaceAll("/", ",");
            onChange.call(showPlace, latitude, longitude);
            Get.back();
          },
        );
      },
      child: SizedBox(
        height: 72,
        width: double.maxFinite,
        child: Row(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 10),
              child: Text(
                LanKey.placeOfBirth.tr,
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontSize: 18,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: AutoSizeText(
                      showPlace ?? LanKey.enterPlaceOfBirth.tr,
                      maxLines: 2,
                      textAlign: TextAlign.right,
                      maxFontSize: 18,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(
                          showPlace == null ? 0xFF91929D : 0xFF323133,
                        ),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.textFontFamily,
                      ),
                    ),
                  ),
                  Image.asset(
                    Assets.imageArrowEnd,
                    width: 24,
                    height: 24,
                    matchTextDirection: true,
                  ),
                  /*Container(
                          margin:
                              EdgeInsetsDirectional.symmetric(horizontal: 8),
                          width: 1,
                          height: 22,
                          decoration:
                              BoxDecoration(color: const Color(0xFFD9D9D9)),
                        ),
                        Image.asset(
                          Assets.imageLocationEditIcon,
                          matchTextDirection: true,
                          height: 26,
                          width: 50,
                        )*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
