import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class AddFriends extends StatelessWidget {
  const AddFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageTools.toAddFile();
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: double.maxFinite,
            height: 84,
            margin: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 0,
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
                  margin: EdgeInsetsDirectional.only(bottom: 5),
                  child: Image.asset(
                    Assets.imageFileAdd,
                    matchTextDirection: true,
                    width: 21,
                    height: 21,
                  ),
                ),
                Text(
                  LanKey.addFriends.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 18,
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
