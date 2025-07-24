import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class Gender extends StatelessWidget {
  final bool isMale;
  const Gender({super.key, required this.isMale});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 12,
        end: 12,
        top: 6,
        bottom: 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 2),
            child: Image.asset(
              isMale ? Assets.imageMale : Assets.imageFemale,
              width: 16,
              height: 15,
              matchTextDirection: true,
            ),
          ),
          Text(
            isMale ? LanKey.male.tr : LanKey.female.tr,
            style: TextStyle(
              color: const Color(0xFF333333),
              fontSize: 16,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
