import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/translations/en.dart';

void showPasswordDialog() {
  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            padding: EdgeInsetsDirectional.all(20),
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsetsDirectional.only(bottom: 24.h),
                  child: Text(
                    'You have not set a payment password yet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF323133),
                      fontSize: 22,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          height: 56,
                          child: Text(
                            LanKey.cancel.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontSize: 18,
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
                          PageTools.toSetPassword();
                        },
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF766DF8),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          height: 56,
                          child: Text(
                            "Set up",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
    routeSettings: RouteSettings(name: APages.passwordDialog),
  );
}
