import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class TelephoneTerm extends StatefulWidget {
  const TelephoneTerm({super.key});

  @override
  State<TelephoneTerm> createState() => _TelephoneTermState();
}

class _TelephoneTermState extends State<TelephoneTerm> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 6.h, bottom: 6.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 8, top: 5),
              child: Image.asset(
                isChecked ? Assets.imageRadioS : Assets.imageRadioU,
                matchTextDirection: true,
                width: 12,
                height: 12,
              ),
            ),
            Expanded(
              child: Text(
                LanKey.telephoneTerm.tr,
                style: TextStyle(
                  color: const Color(0xFF91929D),
                  fontSize: 14,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
