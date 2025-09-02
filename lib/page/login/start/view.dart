part of 'index.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartLogic>(
      init: StartLogic(),
      builder: (logic) {
        return Scaffold(
          appBar: ComAppBar(
            leading: SizedBox.shrink(),
            actions: [
              Container(
                margin: EdgeInsetsDirectional.only(end: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    if (logic.isRegistered) {
                      logic.toStep();
                    } else {
                      logic.toLogin();
                    }
                  },
                  child: Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 10,
                      end: 10,
                      top: 5,
                      bottom: 5,
                    ),
                    child: Text(
                      logic.isRegistered
                          ? LanKey.signUp.tr
                          : LanKey.startExistingUsers.tr,
                      style: TextStyle(
                        color: const Color(0xFF6A676C),
                        fontSize: 18.sp,
                        fontFamily: AppFonts.textFontFamily,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: AppColor.pageBackground,
          extendBodyBehindAppBar: true,
          body: Stack(
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
                        fontSize: 28.sp,
                        fontFamily: AppFonts.titleFontFamily,
                        //fontWeight: FontWeight.w800,
                        color: AppColor.textTitleColor,
                      ),
                    ),
                  ),
                  Spacer(),

                  if (!logic.isRegistered)
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
                              start: 20.w,
                              end: 20.w,
                            ),
                            title: LanKey.apple.tr,
                            icon: Assets.imageApple,
                            onTap: () {
                              logic.toAppleAuth();
                            },
                          ),
                        if (GetPlatform.isAndroid)
                          WelcomeBtn(
                            margin: EdgeInsetsDirectional.only(
                              bottom: 12,
                              start: 20.w,
                              end: 20.w,
                            ),
                            title: LanKey.google.tr,
                            iconSize: SizedBox(width: 16, height: 16),
                            iconColor: Colors.white,
                            icon: Assets.imageGoogle,
                            onTap: () {
                              logic.toGoogleAuth();
                            },
                          ),
                        WelcomeBtn(
                          title: LanKey.email.tr,
                          icon: Assets.imageEmail,
                          border: Border.all(
                            width: 1,
                            color: Color(0xFFD9D9D9),
                          ),
                          iconSize: SizedBox(width: 16, height: 16),
                          bgColor: Colors.transparent,
                          textColor: Color(0xFF323133),
                          onTap: () {
                            logic.toEmail();
                          },
                        ),
                      ],
                    ),

                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 20.w,
                      end: 20.w,
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
              /* PositionedDirectional(
                top: 45.h,
                end: 20.w,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    if (logic.isRegistered) {
                      logic.toStep();
                    } else {
                      logic.toLogin();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      logic.isRegistered
                          ? LanKey.signUp.tr
                          : LanKey.startExistingUsers.tr,
                      style: TextStyle(
                        color: const Color(0xFF6A676C),
                        fontSize: 18.sp,
                        fontFamily: AppFonts.textFontFamily,
                      ),
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        );
      },
    );
  }
}
