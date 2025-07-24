part of 'index.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: AppColor.pageBackground,
            body: GetBuilder<ResultLogic>(
                init: ResultLogic(),
                builder: (logic) {
                  return SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned.fill(
                            child: InkWell(
                                onTap: () {
                                  logic.loadData();
                                },
                                child: Image.asset(
                                  Assets.imageResultBg,
                                  matchTextDirection: true,
                                ))),
                        Container(
                          width: double.maxFinite,
                          margin: EdgeInsetsDirectional.only(
                              start: 30.w, end: 30.w),
                          child: Text(
                            LanKey.resultContent.tr,
                            style: TextStyle(
                              color: const Color(0xFF323133),
                              fontSize: 32.sp,
                              fontFamily: AppFonts.textFontFamily,
                            ),
                          ),
                        ),
                        PositionedDirectional(
                            bottom: bottomPadding,
                            start: 0,
                            end: 0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SlideMarquee(),
                                Container(
                                  margin: EdgeInsetsDirectional.only(
                                      start: 28, end: 28, top: 12),
                                  child: Text(
                                    LanKey.resultTip.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color(0xFF6A676C),
                                      fontSize: 14,
                                      fontFamily: AppFonts.textFontFamily,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  );
                })));
  }
}
