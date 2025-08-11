part of 'index.dart';

class EditNamePage extends StatelessWidget {
  const EditNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(),
      backgroundColor: AppColor.pageBackground,
      body: Column(
        children: [
          SizedBox(height: 20.h),
          StepIndicator(index: 5),
          Container(
            margin: EdgeInsetsDirectional.only(
              start: 20.w,
              end: 20.w,
              top: 40.h,
            ),
            child: Text(
              LanKey.yourName.tr,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 28.sp,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ),
          EditName(
            onNext: (name) {
              debugPrint("name:$name");
              AccountService.to.updateUserNickName(name);
              PageTools.toInterests(loginType: (Get.arguments as int));
            },
          ),
        ],
      ),
    );
  }
}
