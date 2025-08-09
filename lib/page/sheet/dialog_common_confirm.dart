import 'package:astrea/components/common_btn.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showCommonConfirmDialog({
  String? title,
  TextStyle? titleStyle,
  String? content,
  Function? onConfirm,
  String? confirmText,
  TextStyle? contentStyle,
  Widget? nextWidget,
  bool barrierDismissible = true,
  required String routeName,
}) {
  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            padding: EdgeInsetsDirectional.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(20.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style:
                        titleStyle ??
                        TextStyle(
                          fontFamily: AppFonts.textFontFamily,
                          color: const Color(0xFF323133),
                          fontSize: 22.sp,
                        ),
                  ),
                if (title != null) SizedBox(height: 12.h),
                if (content != null)
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style:
                        contentStyle ??
                        TextStyle(
                          fontFamily: AppFonts.textFontFamily,
                          color: const Color(0xFF6A676C),
                          fontSize: 18.sp,
                        ),
                  ),
                SizedBox(height: 24.h),
                CommonBtn(
                  margin: EdgeInsetsDirectional.zero,
                  title: confirmText ?? LanKey.confirm.tr,
                  onTap: () {
                    Get.back();
                    onConfirm?.call();
                  },
                ),
                if (nextWidget != null) nextWidget,
              ],
            ),
          ),
        ],
      ),
    ),
    routeSettings: RouteSettings(name: routeName),
    barrierDismissible: barrierDismissible,
  );
}
