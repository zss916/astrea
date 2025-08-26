import 'package:astrea/components/common_btn.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showTimeOfBirthDialog(Function onConfirm) {
  Get.dialog(
    TimeOfBirthTip(onConfirm: onConfirm),
    routeSettings: RouteSettings(name: APages.timeOfBirthTipDialog),
  );
}

class TimeOfBirthTip extends StatelessWidget {
  final Function onConfirm;
  const TimeOfBirthTip({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            padding: EdgeInsetsDirectional.all(24.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(20.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LanKey.doNotKnowTime.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFonts.textFontFamily,
                    color: const Color(0xFF323133),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  LanKey.doNotKnowTimeContent.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFonts.textFontFamily,
                    color: const Color(0xFF6A676C),
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 24.h),
                CommonBtn(
                  margin: EdgeInsetsDirectional.zero,
                  title: LanKey.gotIt.tr,
                  onTap: () {
                    // AccountService.to.updateUserBirthHAndM(12, 0);
                    Get.back();
                    onConfirm.call();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
