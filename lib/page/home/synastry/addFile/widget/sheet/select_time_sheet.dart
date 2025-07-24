import 'package:awesome_datetime_picker/awesome_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:sprintf/sprintf.dart';

void showDatePickerSheet(Function(String, String, int, int) onChange) {
  String birth = '';
  String dateBirth = '';
  int hourBirth = 0;
  int minuteBirth = 0;
  Get.bottomSheet(
    Container(
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.all(16),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  LanKey.cancel.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF6A676C),
                    fontSize: 18,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onChange.call(birth, dateBirth, hourBirth, minuteBirth);
                  Get.back();
                },
                child: Text(
                  LanKey.finish.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF585FC4),
                    fontSize: 18,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          AwesomeDateTimePicker(
            isYmd: true,
            /*maxDateTime: AwesomeDateTime(
                  date: AwesomeDate(
                      year: DateTime.now().year,
                      month: DateTime.now().month,
                      day: DateTime.now().day),
                  time: AwesomeTime(
                      hour: DateTime.now().hour,
                      minute: DateTime.now().minute)),*/
            dateFormat: AwesomeDateFormat.yMd,
            timeFormat: AwesomeTimeFormat.hm,
            backgroundColor: Colors.transparent,
            fadeEffect: false,
            selectorColor: Colors.transparent,
            onChanged: (AwesomeDateTime time) {
              String amPm = AwesomeTimeUtils.getAmPm(time.time.hour);
              String m = AwesomeDateUtils.getMonthNames(
                LocaleType.en,
              )[(time.date.month - 1)];

              debugPrint(birth);
              dateBirth = sprintf("%s/%s/%s", [
                time.date.year,
                time.date.month,
                time.date.day,
              ]);
              if (time.date.year == DateTime.now().year &&
                  time.date.month == DateTime.now().month &&
                  time.date.day == DateTime.now().day) {
                hourBirth = DateTime.now().hour;
                minuteBirth = DateTime.now().minute;
                birth =
                    "$m ${time.date.day},${time.date.year}\n${DateTime.now().hour}:${DateTime.now().minute} ${AwesomeTimeUtils.getAmPm(DateTime.now().hour)}";
              } else {
                hourBirth = time.time.hour;
                minuteBirth = time.time.minute;
                birth =
                    "$m ${time.date.day},${time.date.year}\n${time.time.hour}:${time.time.minute} $amPm";
              }
            },
          ),
        ],
      ),
    ),
    settings: RouteSettings(name: APages.selectTimeSheet),
  );
}
