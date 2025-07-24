import 'package:flutter/material.dart';
import 'package:astrea/core/setting/app_fonts.dart';

class CommonBtn extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final Color? textColor;
  final EdgeInsetsGeometry? margin;
  final Function onTap;
  final bool? isClickable;

  const CommonBtn({
    super.key,
    required this.title,
    required this.onTap,
    this.bgColor,
    this.textColor,
    this.margin,
    this.isClickable,
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
        foregroundDecoration: isClickable == false
            ? BoxDecoration(
                color: Color(0x80FFFFFF),
                borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
              )
            : BoxDecoration(),
        margin: margin ?? EdgeInsetsDirectional.only(start: 20, end: 20),
        decoration: BoxDecoration(
          color: bgColor ?? Color(0xFF766DF8),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: AppFonts.textFontFamily,
            fontSize: 18,
            color: textColor ?? Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
