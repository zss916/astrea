import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';

class LogItem extends StatelessWidget {
  const LogItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.all(5),
      constraints: BoxConstraints(minHeight: 120),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadiusDirectional.circular(100),
                ),
                width: 58,
                height: 58,
              ),
              Text(
                'ThornLullaby‌',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Assets.imageSynastryAvatarSpace,
                width: 30,
                height: 30,
                matchTextDirection: true,
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 12),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 12,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFEDEDFE),
                ),
                child: Text(
                  'Lover',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF585FC4),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadiusDirectional.circular(100),
                ),
                width: 58,
                height: 58,
              ),
              Text(
                'ThornLullaby‌',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
