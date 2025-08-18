part of 'index.dart';

class TimeOfBirthPage extends StatelessWidget {
  const TimeOfBirthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(),
      backgroundColor: AppColor.pageBackground,
      body: GetBuilder<TimeOfBirthLogic>(
        init: TimeOfBirthLogic(),
        builder: (logic) {
          return Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Column(
                children: [
                  SizedBox(height: 20.h),
                  StepIndicator(index: 2),
                  SizedBox(height: 30.h),
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
                    width: double.maxFinite,
                    child: Text(
                      LanKey.timeOfBirth.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppFonts.titleFontFamily,
                        color: AppColor.textTitleColor,
                        fontSize: 28.sp,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 20.w,
                      end: 20.w,
                      top: 15.h,
                      bottom: 20.h,
                    ),
                    width: double.maxFinite,
                    child: Text(
                      LanKey.timeOfBirthSubTitle.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF6A676C),
                        fontSize: 16.sp,
                        fontFamily: AppFonts.textFontFamily,
                      ),
                    ),
                  ),
                  SelectBirthWidget(
                    onSelect: (h, m) {
                      logic.birthHour = h;
                      logic.birthMinute = m;
                      // AccountService.to.updateUserBirthHAndM(time.hour, time.minute);
                    },
                  ),
                  Spacer(),
                ],
              ),
              PositionedDirectional(
                bottom: 0,
                start: 0,
                end: 0,
                child: Container(
                  margin: EdgeInsetsDirectional.only(bottom: 10.h),
                  child: Column(
                    children: [
                      CommonBtn(
                        title: LanKey.next.tr,
                        onTap: () {
                          logic.toNext();
                        },
                      ),
                      DoNotKnow(
                        onSelect: (h, m) {
                          logic.birthHour = h;
                          logic.birthMinute = m;
                          logic.toNext();
                        },
                      ),
                    ],
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
