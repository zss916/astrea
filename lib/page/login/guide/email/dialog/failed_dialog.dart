import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/sheet/dialog_common_confirm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showFailedTipDialog() {
  showCommonConfirmDialog(
    content: LanKey.loginFailedTip.tr,
    confirmText: LanKey.createNewAccountNow.tr,
    onConfirm: () {
      Get.back();
      Get.toNamed(APages.guide);
    },
    nextWidget: GestureDetector(
      onTap: () {
        Get.back();
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
                color: const Color(0xFF91929D) /* icon-h */,
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
