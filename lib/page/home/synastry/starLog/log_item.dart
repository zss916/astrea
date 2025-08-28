import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/net/bean/analysis_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogItem extends StatelessWidget {
  final AnalysisEntity item;
  const LogItem({super.key, required this.item});

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
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(Assets.imageFriendDefaultIcon),
                  ),
                  borderRadius: BorderRadiusDirectional.circular(100),
                ),
                foregroundDecoration: BoxDecoration(
                  //color: Color(0x0d000000),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(item.firstFriendInfo?.headImg ?? ""),
                  ),
                  borderRadius: BorderRadiusDirectional.circular(100),
                ),
                width: 58,
                height: 58,
              ),
              SizedBox(
                width: 60,
                child: Text(
                  item.firstFriendInfo?.nickName ?? "",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16.sp,
                    fontFamily: AppFonts.textFontFamily,
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
              Image.asset(
                Assets.imageSynastryAvatarSpace,
                width: 30,
                height: 30,
                matchTextDirection: true,
              ),
              Container(
                constraints: BoxConstraints(minHeight: 23, minWidth: 52),
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
                  item.relationship ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF585FC4),
                    fontSize: 14.sp,
                    fontFamily: AppFonts.textFontFamily,
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
                  color: Color(0x1A000000),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(Assets.imageFriendDefaultIcon),
                  ),
                  borderRadius: BorderRadiusDirectional.circular(100),
                ),
                foregroundDecoration: BoxDecoration(
                  color: Color(0x1A000000),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(item.secondFriendInfo?.headImg ?? ""),
                  ),
                  borderRadius: BorderRadiusDirectional.circular(100),
                ),
                width: 58,
                height: 58,
              ),
              SizedBox(
                width: 60,
                child: Text(
                  item.secondFriendInfo?.nickName ?? "",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16.sp,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
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
