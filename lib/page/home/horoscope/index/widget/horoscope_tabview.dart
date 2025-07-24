import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/horoscope/detail/widget/astrologer_chat_btn.dart';
import 'package:astrea/page/home/horoscope/detail/widget/blur_widget.dart';

class HoroscopeTabview extends StatelessWidget {
  final int tabIndex;

  const HoroscopeTabview({super.key, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        margin: EdgeInsetsDirectional.only(
          start: 20,
          end: 20,
          top: 20,
          bottom: 100,
        ),
        padding: EdgeInsetsDirectional.only(top: 16, bottom: 10),
        width: double.maxFinite,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
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
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                if (tabIndex == 1) buildTop(),

                if (tabIndex == 1 || tabIndex == 2 || tabIndex == 3)
                  buildGuide(),

                ///today
                buildContent(),
              ],
            ),
            PositionedDirectional(
              start: 16,
              end: 16,
              bottom: 0,
              child: Image.asset(
                Assets.imageBottomTexture2,
                matchTextDirection: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContent() {
    return Container(
      margin: EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
        top: 0,
        bottom: 50,
      ),
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Today\'s Horoscope\nSummary',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: AppFonts.textFontFamily,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 10),
                child: Image.asset(
                  Assets.imageTodayImg,
                  matchTextDirection: true,
                  height: 72,
                  width: 72,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 20),
            width: double.maxFinite,
            child: Text(
              'In love, singles might meet someone special, and those in relationships can deepen their bond.\n\nAt work, new chances await, thanks to your strong communication.\n\nLibra, spanning from September 23 to October 23, symbolizes balance and harmony. Ruled by Venus, Libras are elegant, sociable, yet often indecisive, always seeking equilibrium.',
              style: TextStyle(
                color: const Color(0xFF6A676C),
                fontSize: 16,
                fontFamily: AppFonts.textFontFamily,
              ),
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
        ///love
        Container(
          // color: Colors.cyan,
          padding: EdgeInsetsDirectional.only(bottom: 12),
          margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Love',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 18,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 8),
                      //width: 80,
                      height: 6,
                      child: LinearProgressIndicator(
                        value: 0.4,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        backgroundColor: Color(0xFFF0F1F5),
                        valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 26.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Career',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 18,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 8),
                      //width: 80,
                      height: 6,
                      child: LinearProgressIndicator(
                        value: 0.4,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        backgroundColor: Color(0xFFF0F1F5),
                        valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 26.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Money',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 18,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 8),
                      //width: 80,
                      height: 6,
                      child: LinearProgressIndicator(
                        value: 0.4,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        backgroundColor: Color(0xFFF0F1F5),
                        valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        ///should
        Container(
          //color: Colors.black38,
          width: double.maxFinite,
          margin: EdgeInsetsDirectional.only(
            top: 12,
            start: 16,
            end: 16,
            bottom: 12,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsetsDirectional.only(end: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LanKey.should.tr,
                        style: TextStyle(
                          color: const Color(0xFF585FC4),
                          fontSize: 22,
                          fontFamily: AppFonts.textFontFamily,
                        ),
                      ),
                      Text(
                        'It\'s a good time to make travel plans, which may bring you pleasant experiences.',
                        style: TextStyle(
                          color: const Color(0xFF585FC4),
                          fontSize: 16,
                          fontFamily: AppFonts.textFontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                Assets.imageShouldRight,
                matchTextDirection: true,
                width: 86,
                height: 105,
              ),
            ],
          ),
        ),

        ///avoid
        Container(
          // color: Colors.black38,
          width: double.maxFinite,
          margin: EdgeInsetsDirectional.only(
            top: 12,
            start: 16,
            end: 16,
            bottom: 16.h,
          ),
          child: Row(
            children: [
              Image.asset(
                Assets.imageAvoidLeft,
                width: 84,
                height: 105,
                matchTextDirection: true,
              ),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  margin: EdgeInsetsDirectional.only(start: 25.w, end: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LanKey.avoid.tr,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 22,
                          fontFamily: AppFonts.textFontFamily,
                        ),
                      ),
                      Text(
                        'Refrain from being late for appointments, as it will leave a bad impression on others.',
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 16,
                          fontFamily: AppFonts.textFontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildGuide() {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 8.h),
          child: Image.asset(Assets.imageStarLine, matchTextDirection: true),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(
            start: 16,
            end: 16,
            top: 12.h,
            bottom: 12.h,
          ),
          child: Row(
            children: [
              Container(
                //color: Colors.black,
                margin: EdgeInsetsDirectional.only(end: 10),
                child: Image.asset(
                  Assets.imageGuideIcon,
                  width: 80,
                  height: 100,
                  matchTextDirection: true,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(bottom: 0.h),
                      width: double.maxFinite,
                      child: Text(
                        LanKey.fortuneGuide.tr,
                        style: TextStyle(
                          color: const Color(0xFF585FC4),
                          fontSize: 22,
                          fontFamily: AppFonts.textFontFamily,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        'Engage in social activities, such as carrying a crystal, facing north.',
                        style: TextStyle(
                          color: const Color(0xFF585FC4),
                          fontSize: 16,
                          fontFamily: AppFonts.textFontFamily,
                        ),
                      ),
                    ),
                  ],
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
    );
  }

  Widget old() => Stack(
    alignment: AlignmentDirectional.topCenter,
    children: [
      Column(
        children: [
          ///should
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                    child: Column(
                      children: [
                        Text(
                          LanKey.should.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 22.sp,
                            fontFamily: AppFonts.textFontFamily,
                          ),
                        ),
                        Container(
                          margin: EdgeInsetsDirectional.only(top: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDEDFE),
                          ),
                          child: Text(
                            'Eat more rice',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppFonts.textFontFamily,
                              color: const Color(0xFF585FC4),
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 0, end: 0),
                  height: 42,
                  width: 1,
                  color: Color(0xFFD9D9D9),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                    child: Column(
                      children: [
                        Text(
                          LanKey.avoid.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 22.sp,
                            fontFamily: AppFonts.textFontFamily,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Container(
                          margin: EdgeInsetsDirectional.only(top: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F1F5),
                          ),
                          child: Text(
                            'Sing loudly',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppFonts.textFontFamily,
                              color: const Color(0xFF91929D),
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///love
          Container(
            // color: Colors.cyan,
            padding: EdgeInsetsDirectional.only(bottom: 12),
            margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Love',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 18,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 8),
                        //width: 80,
                        height: 6,
                        child: LinearProgressIndicator(
                          value: 0.4,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          backgroundColor: Color(0xFFF0F1F5),
                          valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 26.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Career',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 18,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 8),
                        //width: 80,
                        height: 6,
                        child: LinearProgressIndicator(
                          value: 0.4,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          backgroundColor: Color(0xFFF0F1F5),
                          valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 26.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Money',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 18,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 8),
                        //width: 80,
                        height: 6,
                        child: LinearProgressIndicator(
                          value: 0.4,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          backgroundColor: Color(0xFFF0F1F5),
                          valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///try
          Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 12,
              bottom: 0,
            ),
            child: Text(
              'Try your first interpretation',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 18,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          ///chat
          AstrologerChatBtn(margin: EdgeInsetsDirectional.all(16)),
          /* Container(
                  padding: EdgeInsetsDirectional.only(
                      start: 16, end: 16, top: 14, bottom: 14),
                  margin: EdgeInsetsDirectional.all(16),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFAFAFA),
                      borderRadius: BorderRadiusDirectional.circular(16)),
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8),
                        width: 46,
                        height: 46,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage("https://placehold.co/66x66"),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Ethan',
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: const Color(0xFF323133),
                                  fontSize: 18,
                                  fontFamily: AppFonts.textFontFamily,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(start: 5),
                                child: StarLevel(level: "9.9"),
                              )
                            ],
                          ),
                          Text(
                            '5 years of experience',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: const Color(0xFF585FC4),
                              fontSize: 14.sp,
                              fontFamily: AppFonts.textFontFamily,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )),
                      Container(
                        width: 74,
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
                          'Chat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: AppFonts.textFontFamily,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),*/

          ///today
          Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 8,
              bottom: 14,
            ),
            child: Text(
              'Today\'s Horoscope Summary',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 18,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          ///text
          BlurWidget(
            isBlur: true,
            child: Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 16, end: 16),
              child: Text(
                'In love, singles might meet someone special, and those in relationships can deepen their bond.',
                style: TextStyle(
                  color: const Color(0xFF6A676C) /* Color2 */,
                  fontSize: 16,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          ///work
          BlurWidget(
            isBlur: true,
            child: Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 16, end: 16),
              child: Text(
                'At work, new chances await, thanks to your strong communication.',
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontSize: 16,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          ///card
          Container(
            padding: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 14,
              bottom: 14,
            ),
            margin: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 14,
              bottom: 14,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                matchTextDirection: true,
                image: AssetImage(Assets.imageReadInsightsBg),
              ),
              color: const Color(0xFFEDEDFE),
              borderRadius: BorderRadiusDirectional.circular(16),
            ),
            width: double.maxFinite,
            constraints: BoxConstraints(minHeight: 115),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 200),
                  child: Text(
                    'Find an astrologer for more advice on fortune',
                    style: TextStyle(
                      color: const Color(0xFF323133),
                      fontSize: 18,
                      fontFamily: AppFonts.textFontFamily,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 8),
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF585FC4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        'Read insights',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///Libra
          BlurWidget(
            isBlur: true,
            child: Container(
              width: double.infinity,
              margin: EdgeInsetsDirectional.only(start: 16, end: 16),
              child: Text(
                'Libra, spanning from September 23 to October 23, symbolizes balance and harmony. Ruled by Venus, Libras are elegant, sociable, yet often indecisive, always seeking equilibrium.',
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontSize: 16,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
      PositionedDirectional(
        start: 16,
        end: 16,
        bottom: 0,
        child: Image.asset(
          Assets.imageBottomTexture2,
          matchTextDirection: true,
        ),
      ),
    ],
  );
}
