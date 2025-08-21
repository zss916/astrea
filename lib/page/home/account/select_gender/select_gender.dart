import 'package:astrea/components/custom_tag.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectGender extends StatefulWidget {
  int sex;
  final Function(int) onNext;
  SelectGender({super.key, required this.sex, required this.onNext});

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  // int selectSex = 2;
  // 0 - unknown, 1 - male, 2 - female, 3 - non-binary

  @override
  void initState() {
    super.initState();
    /*setState(() {
      selectSex = widget.sex;
    });*/
  }

  /*@override
  void didUpdateWidget(covariant SelectGender oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      selectSex = widget.sex;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.sex = 2;
              widget.onNext.call(widget.sex);
            });
          },
          child: CustomTag(
            margin: EdgeInsetsDirectional.zero,
            isSelected: widget.sex == 2,
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 12,
              vertical: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(end: 2),
                  child: Image.asset(
                    Assets.imageFemale,
                    width: 16,
                    height: 15,
                    matchTextDirection: true,
                  ),
                ),
                Text(
                  LanKey.female.tr,
                  style: TextStyle(
                    color: AppColor.textTitleColor,
                    fontSize: 16.sp,
                    fontFamily: (widget.sex == 2)
                        ? AppFonts.titleFontFamily
                        : AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.sex = 1;
              widget.onNext.call(widget.sex);
            });
          },
          child: CustomTag(
            margin: EdgeInsetsDirectional.zero,
            isSelected: widget.sex == 1,
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 12,
              vertical: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(end: 2),
                  child: Image.asset(
                    Assets.imageMale,
                    width: 16,
                    height: 15,
                    matchTextDirection: true,
                  ),
                ),
                Text(
                  LanKey.male.tr,
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 16.sp,
                    fontFamily: (widget.sex == 1)
                        ? AppFonts.titleFontFamily
                        : AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
