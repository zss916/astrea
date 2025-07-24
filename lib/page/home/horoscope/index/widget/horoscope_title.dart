import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';

class HoroscopeTitle extends StatelessWidget {
  const HoroscopeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      padding: EdgeInsetsDirectional.only(start: 20, end: 20),
      margin: EdgeInsetsDirectional.only(bottom: 0, top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // color: Colors.black,
            child: Text(
              LanKey.horoscope.tr,
              style: TextStyle(
                color: AppColor.textTitleColor,
                fontSize: 24,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ),
          /*GestureDetector(
            onTap: () {
              PageTools.toAccount();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(""),
                  fit: BoxFit.cover,
                ),
                shape: OvalBorder(),
              ),
            ),
          )*/
        ],
      ),
    );
  }
}
