import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/sheet/dialog_common_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeleteBtn extends StatelessWidget {
  final Function onTap;
  const DeleteBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 20.w, end: 20.w, top: 0),
      alignment: AlignmentDirectional.center,
      width: double.maxFinite,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          showCommonConfirmDialog(
            title: LanKey.deleteAccountTitle.tr,
            content: LanKey.deleteAccountContent.tr,
            confirmText: LanKey.notNow.tr,
            titleStyle: TextStyle(
              fontFamily: AppFonts.textFontFamily,
              color: const Color(0xFF323133),
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
            ),
            contentStyle: TextStyle(
              fontFamily: AppFonts.textFontFamily,
              color: const Color(0xFF6A676C),
              fontSize: 16.sp,
              height: 1.38,
            ),
            nextWidget: GestureDetector(
              onTap: () {
                onTap.call();
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 6.h),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  LanKey.deleteAccount.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF91929D),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.textFontFamily,
                  ),
                ),
              ),
            ),
            routeName: APages.deleteAccountDialog,
          );
        },
        child: Container(
          alignment: AlignmentDirectional.center,
          width: double.maxFinite,
          height: 58,
          child: Text(
            LanKey.deleteAccount.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF91929D),
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.textFontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
