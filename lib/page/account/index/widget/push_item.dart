import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PushItem extends StatelessWidget {
  final Function onTap;
  const PushItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          onTap.call();
        },
        child: Container(
          margin: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 0),
          constraints: const BoxConstraints(minHeight: 56),
          width: double.maxFinite,
          height: 72,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsetsDirectional.all(16),
          child: Row(
            children: [
              Text(
                LanKey.selectThePushTime.tr,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 18.sp,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsetsDirectional.only(start: 4.w),
                child: Image.asset(
                  Assets.imageArrowEnd,
                  width: 24,
                  height: 24,
                  matchTextDirection: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
