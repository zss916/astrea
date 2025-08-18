import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showLogoutDialog({required Function onConfirm}) {
  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            padding: EdgeInsetsDirectional.all(24),
            margin: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(20.r),
            ),
            child: Column(
              spacing: 12.h,
              mainAxisSize: MainAxisSize.min,
              children: [
                /* Text(
                  LanKey.signOutTitle.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.textFontFamily,
                  ),
                ),*/
                Text(
                  LanKey.signOutContent.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF6A676C),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.textFontFamily,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 12.h),
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 56,
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(
                                24,
                              ),
                              color: Color(0xFF766DF8),
                            ),
                            child: Text(
                              LanKey.notNow.tr,
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
                      VerticalDivider(width: 8, color: Colors.transparent),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                            onConfirm.call();
                          },
                          child: Container(
                            height: 56,
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(
                                24,
                              ),
                              color: Color(0xFFF2F2F2),
                            ),
                            child: Text(
                              LanKey.signOut.tr,
                              style: TextStyle(
                                color: Color(0xFF323133),
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
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    routeSettings: RouteSettings(name: APages.logoutDialog),
  );
}
