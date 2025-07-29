import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';

class ReportAvatar extends StatelessWidget {
  final Widget child;
  const ReportAvatar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 12, bottom: 3),
            child: Image.asset(
              Assets.imageSynastryAvatarBg,
              width: 134,
              height: 134,
              matchTextDirection: true,
            ),
          ),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                matchTextDirection: true,
                image: AssetImage(Assets.imageSynastryAvatarBg1),
              ),
            ),
            child: Container(
              margin: EdgeInsetsDirectional.all(4.5),
              decoration: BoxDecoration(
                color: AppColor.pageBackground,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsetsDirectional.all(5.5),
                decoration: BoxDecoration(
                  color: Color(0x1A000000),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
