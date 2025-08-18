import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/horoscope/detail/widget/blur_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class KeywordsWidget extends StatelessWidget {
  final String luckyColor;
  final String luckyNumber;
  final String luckyGem;

  const KeywordsWidget({
    super.key,
    required this.luckyColor,
    required this.luckyNumber,
    required this.luckyGem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      //height: 100,
      constraints: BoxConstraints(minHeight: 100),
      margin: EdgeInsetsDirectional.only(start: 11.w, end: 11.w),
      padding: EdgeInsetsDirectional.all(16.r),
      decoration: DottedDecoration(
        shape: Shape.box,
        color: Color(0xFFD9D9D9),
        dash: [12, 8],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: buildItem(
              icon: Assets.imageLuckyColorIcon,
              title: LanKey.luckyColor.tr,
              value: luckyColor,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: buildItem(
              icon: Assets.imageLuckyGemIcon,
              title: LanKey.luckyGem.tr,
              value: luckyGem,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: buildItem(
              icon: Assets.imageLuckyNumberIcon,
              title: LanKey.luckyNumber.tr,
              value: luckyNumber,
            ),
          ),
        ],
      ),
    );
  }

  //
  //LanKey.luckyColor.tr
  //luckyColor
  Widget buildItem({
    required String icon,
    required String title,
    required String value,
  }) => Column(
    children: [
      Image.asset(icon, matchTextDirection: true, width: 28, height: 28),
      SizedBox(height: 8.h),
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: const Color(0xFF91929D), fontSize: 12.sp),
      ),
      SizedBox(height: 4.h),
      Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColor.textTitleColor,
          fontSize: 12.sp,
          fontFamily: AppFonts.subTitleFontFamily,
          fontWeight: FontWeight.w800,
        ),
      ),
    ],
  );

  Widget buildOld() => Column(
    children: [
      // buildKeywords(),
      Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 11.w),
        child: Column(
          spacing: 12.h,
          children: [
            buildItem2(title: LanKey.luckyColor.tr, value: luckyColor),
            buildItem2(title: LanKey.luckyNumber.tr, value: luckyNumber),
            buildItem2(title: LanKey.luckyGem.tr, value: luckyGem),
          ],
        ),
      ),
    ],
  );

  Widget buildItem2({required String title, required String value}) =>
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFFAFAFA),
          borderRadius: BorderRadiusDirectional.circular(12),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 5),
              child: Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF91929D),
                  fontSize: 18.sp,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
            ),
            Spacer(),
            Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 18.sp,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ],
        ),
      );

  @Deprecated("hide")
  Widget buildKeywords() => BlurWidget(
    isBlur: false,
    child: Container(
      margin: EdgeInsetsDirectional.symmetric(vertical: 17.h),
      width: double.maxFinite,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: LanKey.keywords.tr,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 18,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Health',
              style: TextStyle(
                color: const Color(0xFF585FC4),
                fontSize: 18,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  @Deprecated("delete")
  Widget buildOldWidget() => Row(
    children: [
      Expanded(
        child: Container(
          constraints: BoxConstraints(minHeight: 90, minWidth: 90),
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 5.w,
            vertical: 14,
          ),
          decoration: ShapeDecoration(
            color: const Color(0xFFFAFAFA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              /*BlurWidget(
                                  isBlur: false,
                                  sigma: 6,
                                  radius: 3,
                                  child: Image.asset(Assets.imageLuckyColor,
                                      matchTextDirection: true,
                                      width: 20,
                                      height: 20)),*/
              Container(
                height: 20,
                constraints: BoxConstraints(maxWidth: 80.w),
                child: BlurWidget(
                  isBlur: false,
                  sigma: 6,
                  radius: 3,
                  child: AutoSizeText(
                    luckyColor,
                    maxLines: 1,
                    maxFontSize: 18,
                    minFontSize: 18,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppFonts.textFontFamily,
                      color: const Color(0xFF323133),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Text(
                LanKey.luckyColor.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF91929D),
                  fontSize: 12,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 10.w),
      Expanded(
        child: Container(
          constraints: BoxConstraints(minHeight: 90, minWidth: 90),
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 5.w,
            vertical: 14,
          ),
          decoration: ShapeDecoration(
            color: const Color(0xFFFAFAFA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Container(
                height: 20,
                constraints: BoxConstraints(maxWidth: 80.w),
                child: BlurWidget(
                  isBlur: false,
                  sigma: 6,
                  radius: 3,
                  child: Text(
                    luckyNumber,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF323133),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Text(
                LanKey.luckyNumber.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF91929D),
                  fontSize: 12,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 10.w),
      Expanded(
        child: Container(
          constraints: BoxConstraints(minHeight: 90, minWidth: 90),
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 5.w,
            vertical: 14,
          ),
          decoration: ShapeDecoration(
            color: const Color(0xFFFAFAFA),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Container(
                height: 20,
                constraints: BoxConstraints(maxWidth: 80.w),
                child: BlurWidget(
                  isBlur: false,
                  sigma: 6,
                  radius: 3,
                  child: AutoSizeText(
                    luckyGem,
                    maxLines: 1,
                    maxFontSize: 16,
                    minFontSize: 16,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppFonts.textFontFamily,
                      color: const Color(0xFF323133),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Text(
                LanKey.luckyGem.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF91929D),
                  fontSize: 12,
                  fontFamily: AppFonts.textFontFamily,
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
