import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/sheet/dialog_common_confirm.dart';
import 'package:flutter/material.dart';
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

void showAccountExistsDialog({Function? onEditEmail, Function? onLogin}) {
  showCommonConfirmDialog(
    title: "Account already exists",
    content:
        "This email is already linked to an account.\nPlease log in instead or use a different email.",
    confirmText: "Use a different email",
    onConfirm: () {
      onEditEmail?.call();
    },
    nextWidget: GestureDetector(
      onTap: () {
        onLogin?.call();
        /*Get.removeName(APages.interests);
        Get.removeName(APages.editName);
        Get.removeName(APages.gender);
        Get.removeName(APages.placeOfBirth);
        Get.removeName(APages.timeOfBirth);
        Get.removeName(APages.dateOfBirth);
        Get.removeName(APages.guide);
        Get.toNamed(APages.welcome);*/
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
              "Log in",
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
    routeName: APages.loginFailedDialog2,
  );
}
