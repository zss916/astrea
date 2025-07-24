part of 'index.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});
  final bool isShowVip = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(
        title: LanKey.analysis.tr,
        actions: [
          //buildShareAction(),
        ],
      ),
      backgroundColor: AppColor.pageBackground,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          buildBody(),
          if (isShowVip)
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: BottomStackBtn(
                title: LanKey.openVip.tr,
                padding: EdgeInsetsDirectional.only(bottom: 24.h, top: 70.h),
                onTap: () {
                  //todo
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget buildShareAction() => Container(
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

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsetsDirectional.all(16),
            margin: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 20,
              bottom: 12,
            ),
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
                PositionedDirectional(
                  bottom: 0,
                  start: 0,
                  end: 0,
                  child: Image.asset(
                    Assets.imageBottomTexture3,
                    matchTextDirection: true,
                  ),
                ),
                Column(
                  children: [
                    NatalChartWidget(),
                    //  FreeUnlockingCard(),
                    // KeywordsWidget(),
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsetsDirectional.only(top: 16),
                      child: Text(
                        LanKey.personalityAnalysis.tr,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 18,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.only(top: 8),
                          width: double.maxFinite,
                          child: Text.rich(
                            //overflow: TextOverflow.ellipsis,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '☀️ ',
                                  style: TextStyle(
                                    color: const Color(0xFF6A676C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.textFontFamily,
                                    height: 1.62,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sun sign: ',
                                  style: TextStyle(
                                    color: const Color(0xFF585FC4),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.textFontFamily,
                                    height: 1.62,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Falling into the 1st house: Outstanding personal charm, natural elegance, and sociable skills become personal characteristics.',
                                  style: TextStyle(
                                    color: const Color(0xFF6A676C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.textFontFamily,
                                    height: 1.62,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              debugPrint('tap');
                              //todo
                            },
                            child: Container(
                              margin: EdgeInsetsDirectional.only(
                                top: 8,
                                bottom: 8,
                              ),
                              width: double.maxFinite,
                              child: Text.rich(
                                textAlign: TextAlign.start,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Add friends',
                                      style: TextStyle(
                                        color: const Color(0xFF6A676C),
                                        fontSize: 16,
                                        fontFamily: AppFonts.textFontFamily,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                        height: 1.62,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' to see who’s similar',
                                      style: TextStyle(
                                        color: const Color(0xFF6A676C),
                                        fontSize: 16,
                                        fontFamily: AppFonts.textFontFamily,
                                        fontWeight: FontWeight.w400,
                                        height: 1.62,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: SizedBox(
                                        width: 17,
                                        height: 17,
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            Image.asset(
                                              Assets.imageEndArrow,
                                              matchTextDirection: true,
                                              width: 17,
                                              height: 7,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsetsDirectional.only(top: 8),
                          width: double.maxFinite,
                          child: Text.rich(
                            //overflow: TextOverflow.ellipsis,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '🌙 ',
                                  style: TextStyle(
                                    color: const Color(0xFF6A676C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.62,
                                    fontFamily: AppFonts.textFontFamily,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Moon Sign: ',
                                  style: TextStyle(
                                    color: const Color(0xFF585FC4),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.62,
                                    fontFamily: AppFonts.textFontFamily,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Moon in the 4th house requires a home that is elegant and peaceful.',
                                  style: TextStyle(
                                    color: const Color(0xFF6A676C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.textFontFamily,
                                    height: 1.62,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              debugPrint('tap');
                              //todo
                            },
                            child: Container(
                              margin: EdgeInsetsDirectional.only(
                                top: 8,
                                bottom: 8,
                              ),
                              width: double.maxFinite,
                              child: Text.rich(
                                textAlign: TextAlign.start,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '🔮 You relationship analysis',
                                      style: TextStyle(
                                        color: const Color(0xFF6A676C),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        height: 1.62,
                                        fontFamily: AppFonts.textFontFamily,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: SizedBox(
                                        width: 17,
                                        height: 17,
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            Image.asset(
                                              Assets.imageEndArrow,
                                              matchTextDirection: true,
                                              width: 17,
                                              height: 7,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsetsDirectional.only(top: 8),
                          width: double.maxFinite,
                          child: Text.rich(
                            //overflow: TextOverflow.ellipsis,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '💫 ',
                                  style: TextStyle(
                                    color: const Color(0xFF6A676C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.62,
                                    fontFamily: AppFonts.textFontFamily,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Ascendant: ',
                                  style: TextStyle(
                                    color: const Color(0xFF585FC4),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.62,
                                    fontFamily: AppFonts.textFontFamily,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'The first impression given by the person is elegant and decent, and they are good at breaking the ice in social situations, but they may hide their true emotions.',
                                  style: TextStyle(
                                    color: const Color(0xFF6A676C),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 1.62,
                                    fontFamily: AppFonts.textFontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              debugPrint('tap');
                              //todo
                            },
                            child: Container(
                              margin: EdgeInsetsDirectional.only(
                                top: 8,
                                bottom: 8,
                              ),
                              width: double.maxFinite,
                              child: Text.rich(
                                textAlign: TextAlign.start,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '🪐 House analysis and influence analysis',
                                      style: TextStyle(
                                        color: const Color(0xFF6A676C),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        height: 1.62,
                                        fontFamily: AppFonts.textFontFamily,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: SizedBox(
                                        width: 17,
                                        height: 17,
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional.center,
                                          children: [
                                            Image.asset(
                                              Assets.imageEndArrow,
                                              matchTextDirection: true,
                                              width: 17,
                                              height: 7,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 30, color: Colors.transparent),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsetsDirectional.all(14),
            margin: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 12,
              bottom: 20,
            ),
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
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 12,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => DetailItem(index: index),
                  separatorBuilder: (context, index) => Container(
                    width: double.maxFinite,
                    margin: EdgeInsetsDirectional.only(top: 14, bottom: 14),
                    child: SvgPicture.asset(Assets.svgItemLine),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 0.h),
                  child: Image.asset(
                    Assets.imageAnalysisBottom,
                    matchTextDirection: true,
                  ),
                ),

                /*AstrologerChatBtn(
                    margin: EdgeInsetsDirectional.only(top: 28),
                  ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
