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
              return Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  StepIndicator(
                    index: 2,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
                    width: double.maxFinite,
                    child: Text(
                      LanKey.timeOfBirth.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppFonts.textFontFamily,
                        color: const Color(0xFF323133),
                        fontSize: 32,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsetsDirectional.only(start: 9, end: 9, top: 16.h),
                    width: double.maxFinite,
                    child: Text(
                      LanKey.timeOfBirthSubTitle.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF6A676C),
                        fontSize: 17,
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
                  Container(
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
                          },
                        )
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
