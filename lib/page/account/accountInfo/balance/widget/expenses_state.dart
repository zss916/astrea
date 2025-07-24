import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';

class ExpensesState extends StatelessWidget {
  final int? state;
  const ExpensesState({super.key, this.state});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        if (state == 1)
          Text(
            LanKey.success.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF0BA819),
              fontSize: 14,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        if (state == 2)
          Text(
            LanKey.failure.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFFF2200),
              fontSize: 14,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        if (state == 3)
          Text(
            LanKey.processing.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFFFCA0C),
              fontSize: 14,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
      ],
    );
  }
}
