part of 'index.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});
  final bool isCreateAccount = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: noTitleAppBar,
      backgroundColor: AppColor.pageBackground,
      extendBodyBehindAppBar: true,
      body: GetBuilder<StartLogic>(
        init: StartLogic(),
        builder: (logic) {
          return Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              PositionedDirectional(
                start: 0,
                end: 0,
                bottom: 0,
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 4),
                  child: Image.asset(
                    Assets.imageStartBg,
                    matchTextDirection: true,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 0),
                    child: Image.asset(
                      Assets.imageStartIcon,
                      matchTextDirection: true,
                      width: 280.w,
                      height: 309.h,
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 20, end: 20),
                    child: AutoSizeText(
                      maxFontSize: 30,
                      minFontSize: 20,
                      LanKey.startTitle.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF323133),
                      ),
                    ),
                  ),
                  Spacer(),
                  if (isCreateAccount)
                    Column(
                      children: [
                        CommonBtn(
                          title: LanKey.startBtn.tr,
                          onTap: () {
                            logic.toStep();
                          },
                        ),
                        CommonBtn(
                          title: LanKey.startExistingUsers.tr,
                          bgColor: Color(0xFFEAE9F1),
                          textColor: Color(0xFF2E2C2F),
                          margin: EdgeInsetsDirectional.only(
                            start: 20,
                            end: 20,
                            top: 12,
                          ),
                          onTap: () {
                            logic.toLogin();
                          },
                        ),
                      ],
                    )
                  else
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonBtn(
                          title: LanKey.startExistingUsers.tr,
                          onTap: () {
                            logic.toLogin();
                          },
                        ),
                        CommonBtn(
                          title: LanKey.startBtn.tr,
                          bgColor: Color(0xFFEAE9F1),
                          textColor: Color(0xFF2E2C2F),
                          margin: EdgeInsetsDirectional.only(
                            start: 20,
                            end: 20,
                            top: 12,
                          ),
                          onTap: () {
                            logic.toStep();
                          },
                        ),
                      ],
                    ),

                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 20,
                      end: 20,
                      top: 28,
                      bottom: 70.h,
                    ),
                    child: PolicyWidget(
                      onPrivacyTap: () {
                        logic.toPrivacy();
                      },
                      onServiceTap: () {
                        logic.toService();
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
