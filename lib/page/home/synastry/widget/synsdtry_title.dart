import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class SynsdtryTitle extends StatelessWidget {
  const SynsdtryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      padding: EdgeInsetsDirectional.only(start: 20, end: 20),
      margin: EdgeInsetsDirectional.only(bottom: 12, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LanKey.synastry.tr,
            style: TextStyle(
              color: AppColor.textTitleColor,
              fontSize: 24,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              PageTools.toLogs();
            },
            child: Container(
              margin: EdgeInsetsDirectional.only(end: 0),
              child: Image.asset(
                Assets.imageRecord,
                width: 24,
                height: 24,
                matchTextDirection: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
