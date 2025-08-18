import 'package:astrea/core/setting/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showCommonDialog({
  String? title,
  TextStyle? titleStyle,
  String? content,
  TextStyle? contentStyle,
  String? leftButtonText,
  String? rightButtonText,
  Function? onLeftButtonCall,
  Function? onRightButtonCall,
  required String routeName,
}) {
  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            padding: EdgeInsetsDirectional.all(20),
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadiusDirectional.circular(20.r),
            ),
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsetsDirectional.only(bottom: 12.h),
                    child: Text(
                      title ?? "",
                      textAlign: TextAlign.center,
                      style:
                          titleStyle ??
                          TextStyle(
                            color: const Color(0xFF323133),
                            fontFamily: AppFonts.textFontFamily,
                            fontSize: 22.sp,
                          ),
                    ),
                  ),
                if (content != null)
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsetsDirectional.only(bottom: 24.h),
                    child: Text(
                      content ?? "",
                      textAlign: TextAlign.center,
                      style:
                          contentStyle ??
                          TextStyle(
                            color: const Color(0xFF6A676C),
                            fontFamily: AppFonts.textFontFamily,
                            fontSize: 18.sp,
                          ),
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (onLeftButtonCall == null) {
                            Get.back();
                          } else {
                            onLeftButtonCall.call();
                          }
                        },
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          height: 56.h,
                          child: Text(
                            leftButtonText ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontFamily: AppFonts.textFontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(width: 8, color: Colors.transparent),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (onRightButtonCall == null) {
                            Get.back();
                          } else {
                            onRightButtonCall.call();
                          }
                        },
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF766DF8),
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          height: 56,
                          child: Text(
                            rightButtonText ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppFonts.textFontFamily,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    routeSettings: RouteSettings(name: routeName),
  );
}
