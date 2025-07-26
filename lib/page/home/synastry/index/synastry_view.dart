import 'package:astrea/components/bottom_stack_btn.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_common_setting.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/synastry/index/logic.dart';
import 'package:astrea/page/home/synastry/widget/synastry_bg.dart';
import 'package:astrea/page/home/synastry/widget/synastry_top.dart';
import 'package:astrea/page/home/synastry/widget/synsdtry_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SynastryView extends StatelessWidget {
  const SynastryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F1F5),
        surfaceTintColor: Color(0xFFF0F1F5),
        toolbarHeight: 0,
        leading: const SizedBox.shrink(),
        systemOverlayStyle: barStyle,
      ),
      // extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFFF0F1F5),
      body: GetBuilder<SynastryLogic>(
        init: SynastryLogic(),
        builder: (logic) {
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              SynastryBg(
                child: Column(
                  children: [
                    SynsdtryTitle(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SynastryTop(),
                            Stack(
                              alignment: AlignmentDirectional.topCenter,
                              children: [
                                Container(
                                  margin: EdgeInsetsDirectional.only(top: 5.h),
                                  child: Image.asset(
                                    Assets.imageSynastryLine,
                                    matchTextDirection: true,
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  margin: EdgeInsetsDirectional.only(
                                    start: 16,
                                    end: 16,
                                    top: 38,
                                  ),
                                  child: Row(
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'What does it mean for two people to merge star charts? ',
                                          style: TextStyle(
                                            color: const Color(0xFF323133),
                                            fontSize: 22,
                                            fontFamily: AppFonts.textFontFamily,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsetsDirectional.only(
                                          start: 10.w,
                                        ),
                                        child: Image.asset(
                                          Assets.imageSynastryCrystal,
                                          width: 82,
                                          height: 76,
                                          matchTextDirection: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsetsDirectional.only(
                                start: 16,
                                end: 16,
                                top: 18.h,
                              ),
                              child: Text(
                                'Usually refers to judging or analyzing the degree of compatibility or mutual influence between two people in terms of fortune through some means, commonly seen in the following situations',
                                style: TextStyle(
                                  color: const Color(0xFF6A676C),
                                  fontSize: 16,
                                  fontFamily: AppFonts.textFontFamily,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              width: double.maxFinite,
                              margin: EdgeInsetsDirectional.only(
                                start: 16,
                                end: 16,
                                top: 18.h,
                              ),
                              child: Text(
                                'In business or team collaboration, some people may also consider whether the participants\' fortunes match. For example, two partners can analyze their respective fortunes to see if both parties\' fortunes are beneficial for the progress of the project during the cooperation period. Match to determine whether the overall fortune is conducive to the success of cooperation.',
                                style: TextStyle(
                                  color: const Color(0xFF6A676C),
                                  fontSize: 16,
                                  fontFamily: AppFonts.textFontFamily,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(height: 250.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PositionedDirectional(
                bottom: 0,
                start: 0,
                end: 0,
                child: BottomStackBtn(
                  title: LanKey.toDisclose.tr,
                  margin: EdgeInsetsDirectional.only(bottom: 70.h),
                  padding: EdgeInsetsDirectional.only(bottom: 24.h, top: 70.h),
                  onTap: () {
                    PageTools.toStarReport();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
