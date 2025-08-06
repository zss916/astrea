part of 'index.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  ///是否已经注册过
  final bool isRegistered = false;

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

                  if (!isRegistered)
                    CommonBtn(
                      title: LanKey.signUp.tr,
                      onTap: () {
                        logic.toStep();
                      },
                    )
                  else
                    Column(
                      children: [
                        if (GetPlatform.isIOS)
                          WelcomeBtn(
                            margin: EdgeInsetsDirectional.only(
                              bottom: 12,
                              start: 20,
                              end: 20,
                            ),
                            title: LanKey.apple.tr,
                            icon: Assets.imageApple,
                            onTap: () {
                              // logic.toGoogleAuth();
                            },
                          ),
                        if (GetPlatform.isAndroid)
                          WelcomeBtn(
                            margin: EdgeInsetsDirectional.only(
                              bottom: 12,
                              start: 20,
                              end: 20,
                            ),
                            title: LanKey.google.tr,
                            iconSize: SizedBox(width: 16, height: 16),
                            iconColor: Colors.white,
                            //: Color(0xFF323133),
                            icon: Assets.imageGoogle,
                            onTap: () {
                              // logic.toAppleAuth();
                            },
                          ),
                        WelcomeBtn(
                          title: LanKey.email.tr,
                          icon: Assets.imageEmail,
                          iconSize: SizedBox(width: 16, height: 16),
                          bgColor: Color(0xFFEAE9F1),
                          textColor: Color(0xFF323133),
                          onTap: () {
                            // logic.toEmailAuth();
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

              PositionedDirectional(
                top: 30,
                end: 10,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    if (isRegistered) {
                      logic.toStep();
                    } else {
                      logic.toLogin();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      isRegistered
                          ? LanKey.signUp.tr
                          : LanKey.startExistingUsers.tr,
                      style: TextStyle(
                        color: const Color(0xFF6A676C),
                        fontSize: 18,
                        fontFamily: AppFonts.textFontFamily,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
