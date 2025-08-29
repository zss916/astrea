part of 'index.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(),
      backgroundColor: AppColor.pageBackground,
      body: GetBuilder<WelcomeLogic>(
        init: WelcomeLogic(),
        builder: (logic) => Column(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(
                start: 20.w,
                end: 20.w,
                top: 60.h,
              ),
              width: double.maxFinite,
              child: Text(
                LanKey.startTitle.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.textTitleColor,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: AppFonts.subTitleFontFamily,
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                start: 20.w,
                end: 20.w,
                top: 16.h,
              ),
              width: double.maxFinite,
              child: Text(
                LanKey.welcomeTip.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontFamily: AppFonts.textFontFamily,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Container(
              width: 140.r,
              height: 140.r,
              margin: EdgeInsetsDirectional.only(top: 60.h, bottom: 20.h),
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
                  logic.toAppleAuth();
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
                  logic.toGoogleAuth();
                },
              ),
            WelcomeBtn(
              title: LanKey.email.tr,
              icon: Assets.imageEmail,
              border: Border.all(width: 1, color: Color(0xFFD9D9D9)),
              iconSize: SizedBox(width: 16, height: 16),
              bgColor: Colors.transparent,
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
