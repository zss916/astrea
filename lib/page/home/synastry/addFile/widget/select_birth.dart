import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/core/utils/calculate.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/synastry/addFile/widget/sheet/select_time_sheet.dart';
import 'package:awesome_datetime_picker/awesome_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sprintf/sprintf.dart';

class SelectBirth extends StatefulWidget {
  final String birth;
  final AwesomeDateTime? initialDateTime;
  final Function(String, int, int) onNext;
  final Function() onUnfocus;
  const SelectBirth({
    super.key,
    this.initialDateTime,
    required this.onUnfocus,
    required this.birth,
    required this.onNext,
  });

  @override
  _SelectBirthState createState() => _SelectBirthState();
}

class _SelectBirthState extends State<SelectBirth> {
  String birth = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      birth = widget.birth;
    });
  }

  @override
  void didUpdateWidget(covariant SelectBirth oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      birth = widget.birth;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onUnfocus.call();
        showDatePickerSheet(widget.initialDateTime, (
          value,
          dateBirth,
          hourBirth,
          minuteBirth,
        ) {
          if (value.isNotEmpty) {
            setState(() {
              birth = value;
            });
            widget.onNext(dateBirth, hourBirth, minuteBirth);
          } else {
            if (widget.initialDateTime == null) {
              setState(() {
                String m = AwesomeDateUtils.getMonthNames(
                  LocaleType.en,
                )[(DateTime.now().month - 1)];
                birth =
                    "$m ${15},${DateTime.now().year - 25} ${DateTime.now().hour}:${DateTime.now().minute} ${AwesomeTimeUtils.getAmPm(DateTime.now().hour)}";
              });
              String dateBirth = sprintf("%s-%s-%s", [
                DateTime.now().year - 25,
                DateTime.now().month.formatted,
                15,
              ]);
              widget.onNext(
                dateBirth,
                DateTime.now().hour,
                DateTime.now().minute,
              );
            }
          }
        });
      },
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.only(end: 0, top: 16, bottom: 8),
            child: Text(
              LanKey.dateOfBirth.tr,
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
              Text(
                birth.isNotEmpty ? birth : LanKey.selectBirthTime.tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: (birth.isNotEmpty)
                      ? const Color(0xFF323133)
                      : const Color(0xFF91929D),
                  fontSize: 18.sp,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Image.asset(
                Assets.imageArrowEnd,
                width: 24,
                height: 24,
                matchTextDirection: true,
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
