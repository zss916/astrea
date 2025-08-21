import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/page/home/horoscope/detail/widget/blur_widget.dart';
import 'package:astrea/page/home/synastry/report/widget/readmore/readmore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentWidget extends StatelessWidget {
  final String title;
  final String content;
  const ContentWidget({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 24.h),
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColor.textTitleColor,
                fontSize: 18.sp,
                fontFamily: AppFonts.subTitleFontFamily,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          BlurWidget(
            isBlur: false,
            sigma: 6,
            radius: 3,
            child: Container(
              width: double.maxFinite,
              margin: EdgeInsetsDirectional.only(top: 4.h),
              child: Column(
                children: [
                  ReadMore(
                    content,
                    style: TextStyle(
                      color: AppColor.contentTitleColor,
                      fontSize: 14.sp,
                      //height: 1.62.h,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.textFontFamily,
                    ),
                    minLines: 3,
                    readMoreText: 'Read More',
                    readLessText: "",
                    readMoreStyle: TextStyle(
                      color: AppColor.contentTitleColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppFonts.textFontFamily,
                    ),
                    readMoreIconVisible: true,
                    iconSize: 20,
                    alignCenter: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
