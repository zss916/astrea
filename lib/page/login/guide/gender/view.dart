part of 'index.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(),
      backgroundColor: AppColor.pageBackground,
      body: Column(
        children: [
          SizedBox(height: 20.h),
          StepIndicator(index: 4),
          SizedBox(height: 40.h),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
            width: double.maxFinite,
            child: Text(
              LanKey.youGender.tr,
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
              bottom: 24.h,
            ),
            width: double.maxFinite,
            child: Text(
              LanKey.youGenderContent.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF6A676C),
                fontSize: 18.sp,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ),
          Expanded(
            child: SelectGender(
              onNext: () {
                PageTools.toEditUserName(loginType: (Get.arguments as int));
              },
            ),
          ),
        ],
      ),
    );
  }
}
