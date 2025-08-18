import 'package:astrea/core/setting/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeBtn extends StatelessWidget {
  final String title;
  final String icon;
  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final Function onTap;
  final SizedBox? iconSize;

  const WelcomeBtn({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.bgColor,
    this.textColor,
    this.margin,
    this.iconSize,
    this.iconColor,
    this.border,
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
        padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
        margin: margin ?? EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
        decoration: BoxDecoration(
          border: border ?? Border.all(width: 1, color: Colors.transparent),
          color: bgColor ?? Color(0xFF766DF8),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(20.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 0.w, bottom: 0),
              child: Image.asset(
                icon,
                color: iconColor,
                width: iconSize?.width ?? 20,
                height: iconSize?.height ?? 20,
                matchTextDirection: true,
              ),
            ),
            Spacer(),
            Container(
              color: Colors.transparent,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: textColor ?? Color(0xFFFFFFFF),
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
            ),
            Spacer(),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
