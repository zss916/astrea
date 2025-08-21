part of 'index.dart';

class PersonalDataPage extends StatelessWidget {
  final FocusNode focusNode = FocusNode();
  PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 防止键盘影响布局
      appBar: ComAppBar(
        title: LanKey.editFile.tr,
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
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsetsDirectional.only(
          start: 16,
          end: 16,
          top: 20.h,
          bottom: 0.h,
        ),
        child: GetBuilder<PersonalDataLogic>(
          init: PersonalDataLogic(),
          builder: (logic) {
            return Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      EditAvatar(
                        path: logic.avatar,
                        logic: logic,
                        onTap: () {
                          focusNode.unfocus();
                        },
                      ),
                      EditName(
                        focusNode: focusNode,
                        nickName: logic.nickName,
                        onChange: (value) {
                          logic.account?.nickName = value;
                        },
                      ),
                      Divider(height: 1, color: Color(0xFFD5D5D5)),
                      SelectSex(
                        sex: logic.sex,
                        onNext: (sex) {
                          logic.account?.sex = sex;
                          focusNode.unfocus();
                        },
                      ),
                      Divider(height: 1, color: Color(0xFFD5D5D5)),
                      SelectBirth(
                        initialDateTime: logic.initDateTime,
                        birth: logic.dateBirth,
                        onNext: (dateBirth, hourBirth, minuteBirth) {
                          logic.account?.birthday = dateBirth;
                          logic.account?.birthHour = hourBirth;
                          logic.account?.birthMinute = minuteBirth;
                          focusNode.unfocus();
                          //logic.update();
                        },
                        onUnfocus: () {
                          focusNode.unfocus();
                        },
                      ),
                      Divider(height: 1, color: Color(0xFFD5D5D5)),
                      EditPlaceOfBirth(
                        showPlace: logic.placeBirth,
                        onChange: (value, latitude, longitude) {
                          logic.account?.locality = value;
                          logic.account?.lat = latitude;
                          logic.account?.lon = longitude;
                          logic.update();
                          focusNode.unfocus();
                        },
                        onUnfocus: () {
                          focusNode.unfocus();
                        },
                      ),
                      Divider(height: 1, color: Color(0xFFD5D5D5)),
                      InkWell(
                        onTap: () {
                          focusNode.unfocus();
                          showInterestsSheet(logic.interests ?? "", (value) {
                            logic.account?.interests = value;
                            logic.update();
                            focusNode.unfocus();
                          });
                        },
                        child: SelectInterests(interests: logic.interests),
                      ),
                      Divider(height: 1, color: Color(0xFFD5D5D5)),
                      SizedBox(height: 160.h),
                    ],
                  ),
                ),

                PositionedDirectional(
                  bottom: 0,
                  start: 0,
                  end: 0,
                  child: Column(
                    children: [
                      CommonBtn(
                        title: LanKey.save.tr,
                        isClickable: true,
                        margin: EdgeInsetsDirectional.zero,
                        onTap: () {
                          focusNode.unfocus();
                          logic.updateData();
                        },
                      ),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildTelephone() => InkWell(
    onTap: () {
      PageTools.toTelephone();
    },
    child: SizedBox(
      height: 72,
      width: double.maxFinite,
      child: Row(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 10),
            child: Text(
              LanKey.telephoneNumber.tr,
              style: TextStyle(
                color: const Color(0xFF6A676C),
                fontSize: 18,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Spacer(),
          Image.asset(
            Assets.imageArrowEnd,
            width: 24,
            height: 24,
            matchTextDirection: true,
          ),
        ],
      ),
    ),
  );
}
