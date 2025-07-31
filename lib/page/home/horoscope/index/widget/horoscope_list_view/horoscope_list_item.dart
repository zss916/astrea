import 'package:astrea/core/setting/app_fonts.dart';
import 'package:flutter/material.dart';

class HoroscopeListItem extends StatelessWidget {
  final String icon;

  final String title;

  const HoroscopeListItem({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 0, start: 10, end: 10),
      child: Column(
        children: [
          Image.asset(icon, width: 48, height: 48, matchTextDirection: true),
          Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF91929D),
              fontSize: 12,
              fontFamily: AppFonts.textFontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
