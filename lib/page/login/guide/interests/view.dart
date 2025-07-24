part of 'index.dart';

class InterestsPage extends StatelessWidget {
  const InterestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(),
        backgroundColor: AppColor.pageBackground,
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            StepIndicator(
              index: 6,
            ),
            SizedBox(
              height: 35.h,
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
              width: double.maxFinite,
              child: Text(
                LanKey.interestsTitle.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 32,
                    fontFamily: AppFonts.textFontFamily),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20, end: 20, top: 16.h),
              width: double.maxFinite,
              child: Text(
                LanKey.interestsContent.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontSize: 17,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
            ),
            Expanded(child: SelectInterestWidget(
              onNext: (index) {
                AccountService.to
                    .updateLoginStep(step: LoginStep.stepFinish.value);

                if (AccountService.to.isLogin) {
                  PageTools.toResult();
                } else {
                  PageTools.toWelcome();
                }
                AppPermissionTools.checkNotification();
                // PageTools.toNotifySetting();
              },
            ))
          ],
        ));
  }
}
