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
              SizedBox(height: 20.h),
              StepIndicator(index: 1),
              SizedBox(height: 40.h),
              Container(
                margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
                width: double.maxFinite,
                child: Text(
                  LanKey.selectDateOfBirth.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF323133),
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
                  bottom: 60.h,
                ),
                width: double.maxFinite,
                child: Text(
                  LanKey.dateOfBirthContent.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF6A676C),
                    fontSize: 17.sp,
                    fontFamily: AppFonts.textFontFamily,
                  ),
                ),
              ),
              SelectDateWidget(
                onSelect: (value) {
                  logic.birthday = value;
                },
              ),
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
        },
      ),
    );
  }
}
