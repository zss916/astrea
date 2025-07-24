import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class FreeUnlockingCard extends StatelessWidget {
  const FreeUnlockingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      width: double.maxFinite,
      constraints: BoxConstraints(minHeight: 98),
      //height: 98,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            margin: EdgeInsetsDirectional.all(16),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(end: 8),
                  width: 66,
                  height: 66,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      matchTextDirection: true,
                      image: AssetImage(Assets.imageVortex),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          LanKey.freeUnlocking.tr,
                          textAlign: TextAlign.start,
                          // maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 18,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ),
                      Text(
                        LanKey.freeUnlockingContent.tr,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xFF6A676C),
                          fontSize: 12,
                          fontFamily: AppFonts.textFontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 62,
                  height: 30,
                  margin: EdgeInsetsDirectional.only(start: 5),
                  alignment: AlignmentDirectional.center,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF585FC4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text(
                    LanKey.ask.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: AppFonts.textFontFamily,
                    ),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            end: 0,
            child: Image.asset(
              Assets.imageHomeTarotBg,
              width: 55,
              height: 48,
              matchTextDirection: true,
            ),
          ),
        ],
      ),
    );
  }
}
