import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/components/bottom_stack_btn.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/translations/en.dart';

/// 打开会员弹窗
void showOpenVipSheet() {
  Get.bottomSheet(
    PopScope(
      canPop: false,
      child: BottomStackBtn(
        title: LanKey.openVip.tr,
        padding: EdgeInsetsDirectional.only(bottom: 24.h, top: 70.h),
        onTap: () {
          //todo
        },
      ),
    ),
    isDismissible: false,
    barrierColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    settings: RouteSettings(name: APages.openVipSheet),
  );
}

class OpenVipView extends StatelessWidget {
  const OpenVipView({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomStackBtn(
      title: LanKey.openVip.tr,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0x1AEDEDFE), Color(0xB3EDEDFE), Color(0xFFEDEDFE)],
      ),
      padding: EdgeInsetsDirectional.only(bottom: 100.h, top: 30.h),
      onTap: () {
        PageTools.toSubscribe();
      },
    );
  }
}
