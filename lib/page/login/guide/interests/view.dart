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
          SizedBox(height: 20.h),
          StepIndicator(index: 6),
          SizedBox(height: 25.h),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            width: double.maxFinite,
            child: Text(
              LanKey.interestsTitle.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.textTitleColor,
                fontSize: 28.sp,
                fontFamily: AppFonts.titleFontFamily,
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
              LanKey.interestsContent.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF6A676C),
                fontSize: 16.sp,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: SelectInterestWidget(
                onNext: (index) {
                  /*AccountService.to.updateLoginStep(
                    step: LoginStep.stepFinish.value,
                  );*/

                  int type = Get.arguments as int;
                  if (type == LoginType.loginAndRegister.index) {
                    PageTools.toWelcome(
                      loginType: LoginType.loginAndRegister.index,
                    );
                  } else {
                    PageTools.toResult();
                  }
                  AppPermissionTools.checkNotification();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
