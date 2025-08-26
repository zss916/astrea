import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/home/account/noticeSetting/widget/notify_select_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showSelectTimeDialog({
  String? leftButtonText,
  String? rightButtonText,
  Function? onLeftButtonCall,
  Function? onRightButtonCall,
  int? selectIndex,
  required String routeName,
}) {
  int selectedIndex = 2;

  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            padding: EdgeInsetsDirectional.all(20),
            margin: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
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
                  margin: EdgeInsetsDirectional.only(bottom: 12.h),
                  child: Text(
                    LanKey.selectTime.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF323133),
                      fontFamily: AppFonts.textFontFamily,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                NotifySelectWidget(
                  selectIndex: selectIndex,
                  onNet: (index) {
                    selectedIndex = index;
                  },
                ),
                SizedBox(height: 32.h),
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
                            borderRadius: BorderRadius.circular(24),
                          ),
                          height: 56,
                          child: Text(
                            leftButtonText ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontFamily: AppFonts.textFontFamily,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(width: 8, color: Colors.transparent),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          AccountService.to.setNoticeSelectIndex(selectedIndex);
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
                            borderRadius: BorderRadius.circular(24),
                          ),
                          height: 56,
                          child: Text(
                            rightButtonText ?? "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppFonts.textFontFamily,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
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
