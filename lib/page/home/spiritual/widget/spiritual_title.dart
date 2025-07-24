import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class SpiritualTitle extends StatelessWidget {
  const SpiritualTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      padding: EdgeInsetsDirectional.only(start: 20, end: 20),
      margin: EdgeInsetsDirectional.only(bottom: 12, top: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LanKey.spiritual.tr,
            style: TextStyle(
              color: AppColor.textTitleColor,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              PageTools.toMyCollection();
            },
            child: Image.asset(
              Assets.imageCollect,
              width: 30,
              height: 30,
              matchTextDirection: true,
            ),
          ),
        ],
      ),
    );
  }
}
