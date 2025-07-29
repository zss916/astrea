import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/page/home/synastry/report/widget/report_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportTopWidget extends StatelessWidget {
  final String userName;
  final String otherName;
  final String userAvatar;
  final String otherAvatar;
  const ReportTopWidget({
    super.key,
    required this.userName,
    required this.userAvatar,
    required this.otherName,
    required this.otherAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(
            top: 30.h,
            start: 10,
            end: 10,
            bottom: 8.h,
          ),
          width: 220,
          height: 132,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              PositionedDirectional(
                start: 0,
                child: ReportAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(userAvatar),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              PositionedDirectional(
                end: 0,
                child: ReportAvatar(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(otherAvatar),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 20.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  //color: Colors.amberAccent,
                  child: Text(
                    userName,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: const Color(0xFF323133),
                      fontSize: 18,
                      fontFamily: AppFonts.textFontFamily,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              VerticalDivider(width: 25.w, color: Colors.transparent),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  // color: Colors.blueAccent,
                  child: Text(
                    otherName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: const Color(0xFF323133),
                      fontFamily: AppFonts.textFontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
