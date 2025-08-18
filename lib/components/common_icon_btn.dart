import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonIconBtn extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final Color? textColor;
  final EdgeInsetsGeometry? margin;
  final Function onTap;
  final bool? isClickable;
  final String? icon;

  const CommonIconBtn({
    super.key,
    required this.title,
    required this.onTap,
    this.bgColor,
    this.textColor,
    this.margin,
    this.isClickable,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        width: double.maxFinite,
        height: 58.h,
        foregroundDecoration: isClickable == false
            ? BoxDecoration(
                color: Color(0x80FFFFFF),
                borderRadius: BorderRadiusDirectional.all(
                  Radius.circular(20.r),
                ),
              )
            : BoxDecoration(),
        margin: margin ?? EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
        decoration: BoxDecoration(
          color: bgColor ?? Color(0xFF766DF8),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(20.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 10.w),
              child: Image.asset(
                Assets.imageStarW,
                width: 24,
                height: 24,
                matchTextDirection: true,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.textFontFamily,
                fontSize: 18.sp,
                color: textColor ?? Color(0xFFFFFFFF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
