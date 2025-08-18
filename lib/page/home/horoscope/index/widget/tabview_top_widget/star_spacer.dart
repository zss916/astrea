import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarSpacer extends StatelessWidget {
  const StarSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                Assets.imageVector,
                width: 18,
                height: 18,
                matchTextDirection: true,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 9.h),
          child: Text(
            "",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF323133),
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
