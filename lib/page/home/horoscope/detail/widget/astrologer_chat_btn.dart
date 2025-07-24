import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/components/star_level.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';

class AstrologerChatBtn extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  const AstrologerChatBtn({super.key, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
        top: 14,
        bottom: 14,
      ),
      margin: margin ?? EdgeInsetsDirectional.only(top: 28),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      width: double.maxFinite,
      child: Row(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 8),
            width: 46,
            height: 46,
            decoration: ShapeDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage("https://randomfox.ca//images//88.jpg"),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Ethan',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 18,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 5),
                      child: StarLevel(level: "9.1"),
                    ),
                  ],
                ),
                Text(
                  '5 years of experience',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFF585FC4),
                    fontSize: 14.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 74,
            height: 30,
            margin: EdgeInsetsDirectional.only(start: 5),
            alignment: AlignmentDirectional.center,
            decoration: ShapeDecoration(
              color: const Color(0xFF585FC4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Text(
              LanKey.chat.tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
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
