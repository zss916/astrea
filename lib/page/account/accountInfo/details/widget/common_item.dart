import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astrea/core/setting/app_fonts.dart';

class CommonItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;
  const CommonItem({
    super.key,
    required this.title,
    required this.subTitle,
    this.padding,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 56),
      width: double.maxFinite,
      padding: padding ?? EdgeInsetsDirectional.all(16),
      child: Row(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 20.w),
            child: Text(
              title,
              style: TextStyle(
                color: const Color(0xFF6A676C),
                fontSize: 16,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Text(
              subTitle,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: textColor ?? const Color(0xFF323133),
                fontSize: 16,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
