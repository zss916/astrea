import 'dart:math';

import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/synastry/report/widget/report_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportTopWidget extends StatelessWidget {
  final String userName;
  final String otherName;
  final String userAvatar;
  final String otherAvatar;
  final String relationship;
  const ReportTopWidget({
    super.key,
    required this.userName,
    required this.userAvatar,
    required this.otherName,
    required this.otherAvatar,
    required this.relationship,
  });

  @override
  Widget build(BuildContext context) {
    // debugPrint('userAvatar:$userAvatar,otherAvatar:$otherAvatar');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              //color: Colors.blue,
              padding: EdgeInsetsDirectional.only(top: 30.h),
              margin: EdgeInsetsDirectional.only(
                top: 0.h,
                start: 10,
                end: 10,
                bottom: 8.h,
              ),
              width: 220 + 60,
              height: 132 + 0,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  PositionedDirectional(
                    start: 30,
                    child: ReportAvatar(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.imageDefaultAvatar),
                            fit: BoxFit.cover,
                          ),
                        ),
                        foregroundDecoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(userAvatar),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    end: 30,
                    child: ReportAvatar(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(Assets.imageFriendDefaultIcon),
                            fit: BoxFit.cover,
                          ),
                        ),
                        foregroundDecoration: BoxDecoration(
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
            if (relationship.isNotEmpty)
              PositionedDirectional(
                top: 12,
                start: 110 + 67,
                child: Transform.rotate(
                  angle: -(pi / 14) * 1,
                  child: UnconstrainedBox(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 8.w,
                        vertical: 3,
                      ),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF585FC4),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 3,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: const Color(0xFFF0F1F5),
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        relationship,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFF0F1F5),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
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
                      fontSize: 18.sp,
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
                      fontSize: 18.sp,
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
