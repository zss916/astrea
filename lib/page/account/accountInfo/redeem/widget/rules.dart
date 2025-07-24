import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/translations/en.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 16.h),
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 8.h),
            width: double.maxFinite,
            child: Text(
              LanKey.rewardRules.tr,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: const Color(0xFF91929D),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 30.h),
            width: double.maxFinite,
            child: Text(
              LanKey.rewardRulesContent.tr,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: const Color(0xFF91929D),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
