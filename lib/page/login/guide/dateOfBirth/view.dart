part of 'index.dart';

class DateOfBirthPage extends StatelessWidget {
  const DateOfBirthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(),
        backgroundColor: AppColor.pageBackground,
        body: GetBuilder<DateOfBirthLogic>(
            init: DateOfBirthLogic(),
            builder: (logic) {
              return Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  StepIndicator(
                    index: 1,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
                    width: double.maxFinite,
                    child: Text(
                      LanKey.dateOfBirth.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 32,
                        fontFamily: AppFonts.textFontFamily,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(
                        start: 20, end: 20, top: 16.h, bottom: 40.h),
                    width: double.maxFinite,
                    child: Text(
                      LanKey.dateOfBirthContent.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF6A676C),
                        fontSize: 17,
                        fontFamily: AppFonts.textFontFamily,
                      ),
                    ),
                  ),
                  SelectDateWidget(onSelect: (value) {
                    logic.birthday = value;
                  }),
                  Spacer(),
                  Container(
                    margin: EdgeInsetsDirectional.only(bottom: bottomPadding),
                    child: CommonBtn(
                      title: LanKey.next.tr,
                      onTap: () {
                        logic.toNext();
                      },
                    ),
                  ),
                ],
              );
            }));
  }
}
