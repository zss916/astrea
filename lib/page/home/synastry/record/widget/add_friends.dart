import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/synastry/record/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddFriends extends StatelessWidget {
  final FileManagementLogic logic;
  const AddFriends({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        logic.toAddFile();
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: double.maxFinite,
            height: 84,
            margin: EdgeInsetsDirectional.only(
              start: 16.w,
              end: 16.w,
              top: 16.h,
              bottom: 0,
            ),
            child: SvgPicture.asset(
              Assets.svgAddFriend,
              matchTextDirection: true,
            ),
          ),
          Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
            width: double.maxFinite,
            height: 84,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 10.h, bottom: 5.h),
                  child: Image.asset(
                    Assets.imageFileAdd,
                    matchTextDirection: true,
                    width: 21.r,
                    height: 21.r,
                  ),
                ),
                Text(
                  LanKey.addFriends.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 18.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
