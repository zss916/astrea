import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/core/utils/calculate.dart';
import 'package:astrea/generated/assets.dart';
import 'package:awesome_datetime_picker/awesome_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprintf/sprintf.dart';

void showDatePickerSheet(
  AwesomeDateTime? initialDateTime,
  Function(String, String, int, int) onChange,
) {
  String birth = '';
  String dateBirth = '';
  int hourBirth = 0;
  int minuteBirth = 0;
  bool isShowBirth = true;
  Get.bottomSheet(
    Container(
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.only(
        start: 16.w,
        end: 16.w,
        top: 10.h,
        bottom: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      if (isShowBirth) {
                        onChange.call(birth, dateBirth, hourBirth, minuteBirth);
                        Get.back();
                      } else {
                        AppLoading.toast("Please choose a new date of birth");
                      }
                    },
                    child: Text(
                      LanKey.finish.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF585FC4),
                        fontSize: 18.sp,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 0,
                        vertical: 0,
                      ),
                      child: Image.asset(
                        Assets.imageCloseDialog,
                        width: 30.r,
                        height: 30.r,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AwesomeDateTimePicker(
            isYmd: true,
            initialDateTime: initialDateTime,
            /* initialDateTime: AwesomeDateTime(
              date: AwesomeDate(
                year: 1900,
                month: 1,
                day: 1,
              ),
              time: AwesomeTime(
                hour: 0,
                minute: 0,
              )
            ),*/
            maxDateTime: AwesomeDateTime(
              date: AwesomeDate(
                year: DateTime.now().year,
                month: DateTime.now().month,
                day: DateTime.now().day,
              ),
              time: AwesomeTime(
                hour: 23,
                minute: 59,
                //hour: DateTime.now().hour,
                //minute: DateTime.now().minute,
              ),
            ),
            dateFormat: AwesomeDateFormat.yMd,
            // timeFormat: AwesomeTimeFormat.hm,
            timeFormat: AwesomeTimeFormat.Hm,
            backgroundColor: Colors.transparent,
            fadeEffect: false,
            selectorColor: Colors.transparent,
            onChanged: (AwesomeDateTime time) {
              String amPm = AwesomeTimeUtils.getAmPm(time.time.hour);
              String m = AwesomeDateUtils.getMonthNames(
                LocaleType.en,
              )[(time.date.month - 1)];

              debugPrint(birth);
              dateBirth = sprintf("%s-%s-%s", [
                time.date.year,
                time.date.month.formatted,
                time.date.day.formatted,
              ]);

              if (time.date.year == DateTime.now().year &&
                  time.date.month == DateTime.now().month &&
                  time.date.day == DateTime.now().day) {
                // hourBirth = DateTime.now().hour;
                // minuteBirth = DateTime.now().minute;
                hourBirth = time.time.hour;
                minuteBirth = time.time.minute;
                isShowBirth =
                    (hourBirth <= DateTime.now().hour) &&
                    (minuteBirth <= DateTime.now().minute);
                // birth = "$m ${time.date.day},${time.date.year} ${DateTime.now().hour}:${DateTime.now().minute} ${AwesomeTimeUtils.getAmPm(DateTime.now().hour)}";
              } else {
                isShowBirth = true;
              }

              hourBirth = time.time.hour;
              minuteBirth = time.time.minute;
              birth =
                  "$m ${time.date.day},${time.date.year} ${time.time.hour}:${time.time.minute} $amPm";
            },
          ),
        ],
      ),
    ),
    settings: RouteSettings(name: APages.selectTimeSheet),
  );
}
