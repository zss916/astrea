part of 'index.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
          title: LanKey.personalDataTitle.tr,
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
                )
              ],
            ),
          ),
        ),
        backgroundColor: AppColor.pageBackground,
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: EdgeInsetsDirectional.only(
              start: 16, end: 16, top: 25.h, bottom: 0.h),
          child: GetBuilder<PersonalDataLogic>(
              init: PersonalDataLogic(),
              builder: (logic) {
                return Column(
                  children: [
                    EditAvatar(
                      path: logic.avatar,
                    ),
                    EditName(
                        nickName: logic.nickName,
                        onChange: (value) {
                          logic.account?.nickName = value;
                          logic.update();
                          // logic.saveData(nickName:  value);
                        }),
                    Divider(
                      height: 1,
                      color: Color(0xFFD5D5D5),
                    ),
                    SizedBox(
                      height: 72,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.only(end: 10),
                            child: Text(
                              LanKey.gender.tr,
                              style: TextStyle(
                                color: const Color(0xFF6A676C),
                                fontSize: 18,
                                fontFamily: AppFonts.textFontFamily,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Spacer(),
                          // Gender(isMale: false),
                          SelectGender(
                            sex: logic.sex,
                            onNext: (sex) {},
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xFFD5D5D5),
                    ),
                    SelectBirth(
                      birth: logic.dateBirth,
                      onNext: (dateBirth, hourBirth, minuteBirth) {},
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xFFD5D5D5),
                    ),
                    EditPlaceOfBirth(
                      showPlace: logic.placeBirth,
                      onChange: (value, latitude, longitude) {
                        logic.account?.locality = value;
                        logic.account?.lat = latitude;
                        logic.account?.lon = longitude;
                        logic.update();
                      },
                    ),
                    Divider(
                      height: 1,
                      color: Color(0xFFD5D5D5),
                    ),
                    /*
              InkWell(
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
                      )
                    ],
                  ),
                ),
              ),*/
                    Spacer(),
                    CommonBtn(
                        title: LanKey.save.tr,
                        isClickable: true,
                        margin: EdgeInsetsDirectional.zero,
                        onTap: () {
                          logic.saveData();
                        }),
                    SizedBox(
                      height: 32.h,
                    )
                  ],
                );
              }),
        ));
  }
}
