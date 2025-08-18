import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/home/account/select_gender/select_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectSex extends StatelessWidget {
  final int sex;
  final Function(int) onNext;
  const SelectSex({super.key, required this.sex, required this.onNext});

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
              LanKey.gender.tr,
              style: TextStyle(
                color: AppColor.contentTitleColor,
                fontSize: 14.sp,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SelectGender(
            sex: sex,
            onNext: (sex) {
              onNext.call(sex);
            },
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
