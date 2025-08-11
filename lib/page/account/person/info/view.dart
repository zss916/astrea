part of 'index.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(
        title: LanKey.accountInformation.tr,
        leading: Container(
          margin: EdgeInsetsDirectional.only(start: 16),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => Get.back(),
                child: Image.asset(
                  Assets.imageBackIcon,
                  matchTextDirection: true,
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.pageBackground,
      //extendBodyBehindAppBar: true,
      body: GetBuilder<AccountInfoLogic>(
        init: AccountInfoLogic(),
        builder: (logic) {
          return Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
                margin: EdgeInsetsDirectional.only(top: 16.h),
                width: double.maxFinite,
                height: 72,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 10.w),
                      child: Text(
                        LanKey.emailSubtitle.tr,
                        style: TextStyle(
                          color: const Color(0xFF6A676C),
                          fontSize: 18.sp,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        logic.email,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 18.sp,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0.5,
                color: Color(0xFFD6D6D6),
                indent: 16,
                endIndent: 16,
              ),
              Container(
                padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
                width: double.maxFinite,
                height: 72,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 10.w),
                      child: Text(
                        LanKey.loginMethod.tr,
                        style: TextStyle(
                          color: const Color(0xFF6A676C),
                          fontSize: 18.sp,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        logic.loginChannel,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 18.sp,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0.5,
                color: Color(0xFFD6D6D6),
                indent: 16.w,
                endIndent: 16.w,
              ),
              Container(
                padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
                width: double.maxFinite,
                height: 72,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 10.w),
                      child: Text(
                        LanKey.userID.tr,
                        style: TextStyle(
                          color: const Color(0xFF6A676C),
                          fontSize: 18.sp,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        logic.userID,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 18.sp,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0.5,
                color: Color(0xFFD6D6D6),
                indent: 16.w,
                endIndent: 16.w,
              ),
              Spacer(),
              CommonBtn(
                title: LanKey.signOut.tr,
                onTap: () {
                  showLogoutDialog(
                    onConfirm: () {
                      logic.toLogOut();
                    },
                  );
                },
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 16.h),
                child: DeleteBtn(
                  onTap: () {
                    logic.deleteAccount();
                  },
                ),
              ),
              SizedBox(height: 32.h),
            ],
          );
        },
      ),
    );
  }
}
