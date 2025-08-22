import 'package:astrea/core/setting/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoroscopeListItem extends StatelessWidget {
  final String icon;

  final String title;

  final bool isSelected;

  const HoroscopeListItem({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 0, start: 10, end: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: 0),
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsetsDirectional.all(1.6),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: isSelected ? Color(0xFF9292CA) : Colors.transparent,
              ),
              // color: Color(0xFFEDEDFE),
              borderRadius: BorderRadiusDirectional.circular(50),
            ),
            width: 48,
            height: 48,
            child: Image.asset(
              icon,
              width: 48,
              height: 48,
              matchTextDirection: true,
            ),
          ),
          Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFF323133)
                  : const Color(0xFF91929D),
              fontSize: 12.sp,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
