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
            width: 128,
            height: 128,
            margin: EdgeInsets.only(top: 24.h, bottom: 18.h),
            decoration: ShapeDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage(Assets.imageDefaultAvatar),
                fit: BoxFit.cover,
              ),
              shape: OvalBorder(),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Text(
              LanKey.yourName.tr,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 32.sp,
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
