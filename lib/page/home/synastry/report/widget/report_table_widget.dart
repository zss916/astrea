import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/net/bean/analysis_article_entity.dart';
import 'package:astrea/page/home/horoscope/detail/widget/blur_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReportTableWidget extends StatelessWidget {
  final String oneself;
  final String otherSide;
  final List<AnalysisArticleMeanings> data;
  const ReportTableWidget({
    super.key,
    required this.data,
    required this.oneself,
    required this.otherSide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsetsDirectional.only(top: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Color(0xFFD9D9D9)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 32,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.5),
                      ),
                      color: Color(0xFFEDEDFD),
                    ),
                    child: Text(
                      oneself,
                      // LanKey.oneself.tr,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 12.sp,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: double.maxFinite,
                  color: Color(0xFFD9D9D9),
                ),
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(color: Color(0xFFEDEDFD)),
                    width: double.maxFinite,
                    child: Text(
                      otherSide,
                      //LanKey.otherSide.tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 12.sp,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: double.maxFinite,
                  color: Color(0xFFD9D9D9),
                ),
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.5),
                      ),
                      color: Color(0xFFEDEDFD),
                    ),
                    width: double.maxFinite,
                    child: Text(
                      LanKey.summarize.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 12.sp,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            constraints: BoxConstraints(
              minHeight: (66 * data.length).toDouble(),
            ),
            // height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (_, i) => Container(
                width: double.maxFinite,
                constraints: BoxConstraints(minHeight: 66),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                  ),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.amber,
                              padding: EdgeInsetsDirectional.all(10),
                              width: double.maxFinite,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                data[i].showOneself,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF323133),
                                  fontSize: 12.sp,
                                  fontFamily: AppFonts.textFontFamily,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          /*Container(
                            width: 1,
                            height: 300,
                            color: Color(0xFF000000),
                          ),*/
                          Expanded(
                            child: Container(
                              padding: EdgeInsetsDirectional.all(10),
                              width: double.maxFinite,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                data[i].showOtherSide,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF323133),
                                  fontSize: 12.sp,
                                  fontFamily: AppFonts.textFontFamily,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          // Container(width: 1, height: 300, color: Color(0xFFD9D9D9)),
                          Expanded(
                            child: Container(
                              padding: EdgeInsetsDirectional.all(10),
                              width: double.maxFinite,
                              alignment: AlignmentDirectional.center,
                              child: BlurWidget(
                                isBlur: false,
                                sigma: 6,
                                radius: 3,
                                child: Text(
                                  data[i].meaning ?? "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color(0xFF323133),
                                    fontSize: 12.sp,
                                    fontFamily: AppFonts.textFontFamily,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    PositionedDirectional(
                      top: 0,
                      start: (Get.width - 64 - 4) / 3,
                      bottom: 0,
                      child: Container(width: 1, color: Color(0xFFD9D9D9)),
                    ),

                    PositionedDirectional(
                      top: 0,
                      end: (Get.width - 64 - 4) / 3,
                      bottom: 0,
                      child: Container(width: 1, color: Color(0xFFD9D9D9)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
