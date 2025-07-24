import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/account/index/widget/account_avatar.dart';

class AccountTop extends StatelessWidget {
  final bool isUser;
  const AccountTop({super.key, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsetsDirectional.only(bottom: 8),
      constraints: BoxConstraints(minHeight: 154.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          AccountAvatar(),
          Container(
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 10.h,
              bottom: 20.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'CC',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (!isUser)
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 3),
                    child: Image.asset(
                      Assets.imageAuthIcon,
                      width: 14,
                      height: 14,
                      matchTextDirection: true,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
