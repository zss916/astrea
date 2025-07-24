part of 'index.dart';

class StarReportPage extends StatelessWidget {
  const StarReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          leading: Container(
            margin: EdgeInsetsDirectional.only(start: 16),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => Get.back(),
                  child: Image.asset(
                    Assets.imageBackIcon,
                    matchTextDirection: true,
                    width: 40,
                    height: 40,
                  ),
                )
              ],
            ),
          ),
          title: LanKey.reportTitle.tr,
          actions: [
            SaveAction(
              isSave: true,
              onTap: (value) {
                showCommonDialog(
                    content: LanKey.saveTip.tr,
                    contentStyle: TextStyle(
                      color: const Color(0xFF6A676C),
                      fontSize: 17,
                      fontFamily: AppFonts.textFontFamily,
                    ),
                    leftButtonText: LanKey.cancel.tr,
                    rightButtonText: LanKey.save.tr,
                    onRightButtonCall: () {
                      Get.back(closeOverlays: true);
                    },
                    routeName: APages.chartReportDialog);
              },
            )
          ],
        ),
        backgroundColor: AppColor.pageBackground,
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(
                          top: 30.h, start: 10, end: 10, bottom: 8.h),
                      width: 220,
                      height: 132,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          PositionedDirectional(
                              start: 0,
                              child: ReportAvatar(
                                child: SizedBox(),
                              )),
                          PositionedDirectional(
                              end: 0,
                              child: ReportAvatar(
                                child: SizedBox(),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                          start: 16, end: 16, bottom: 20.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                            LanKey.oneself.tr,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontSize: 18,
                              fontFamily: AppFonts.textFontFamily,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                          VerticalDivider(
                            width: 25.w,
                            color: Colors.transparent,
                          ),
                          Expanded(
                              child: Text(
                            'Sophia',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontFamily: AppFonts.textFontFamily,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ))
                        ],
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Container(
                          padding: EdgeInsetsDirectional.all(16),
                          margin:
                              EdgeInsetsDirectional.only(start: 16, end: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadiusDirectional.circular(16)),
                          width: double.maxFinite,
                          child: Column(
                            children: [
                              Text(
                                LanKey.starChartDisplay.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF323133),
                                  fontSize: 20,
                                  fontFamily: AppFonts.textFontFamily,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Image.asset(
                                Assets.imageReportLine,
                                width: 200,
                                matchTextDirection: true,
                              ),
                              Container(
                                // color: Colors.cyan,
                                margin: EdgeInsetsDirectional.only(
                                    top: 32.h, start: 4, end: 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          LanKey.soulIndex.tr,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: const Color(0xFF323133),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsetsDirectional.only(
                                              top: 8.h, bottom: 8.h),
                                          //width: 80,
                                          height: 6,
                                          child: LinearProgressIndicator(
                                            value: 0.4,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            backgroundColor: Color(0xFFF0F1F5),
                                            valueColor: AlwaysStoppedAnimation(
                                                Color(0xFF585FC4)),
                                          ),
                                        ),
                                        Text(
                                          '89',
                                          style: TextStyle(
                                            color: const Color(0xFF585FC4),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    )),
                                    SizedBox(
                                      width: 24.w,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          LanKey.emotionIndex.tr,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: const Color(0xFF323133),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsetsDirectional.only(
                                              top: 8.h, bottom: 8.h),
                                          //width: 80,
                                          height: 6,
                                          child: LinearProgressIndicator(
                                            value: 0.4,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            backgroundColor: Color(0xFFF0F1F5),
                                            valueColor: AlwaysStoppedAnimation(
                                                Color(0xFF585FC4)),
                                          ),
                                        ),
                                        Text(
                                          '89',
                                          style: TextStyle(
                                            color: const Color(0xFF585FC4),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    )),
                                    SizedBox(
                                      width: 24.w,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          LanKey.attractionIndex.tr,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: const Color(0xFF323133),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsetsDirectional.only(
                                              top: 8.h, bottom: 8.h),
                                          //width: 80,
                                          height: 6,
                                          child: LinearProgressIndicator(
                                            value: 0.4,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            backgroundColor: Color(0xFFF0F1F5),
                                            valueColor: AlwaysStoppedAnimation(
                                                Color(0xFF585FC4)),
                                          ),
                                        ),
                                        Text(
                                          '89',
                                          style: TextStyle(
                                            color: const Color(0xFF585FC4),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                              /* Container(
                                margin: EdgeInsetsDirectional.only(top: 16.h),
                                child: FreeUnlockingCard(),
                              ),*/
                              Container(
                                width: double.maxFinite,
                                clipBehavior: Clip.hardEdge,
                                margin: EdgeInsetsDirectional.only(top: 14.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 1, color: Color(0xFFD9D9D9)),
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
                                            alignment:
                                                AlignmentDirectional.center,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15.5)),
                                                color: Color(0xFFEDEDFD)),
                                            child: Text(
                                              'Oneself',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: const Color(0xFF323133),
                                                fontSize: 12,
                                                fontFamily:
                                                    AppFonts.textFontFamily,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          )),
                                          Container(
                                            width: 1,
                                            color: Color(0xFFD9D9D9),
                                          ),
                                          Expanded(
                                              child: Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFEDEDFD)),
                                            width: double.maxFinite,
                                            child: Text(
                                              'Other side',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: const Color(0xFF323133),
                                                fontSize: 12,
                                                fontFamily:
                                                    AppFonts.textFontFamily,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          )),
                                          Container(
                                            width: 1,
                                            color: Color(0xFFD9D9D9),
                                          ),
                                          Expanded(
                                              child: Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15.5)),
                                                color: Color(0xFFEDEDFD)),
                                            width: double.maxFinite,
                                            child: Text(
                                              'Summarize',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: const Color(0xFF323133),
                                                fontSize: 12,
                                                fontFamily:
                                                    AppFonts.textFontFamily,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width: double.maxFinite,
                                        height: 66 * 5,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: 5,
                                            itemBuilder: (_, i) => Container(
                                                  width: double.maxFinite,
                                                  height: 66,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          top: BorderSide(
                                                              width: 1,
                                                              color: Color(
                                                                  0xFFD9D9D9)))),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          child: Container(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .all(2),
                                                        width: double.maxFinite,
                                                        alignment:
                                                            AlignmentDirectional
                                                                .center,
                                                        child: Text(
                                                          'Moon in Sagittarius 5th House',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: const Color(
                                                                0xFF323133),
                                                            fontSize: 12,
                                                            fontFamily: AppFonts
                                                                .textFontFamily,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      )),
                                                      Container(
                                                        width: 1,
                                                        color:
                                                            Color(0xFFD9D9D9),
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .all(2),
                                                        width: double.maxFinite,
                                                        alignment:
                                                            AlignmentDirectional
                                                                .center,
                                                        child: Text(
                                                          'Moon in Sagittarius 5th House',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: const Color(
                                                                0xFF323133),
                                                            fontSize: 12,
                                                            fontFamily: AppFonts
                                                                .textFontFamily,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      )),
                                                      Container(
                                                        width: 1,
                                                        color:
                                                            Color(0xFFD9D9D9),
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .all(2),
                                                        width: double.maxFinite,
                                                        alignment:
                                                            AlignmentDirectional
                                                                .center,
                                                        child: BlurWidget(
                                                            isBlur: false,
                                                            sigma: 6,
                                                            radius: 3,
                                                            child: Text(
                                                              'Moon in Sagittarius 5th House',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                color: const Color(
                                                                    0xFF323133),
                                                                fontSize: 12,
                                                                fontFamily: AppFonts
                                                                    .textFontFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            )),
                                                      )),
                                                    ],
                                                  ),
                                                ))),
                                  ],
                                ),
                              ),
                              BlurWidget(
                                  isBlur: false,
                                  sigma: 6,
                                  radius: 3,
                                  child: Container(
                                    margin:
                                        EdgeInsetsDirectional.only(top: 16.h),
                                    width: double.maxFinite,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Combined results：',
                                            style: TextStyle(
                                              color: const Color(0xFF323133),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily:
                                                  AppFonts.textFontFamily,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Conjunction',
                                            style: TextStyle(
                                              color: const Color(0xFF585FC4),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              fontFamily:
                                                  AppFonts.textFontFamily,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                              BlurWidget(
                                  isBlur: false,
                                  sigma: 6,
                                  radius: 3,
                                  child: Container(
                                    width: double.maxFinite,
                                    margin: EdgeInsetsDirectional.only(
                                        top: 8.h, bottom: 20.h),
                                    child: Text(
                                      'When Cancer seeks emotional support due to anxiety, Taurus may use "problem solving instead of comforting" to cause Cancer to feel emotionally neglected.',
                                      style: TextStyle(
                                        color: const Color(0xFF6A676C),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: AppFonts.textFontFamily,
                                      ),
                                    ),
                                  )),
                              Image.asset(
                                Assets.imageReportBottomLine,
                                matchTextDirection: true,
                              )
                            ],
                          ),
                        ),
                        PositionedDirectional(
                            end: 16,
                            bottom: 100,
                            child: Image.asset(
                              Assets.imageReportBottomRight,
                              width: 23,
                              height: 46,
                              matchTextDirection: true,
                            ))
                      ],
                    ),
                    Divider(height: 120.h, color: Colors.transparent)
                  ],
                ),
              ),
              //bottom()
            ],
          ),
        ));
  }

  Widget saveAction() => Container(
        margin: const EdgeInsetsDirectional.only(end: 24),
        child: GestureDetector(
          onTap: () {
            showShareSheet();
          },
          child: Image.asset(
            Assets.imageShare,
            matchTextDirection: true,
            width: 24,
            height: 24,
          ),
        ),
      );

  Widget bottom() => PositionedDirectional(
      bottom: 0,
      start: 0,
      end: 0,
      child: BottomStack(
        padding: EdgeInsetsDirectional.only(bottom: 24.h, top: 70.h),
        onTap: () {
          //todo
        },
      ));
}
