part of 'index.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(leading: SizedBox.shrink()),
      backgroundColor: AppColor.pageBackground,
      body: GetBuilder<WelcomeLogic>(
        init: WelcomeLogic(),
        builder: (logic) => Column(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(start: 20, end: 20, top: 30.h),
              width: double.maxFinite,
              child: Text(
                LanKey.welcome.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 32,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20, end: 20, top: 16.h),
              width: double.maxFinite,
              child: Text(
                LanKey.welcomeTip.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontFamily: AppFonts.textFontFamily,
                  fontSize: 17,
                ),
              ),
            ),
            Container(
              width: 140,
              height: 140,
              margin: EdgeInsetsDirectional.only(top: 30.h, bottom: 20.h),
              decoration: ShapeDecoration(
                image: DecorationImage(
                  matchTextDirection: true,
                  image: AssetImage(Assets.imageMask),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200),
                ),
              ),
            ),
            Spacer(),
            //if (GetPlatform.isIOS)
            WelcomeBtn(
              title: LanKey.apple.tr,
              icon: Assets.imageApple,
              onTap: () {
                logic.toGoogleAuth();
              },
            ),
            //if (GetPlatform.isAndroid)
            WelcomeBtn(
              margin: EdgeInsetsDirectional.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              title: LanKey.google.tr,
              iconSize: SizedBox(width: 16, height: 16),
              bgColor: Color(0xFFEAE9F1),
              textColor: Color(0xFF323133),
              icon: Assets.imageGoogle,
              onTap: () {
                logic.toAppleAuth();
              },
            ),
            WelcomeBtn(
              title: LanKey.email.tr,
              icon: Assets.imageEmail,
              iconSize: SizedBox(width: 16, height: 16),
              bgColor: Color(0xFFEAE9F1),
              textColor: Color(0xFF323133),
              onTap: () {
                logic.toEmailAuth();
              },
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                start: 20,
                end: 20,
                top: 28.h,
                bottom: bottomPadding,
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
      ),
    );
  }

  @Deprecated("delete")
  Widget buildStep() => StepIndicator(index: 8);
}
