import 'package:astrea/core/permission/app_permission_tools.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/account/index/widget/notice_switch.dart';
import 'package:astrea/page/sheet/dialog_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class NoticeItem extends StatefulWidget {
  const NoticeItem({super.key});

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<NoticeItem> {
  bool isSwitchOn = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isSwitchOn = AccountService.to.switchNotification;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          if (isSwitchOn) {
            showCommonDialog(
              title: LanKey.areYouSure.tr,
              content: LanKey.noticeCloseTip.tr,
              leftButtonText: LanKey.yes.tr,
              rightButtonText: LanKey.notNow.tr,
              onLeftButtonCall: () {
                Get.back();
                setState(() {
                  isSwitchOn = false;
                  AccountService.to.setNotify(isSwitchOn);
                });
              },
              routeName: APages.noticeCloseDialog,
            );
          } else {
            AppPermissionTools.checkNotification(
              onGranted: () {
                setState(() {
                  isSwitchOn = true;
                  AccountService.to.setNotify(isSwitchOn);
                });
              },
              onToNext: () {
                showCommonDialog(
                  content: LanKey.noticeTip.tr,
                  leftButtonText: LanKey.yes.tr,
                  rightButtonText: LanKey.notNow.tr,
                  onLeftButtonCall: () {
                    Get.back();
                    openAppSettings();
                    /*setState(() {
                      isSwitchOn = !isSwitchOn;
                    });*/
                  },
                  routeName: APages.noticeTipDialog,
                );
              },
            );
          }
        },
        child: Container(
          margin: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 16),
          constraints: const BoxConstraints(minHeight: 56),
          height: 72,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsetsDirectional.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  LanKey.dailyStars.tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 18.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              NoticeSwitch(isSwitchOn: isSwitchOn),
            ],
          ),
        ),
      ),
    );
  }
}
