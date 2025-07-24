import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlatformServiceFree extends StatelessWidget {
  const PlatformServiceFree({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 9,
                height: 9,
                margin: EdgeInsetsDirectional.only(end: 9.w),
                decoration: ShapeDecoration(
                  color: Colors.black.withValues(alpha: 0.60),
                  shape: OvalBorder(),
                ),
              ),
              Text(
                '0% ~ 20%',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.80),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Spacer(),
          Text(
            'Platform Service Fee',
            style: TextStyle(
              color: const Color(0xFF323133),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
