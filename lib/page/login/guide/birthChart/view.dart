part of 'index.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(),
      backgroundColor: AppColor.pageBackground,
      body: Column(
        children: [
          SizedBox(height: 20.h),
          StepIndicator(index: 0),
          SizedBox(height: 40.h),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
            width: double.maxFinite,
            child: Text(
              LanKey.birthChart.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.titleFontFamily,
                color: AppColor.textTitleColor,
                //fontWeight: FontWeight.w800,
                fontSize: 28.sp,
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 14.h, bottom: 20.h),
            child: Image.asset(
              Assets.imageBirthChart,
              height: 150.h,
              matchTextDirection: true,
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            width: double.maxFinite,
            child: Text(
              LanKey.birthChartTitle.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.subTitleFontFamily,
                color: AppColor.textTitleColor,
                fontWeight: FontWeight.w800,
                fontSize: 22.sp,
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
              LanKey.birthChartContent.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF6A676C),
                fontSize: 16.sp,
                //fontWeight: FontWeight.w500,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsetsDirectional.only(bottom: bottomPadding),
            child: CommonBtn(
              title: LanKey.next.tr,
              onTap: () {
                PageTools.toDateOfBirth(loginType: (Get.arguments as int));
              },
            ),
          ),
        ],
      ),
    );
  }
}
