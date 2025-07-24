import 'package:bubble_box/bubble_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class AddFriendTip extends StatefulWidget {
  final bool isShow;
  const AddFriendTip({super.key, required this.isShow});

  @override
  State<AddFriendTip> createState() => _AddFriendTipState();
}

class _AddFriendTipState extends State<AddFriendTip> {
  bool isShowTip = false;

  @override
  void initState() {
    super.initState();
    isShowTip = widget.isShow;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShowTip = false;
        });
      },
      child: isShowTip
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
                        fontSize: 12,
                        fontFamily: AppFonts.textFontFamily,
                      ),
                    ),
                    Image.asset(
                      Assets.imageClose,
                      matchTextDirection: true,
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
