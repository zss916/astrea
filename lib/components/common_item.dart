import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonItem extends StatelessWidget {
  final String title;
  final Widget? subWidget;
  final Function? onTap;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  const CommonItem({
    super.key,
    required this.title,
    this.subWidget,
    this.textColor,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          constraints: const BoxConstraints(minHeight: 56),
          width: double.maxFinite,
          padding: padding ?? EdgeInsetsDirectional.all(16),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsetsDirectional.only(end: 8.w),
                  width: double.maxFinite,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor ?? const Color(0xFF323133),
                      fontSize: 16.sp,
                      fontFamily: AppFonts.textFontFamily,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              subWidget ?? SizedBox.shrink(),
              Container(
                margin: EdgeInsetsDirectional.only(start: 4.w),
                child: Image.asset(
                  Assets.imageArrowEnd,
                  width: 24.r,
                  height: 24.r,
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
