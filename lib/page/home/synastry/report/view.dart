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
          child: Scaffold(
            appBar: ComAppBar(
              leading: Container(
                margin: EdgeInsetsDirectional.only(start: 16),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () => logic.toBack(),
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
        ),
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              padding: EdgeInsetsDirectional.all(16),
              margin: EdgeInsetsDirectional.only(start: 16, end: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(16),
              ),
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
                      top: 32.h,
                      start: 4,
                      end: 4,
                    ),
                    child: ScoresWidget(
                      soul: logic.soul,
                      emotion: logic.emotion,
                      attraction: logic.attraction,
                    ),
                  ),
                  if (logic.meanings.isNotEmpty)
                    ReportTableWidget(data: logic.meanings),
                  BlurWidget(
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
                              text: 'Combined results：',
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                            TextSpan(
                              text: logic.summary,
                              style: TextStyle(
                                color: const Color(0xFF585FC4),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: AppFonts.textFontFamily,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BlurWidget(
                    isBlur: false,
                    sigma: 6,
                    radius: 3,
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsetsDirectional.only(
                        top: 8.h,
                        bottom: 20.h,
                      ),
                      child: Text(
                        logic.analysis,
                        style: TextStyle(
                          color: const Color(0xFF6A676C),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.textFontFamily,
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    Assets.imageReportBottomLine,
                    matchTextDirection: true,
                  ),
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
              ),
            ),
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
