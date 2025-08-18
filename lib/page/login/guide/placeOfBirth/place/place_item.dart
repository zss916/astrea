import 'package:astrea/core/setting/app_fonts.dart';
import 'package:flutter/material.dart';

class PlaceItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final String firstLetter;
  final String name;
  const PlaceItem({
    super.key,
    required this.index,
    required this.isSelected,
    required this.firstLetter,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 35),
      decoration: (isSelected == true)
          ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0x00ededfe),
                  Color(0xFFEDEDFE),
                  Color(0x00ededfe),
                ],
              ),
            )
          : BoxDecoration(),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
      alignment: AlignmentDirectional.center,
      width: double.maxFinite,
      child: Row(
        children: [
          if (index == 0)
            Text(
              firstLetter,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 18,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color((isSelected == true) ? 0xFF6F4DFF : 0xFF323133),
                  fontSize: (isSelected == true) ? 24 : 18,
                  fontFamily: (isSelected == true)
                      ? AppFonts.titleFontFamily
                      : AppFonts.textFontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
