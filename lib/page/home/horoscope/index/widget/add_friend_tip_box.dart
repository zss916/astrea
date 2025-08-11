import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/horoscope/index/logic.dart';
import 'package:bubble_box/bubble_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddFriendTip extends StatelessWidget {
  final HoroscopeLogic logic;
  const AddFriendTip({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        logic.isAddFriend = true;
        logic.update();
      },
      child: (!logic.isAddFriend)
          ? UnconstrainedBox(
              child: BubbleBox(
                shape: BubbleShapeBorder(
                  direction: BubbleDirection.bottom,
                  position: BubblePosition.start(20.w),
                  arrowQuadraticBezierLength: 0,
                  radius: BorderRadius.circular(4.r),
                ),
                backgroundColor: Color(0xFF585FC4),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.only(
                  left: 8.w,
                  right: 5.w,
                  top: 2.h,
                  bottom: 2.h,
                ),
                child: Row(
                  children: [
                    Text(
                      LanKey.addFriendTip.tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: AppFonts.textFontFamily,
                      ),
                    ),
                    Image.asset(
                      Assets.imageClose,
                      matchTextDirection: true,
                      width: 20.r,
                      height: 20.r,
                    ),
                  ],
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
