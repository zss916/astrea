import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/horoscope/index/widget/tabview_top_widget/circular_percent_widget.dart';
import 'package:astrea/page/home/horoscope/index/widget/tabview_top_widget/star_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HoroscopeTabview extends StatelessWidget {
  final int tabIndex;
  final String content;
  final int? love;
  final int? career;
  final int? wealth;
  final String? guide;
  final String? should;
  final String? avoid;
  final String? loveContent;
  final String? careerContent;
  final String? wealthContent;
  const HoroscopeTabview({
    super.key,
    required this.tabIndex,
    required this.content,
    this.love,
    this.career,
    this.wealth,
    this.guide,
    this.should,
    this.avoid,
    this.loveContent,
    this.careerContent,
    this.wealthContent,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        margin: EdgeInsetsDirectional.only(
          start: 16.w,
          end: 16.w,
          top: 20.h,
          bottom: 100.h,
        ),
        padding: EdgeInsetsDirectional.only(top: 16.h, bottom: 10.h),
        width: double.maxFinite,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 20,
              offset: Offset(0, 12),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            if (tabIndex == 1) buildTop(),

            if (tabIndex == 1 || tabIndex == 2 || tabIndex == 3) buildGuide(),

            ///today
            buildContent(
              loveContent: loveContent,
              careerContent: careerContent,
              wealthContent: wealthContent,
              summary: content,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent({
    String? loveContent,
    String? careerContent,
    String? wealthContent,
    required String summary,
  }) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        start: 16.w,
        end: 16.w,
        top: 0,
        bottom: 22.h,
      ),
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                LanKey.horoscopeSummary.tr,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontFamily: AppFonts.titleFontFamily,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 2),
                child: Image.asset(
                  Assets.imageStarburst,
                  matchTextDirection: true,
                  height: 26,
                  width: 20,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 20.h),
            width: double.maxFinite,
            child: Column(
              spacing: 12.h,
              children: [
                if ((loveContent ?? "").isNotEmpty)
                  buildPersonalTitle(
                    title: LanKey.love.tr,
                    content: loveContent ?? "",
                  ),
                if ((careerContent ?? "").isNotEmpty)
                  buildPersonalTitle(
                    title: LanKey.career.tr,
                    content: careerContent ?? "",
                  ),
                if ((wealthContent ?? "").isNotEmpty)
                  buildPersonalTitle(
                    title: LanKey.wealth.tr,
                    content: wealthContent ?? "",
                  ),

                if ((content ?? "").isNotEmpty)
                  buildPersonalTitle(
                    title: LanKey.holistic.tr,
                    content: content ?? "",
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTop() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
          margin: EdgeInsetsDirectional.only(
            start: 16.w,
            end: 16.w,
            top: 16.h,
            bottom: 12.h,
          ),
          width: double.maxFinite,
          child: IntrinsicHeight(
            child: Row(
              children: [
                CircularPercentWidget(title: LanKey.love.tr, value: love ?? 0),

                Expanded(child: StarSpacer()),

                CircularPercentWidget(
                  title: LanKey.career.tr,
                  value: career ?? 0,
                ),

                Expanded(child: StarSpacer()),

                CircularPercentWidget(
                  title: LanKey.wealth.tr,
                  value: wealth ?? 0,
                ),
              ],
            ),
          ),
        ),

        ///love
        // TabviewTopWidget(love: love, career: career, wealth: wealth),

        ///should
        if ((should ?? "").isNotEmpty)
          Container(
            //color: Colors.black38,
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.only(
              top: 12.h,
              start: 16.w,
              end: 16.w,
              bottom: 12.h,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    margin: EdgeInsetsDirectional.only(end: 0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LanKey.should.tr,
                          style: TextStyle(
                            color: AppColor.textTitleColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: AppFonts.subTitleFontFamily,
                          ),
                        ),
                        Text(
                          should ?? "",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColor.contentTitleColor,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  //color: Colors.black,
                  margin: EdgeInsetsDirectional.only(start: 10.w),
                  child: Image.asset(
                    Assets.imageShouldRight,
                    width: 57,
                    height: 57,
                    matchTextDirection: true,
                  ),
                ),
              ],
            ),
          ),

        ///avoid
        if ((avoid ?? "").isNotEmpty)
          Container(
            // color: Colors.black38,
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.only(
              top: 12.h,
              start: 16.w,
              end: 16.w,
              bottom: 12.h,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    margin: EdgeInsetsDirectional.only(end: 0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LanKey.avoid.tr,
                          style: TextStyle(
                            color: AppColor.textTitleColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: AppFonts.subTitleFontFamily,
                          ),
                        ),
                        Text(
                          avoid ?? "",
                          style: TextStyle(
                            color: AppColor.contentTitleColor,
                            fontSize: 14.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  //color: Colors.black,
                  margin: EdgeInsetsDirectional.only(start: 10.w),
                  child: Image.asset(
                    Assets.imageAvoidLeft,
                    width: 57,
                    height: 57,
                    matchTextDirection: true,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget buildGuide() {
    return (guide ?? "").isNotEmpty
        ? Column(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(
                  start: 16.w,
                  end: 16.w,
                  top: 12.h,
                  bottom: 12.h,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.only(bottom: 0.h),
                            width: double.maxFinite,
                            child: Text(
                              LanKey.fortuneGuide.tr,
                              style: TextStyle(
                                color: AppColor.textTitleColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: AppFonts.subTitleFontFamily,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              guide ?? "",
                              style: TextStyle(
                                color: AppColor.contentTitleColor,
                                fontSize: 14.sp,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.black,
                      margin: EdgeInsetsDirectional.only(start: 10.w),
                      child: Image.asset(
                        Assets.imageGuideIcon,
                        width: 57,
                        height: 57,
                        matchTextDirection: true,
                      ),
                    ),
                  ],
                ),
              ),

              ///line
              Container(
                margin: EdgeInsetsDirectional.only(
                  start: 16,
                  end: 16,
                  top: 8,
                  bottom: 18,
                ),
                child: Image.asset(
                  Assets.imageHoroscopeVector,
                  matchTextDirection: true,
                ),
              ),
            ],
          )
        : SizedBox.shrink();
  }

  Widget buildPersonalTitle({required String title, required String content}) =>
      Container(
        margin: EdgeInsetsDirectional.only(top: 0),
        width: double.maxFinite,
        child: Text.rich(
          // maxLines: 3,
          // overflow: TextOverflow.ellipsis,
          TextSpan(
            children: [
              TextSpan(
                text: title,
                style: TextStyle(
                  color: AppColor.textTitleColor,
                  fontSize: 18.sp,
                  fontFamily: AppFonts.subTitleFontFamily,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(
                text: "\n",
                style: TextStyle(
                  color: AppColor.textTitleColor,
                  fontSize: 18.sp,
                  fontFamily: AppFonts.subTitleFontFamily,
                ),
              ),
              TextSpan(
                text: content,
                style: TextStyle(
                  color: AppColor.contentTitleColor,
                  fontSize: 14.sp,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
            ],
          ),
        ),
      );
}
