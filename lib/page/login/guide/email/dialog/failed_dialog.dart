import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/sheet/dialog_common_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showAccountLostDialog({Function? onLogin, Function? onEditEmail}) {
  showCommonConfirmDialog(
    title: LanKey.loginFailedTitle.tr,
    content: LanKey.loginFailedTip.tr,
    confirmText: LanKey.createNewAccountNow.tr,
    onConfirm: () {
      onLogin?.call();
      /*Get.removeName(APages.email);
      Get.removeName(APages.welcome);
      Get.toNamed(APages.guide);*/
    },
    nextWidget: GestureDetector(
      onTap: () {
        onEditEmail?.call();
      },
      child: Container(
        width: double.infinity,
        height: 56,
        margin: EdgeInsets.only(top: 6),
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Text(
              LanKey.logInWithAnotherAccount.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF91929D),
                fontSize: 18,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ],
        ),
      ),
    ),
    routeName: APages.loginFailedDialog,
  );
}

void showAccountExistsDialog({
  Function? onLoginAndUpdate,
  Function? onOnlyLogin,
}) {
  showCommonConfirmDialog(
    title: null,
    content: LanKey.accountAlreadyExistsTip.tr,
    confirmText: LanKey.logInAndUpdate.tr,
    onConfirm: () {
      onLoginAndUpdate?.call();
    },
    nextWidget: Container(
      margin: EdgeInsets.only(top: 12.h),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: () {
            onOnlyLogin?.call();
          },
          child: Container(
            width: double.infinity,
            height: 56.h,
            alignment: AlignmentDirectional.center,
            // padding: const EdgeInsets.all(16),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            child: Text(
              LanKey.logInOnly.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF766DF8),
                fontSize: 18.sp,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ),
        ),
      ),
    ),
    routeName: APages.loginFailedDialog2,
    barrierDismissible: false,
  );
}
