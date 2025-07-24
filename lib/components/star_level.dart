import 'package:flutter/material.dart';
import 'package:astrea/core/setting/app_fonts.dart';

class StarLevel extends StatelessWidget {
  final String? level;
  const StarLevel({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 47, minHeight: 15),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF585FC4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 2),
            child: Icon(Icons.star, size: 12, color: Colors.white),
          ),
          Text(
            level ?? "--",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: AppFonts.rateFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
