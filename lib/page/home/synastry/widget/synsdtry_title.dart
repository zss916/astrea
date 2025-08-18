import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SynsdtryTitle extends StatelessWidget {
  const SynsdtryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
      margin: EdgeInsetsDirectional.only(bottom: 12.h, top: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LanKey.synastry.tr,
            style: TextStyle(
              color: AppColor.textTitleColor,
              fontSize: 24.sp,
              fontFamily: AppFonts.titleFontFamily,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              PageTools.toLogs();
            },
            child: Container(
              margin: EdgeInsetsDirectional.only(end: 0),
              child: Image.asset(
                Assets.imageRecord,
                width: 24.r,
                height: 24.r,
                matchTextDirection: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
