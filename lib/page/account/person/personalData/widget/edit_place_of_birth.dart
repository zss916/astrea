import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/account/person/personalData/sheet/select_place_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditPlaceOfBirth extends StatelessWidget {
  final String? showPlace;
  final Function(String, String, String) onChange;
  final Function() onUnfocus;
  const EditPlaceOfBirth({
    super.key,
    this.showPlace,
    required this.onChange,
    required this.onUnfocus,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onUnfocus.call();
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
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              margin: EdgeInsetsDirectional.only(top: 16, bottom: 8),
              child: Text(
                LanKey.placeOfBirth.tr,
                style: TextStyle(
                  color: AppColor.contentTitleColor,
                  fontSize: 14.sp,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    showPlace ?? LanKey.enterPlaceOfBirth.tr,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Color(showPlace == null ? 0xFF91929D : 0xFF323133),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
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
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
