import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectInterests extends StatelessWidget {
  final String? interests;
  const SelectInterests({super.key, this.interests});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.only(top: 16, bottom: 8),
            child: Text(
              LanKey.selectInterestsTitle.tr,
              style: TextStyle(
                color: const Color(0xFF6A676C),
                fontSize: 14.sp,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  interests ?? LanKey.selectInterestsTitle.tr,
                  style: TextStyle(
                    color: interests == null
                        ? const Color(0xFF91929D)
                        : Color(0xFF323133),
                    fontSize: 18.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Image.asset(
                Assets.imageArrowEnd,
                width: 24,
                height: 24,
                matchTextDirection: true,
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
