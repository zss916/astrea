import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HoroscopeTitle extends StatelessWidget {
  const HoroscopeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
      margin: EdgeInsetsDirectional.only(bottom: 0, top: 4.h),
      child: Text(
        LanKey.horoscope.tr,
        style: TextStyle(
          color: AppColor.textTitleColor,
          fontSize: 24.sp,
          fontFamily: AppFonts.titleFontFamily,
        ),
      ),
    );
  }

  @Deprecated("delete")
  Widget buildAvatar() => GestureDetector(
    onTap: () {
      PageTools.toAccount();
    },
    child: Container(
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
        color: Colors.white,
        image: DecorationImage(image: NetworkImage(""), fit: BoxFit.cover),
        shape: OvalBorder(),
      ),
    ),
  );
}
