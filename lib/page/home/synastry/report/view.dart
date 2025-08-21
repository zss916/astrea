part of 'index.dart';

class StarReportPage extends StatelessWidget {
  const StarReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StarReportLogic>(
      init: StarReportLogic(),
      builder: (logic) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, _) {
            if (!didPop) {
              if (logic.viewState == Status.data.index) {
                logic.toBack();
              } else {
                Get.back(closeOverlays: true);
              }
            }
          },
          child: Scaffold(
            appBar: ComAppBar(
              leading: Container(
                margin: EdgeInsetsDirectional.only(start: 16),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        if (logic.viewState == Status.data.index) {
                          logic.toBack();
                        } else {
                          Get.back(closeOverlays: true);
                        }
                      },
                      child: Image.asset(
                        Assets.imageBackIcon,
                        matchTextDirection: true,
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ),
              title: LanKey.reportTitle.tr,
              actions: [
                if (logic.viewState == Status.data.index)
                  SaveAction(
                    isSave: (logic.isSave ?? false),
                    onTap: (value) {
                      logic.toCollection();
                    },
                  ),
              ],
            ),
            backgroundColor: AppColor.pageBackground,
            body: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: buildBody(logic.viewState, logic),
            ),
          ),
        );
      },
    );
  }

  Widget buildBody(int viewState, StarReportLogic logic) {
    return switch (viewState) {
      _ when viewState == Status.empty.index => buildEmpty(),
      _ when viewState == Status.data.index => buildContent(logic),
      _ => LoadingWidget(),
    };
  }

  Widget buildContent(StarReportLogic logic) => SingleChildScrollView(
    child: Column(
      children: [
        ReportTopWidget(
          userName: logic.userName ?? "",
          userAvatar: logic.userAvatar ?? "",
          otherName: logic.friendName ?? "",
          otherAvatar: logic.friendAvatar ?? "",
          relationship: logic.relationship ?? "",
        ),
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              padding: EdgeInsetsDirectional.all(16),
              margin: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(16.r),
              ),
              width: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 0.w,
                      end: 0.w,
                      top: 16.h,
                      bottom: 0.h,
                    ),
                    width: double.maxFinite,
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          CircularPercentWidget(
                            title: logic.title1 ?? "",
                            value: (logic.value1 ?? 0).toInt(),
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: AppFonts.subTitleFontFamily,
                            ),
                          ),

                          Expanded(child: StarSpacer()),

                          CircularPercentWidget(
                            title: logic.title2 ?? "",
                            value: (logic.value2 ?? 0).toInt(),
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: AppFonts.subTitleFontFamily,
                            ),
                          ),

                          Expanded(child: StarSpacer()),

                          CircularPercentWidget(
                            title: logic.title3 ?? "",
                            value: (logic.value3 ?? 0).toInt(),
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: AppFonts.subTitleFontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  if (logic.meanings.isNotEmpty)
                    ReportTableWidget(
                      oneself: logic.userName ?? '',
                      otherSide: logic.friendName ?? "",
                      data: logic.meanings,
                    ),

                  Container(
                    margin: EdgeInsetsDirectional.only(top: 15.h),
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            LanKey.holisticAnalysis.tr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColor.textTitleColor,
                              fontSize: 24.sp,
                              fontFamily: AppFonts.titleFontFamily,
                            ),
                          ),
                        ),

                        Image.asset(
                          Assets.imageHolisticAnalysisIcon,
                          width: 72,
                          height: 72,
                          matchTextDirection: true,
                        ),
                      ],
                    ),
                  ),

                  ContentWidget(
                    title: LanKey.keyContent.tr,
                    content: logic.summary,
                  ),

                  ContentWidget(
                    title: LanKey.threeMonthTrend.tr,
                    content: logic.trend3Months,
                  ),

                  ContentWidget(
                    title: LanKey.dailyAdvice.tr,
                    content: logic.dailyAdvice,
                  ),

                  ContentWidget(
                    title: LanKey.holisticAnalysis.tr,
                    content: logic.analysis,
                  ),

                  /*ReadMore(
                    'Your long text here...',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    minLines: 3,
                    readMoreText: 'Read more',
                    readLessText: 'Read less',
                    readMoreStyle: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    readMoreIconVisible: true,
                    readMoreIcon: Icons.keyboard_arrow_down,
                    readLessIcon: Icons.keyboard_arrow_up,
                    iconSize: 20,
                    alignCenter: false,
                  ),*/

                  ///todo
                  /*BlurWidget(
                    isBlur: false,
                    sigma: 6,
                    radius: 3,
                    child: Container(
                      margin: EdgeInsetsDirectional.only(top: 16.h),
                      width: double.maxFinite,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: LanKey.combinedResults.tr,
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 16.sp,
                                height: 1.62.h,
                                fontWeight: FontWeight.w400,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                            TextSpan(
                              text: logic.summary,
                              style: TextStyle(
                                color: const Color(0xFF585FC4),
                                fontSize: 16.sp,
                                height: 1.62.h,
                                fontWeight: FontWeight.w400,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),*/
                  /*BlurWidget(
                    isBlur: false,
                    sigma: 6,
                    radius: 3,
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsetsDirectional.only(
                        top: 8.h,
                        bottom: 20.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            logic.analysis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color(0xFF6A676C),
                              fontSize: 16.sp,
                              height: 1.62.h,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFonts.textFontFamily,
                            ),
                          ),

                          Divider(height: 10.h, color: Colors.transparent),
                          Text(
                            logic.dailyAdvice,
                            style: TextStyle(
                              color: const Color(0xFF6A676C),
                              fontSize: 16.sp,
                              height: 1.62.h,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFonts.textFontFamily,
                            ),
                          ),

                          Divider(height: 10.h, color: Colors.transparent),
                          Text(
                            logic.trend3Months,
                            style: TextStyle(
                              color: const Color(0xFF6A676C),
                              fontSize: 16.sp,
                              height: 1.62.h,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFonts.textFontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),*/
                  Image.asset(
                    Assets.imageReportBottomLine,
                    matchTextDirection: true,
                  ),
                ],
              ),
            ),
            /*     PositionedDirectional(
              end: 16,
              bottom: 100.h,
              child: Image.asset(
                Assets.imageReportBottomRight,
                width: 23,
                height: 46,
                matchTextDirection: true,
              ),
            ),*/
          ],
        ),
        Divider(height: 120.h, color: Colors.transparent),
      ],
    ),
  );

  Widget buildEmpty() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsetsDirectional.only(bottom: 24.h),
        child: Image.asset(
          Assets.imageLogEmpty,
          matchTextDirection: true,
          width: 88,
          height: 76,
        ),
      ),
    ],
  );

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

  Widget buildSaveAction() => SaveAction(
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
        routeName: APages.chartReportDialog,
      );
    },
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
    ),
  );

  Widget buildFreeUnlockingCard() => Container(
    margin: EdgeInsetsDirectional.only(top: 16.h),
    child: FreeUnlockingCard(),
  );
}
