import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoticeWidget extends StatelessWidget {
  final String title;
  const NoticeWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        margin: EdgeInsetsDirectional.only(top: 20.h),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: Color(0xFFEDEDFE),
            borderRadius: BorderRadiusDirectional.circular(0)),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.80),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
