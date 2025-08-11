import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/synastry/widget/synastry_add.dart';
import 'package:astrea/page/home/synastry/widget/synastry_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SynastryTop extends StatelessWidget {
  final String avatar;
  final String nickName;
  const SynastryTop({super.key, required this.avatar, required this.nickName});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xFFF0F1F5),
      margin: EdgeInsetsDirectional.only(top: 45.h),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SynastryAvatar(avatar: avatar),
              Container(
                width: 120,
                color: Colors.transparent,
                margin: EdgeInsetsDirectional.only(top: 10),
                child: Text(
                  nickName,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 18.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 0, bottom: 22),
            child: Image.asset(
              Assets.imageSynastryAvatarSpace,
              width: 49,
              height: 49,
              matchTextDirection: true,
            ),
          ),
          Column(
            children: [
              SynastryAdd(child: SizedBox.shrink()),
              Container(
                margin: EdgeInsetsDirectional.only(top: 10),
                child: Text(
                  LanKey.addFriends.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 18.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
