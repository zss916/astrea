import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/login/guide/timeOfBirth/widget/dialog/dialog_time_of_birth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoNotKnow extends StatelessWidget {
  final Function(int, int) onSelect;
  const DoNotKnow({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
      width: double.maxFinite,
      child: GestureDetector(
        // borderRadius: BorderRadius.circular(20),
        onTap: () {
          showTimeOfBirthDialog(() {
            onSelect.call(12, 0);
          });
        },
        child: Container(
          padding: EdgeInsetsDirectional.all(16),
          child: Text(
            LanKey.doNotKnow.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.textFontFamily,
              color: const Color(0xFF323133),
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
