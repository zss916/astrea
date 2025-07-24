import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astrea/core/setting/app_fonts.dart';

class WelcomeBtn extends StatelessWidget {
  final String title;
  final String icon;
  final Color? bgColor;
  final Color? textColor;
  final EdgeInsetsGeometry? margin;
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
        height: 58,
        margin: margin ?? EdgeInsetsDirectional.only(start: 20, end: 20),
        decoration: BoxDecoration(
          color: bgColor ?? Color(0xFF766DF8),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 8.w, bottom: 0),
              child: Image.asset(
                icon,
                width: iconSize?.width ?? 20,
                height: iconSize?.height ?? 20,
                matchTextDirection: true,
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1,
                  color: textColor ?? Color(0xFFFFFFFF),
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
