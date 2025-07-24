part of 'index.dart';

class AddFilePage extends StatelessWidget {
  const AddFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ComAppBar(
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
          //editFile
          title: ((Get.arguments?["isEditFile"] ?? false) == true)
              ? LanKey.editFile.tr
              : LanKey.addFile.tr,
        ),
        backgroundColor: AppColor.pageBackground,
        body: GetBuilder<AddFileLogic>(
            init: AddFileLogic(),
            builder: (logic) {
              return Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsetsDirectional.only(
                            start: 16, end: 16, top: 25.h, bottom: 120.h),
                        child: Column(
                          children: [
                            EditAvatar(
                              path: null,
                            ),
                            EditName(
                                nickName: logic.nickName,
                                onChange: (value) {
                                  logic.nickName = value;
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
                                  SelectGender(
                                    sex: logic.sex,
                                    onNext: (sex) {
                                      logic.sex = sex;
                                    },
                                  ),
                                  //Gender(isMale: false)
                                ],
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: Color(0xFFD5D5D5),
                            ),
                            SelectBirth(
                              birth: logic.birthday,
                              onNext: (dateBirth, hourBirth, minuteBirth) {
                                logic.birthday = dateBirth;
                                logic.hourBirth = hourBirth;
                                logic.minuteBirth = minuteBirth;
                              },
                            ),
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
                                      LanKey.placeOfBirth.tr,
                                      style: TextStyle(
                                        color: const Color(0xFF6A676C),
                                        fontSize: 18,
                                        fontFamily: AppFonts.textFontFamily,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                          child: AutoSizeText(
                                        LanKey.enterPlaceOfBirth.tr,
                                        maxLines: 1,
                                        textAlign: TextAlign.right,
                                        maxFontSize: 18,
                                        minFontSize: 10,
                                        style: TextStyle(
                                          color: const Color(0xFF91929D),
                                          fontSize: 18,
                                          fontFamily: AppFonts.textFontFamily,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                      Image.asset(
                                        Assets.imageArrowEnd,
                                        width: 24,
                                        height: 24,
                                        matchTextDirection: true,
                                      )
                                      /*Container(
                                  margin: EdgeInsetsDirectional.symmetric(
                                      horizontal: 8),
                                  width: 1,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFD9D9D9)),
                                ),*/
                                      /*Image.asset(
                                  Assets.imageLocationEditIcon,
                                  matchTextDirection: true,
                                  height: 26,
                                  width: 50,
                                )*/
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: Color(0xFFD5D5D5),
                            ),
                            /*SelectTag()*/
                          ],
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                      bottom: 0,
                      start: 0,
                      end: 0,
                      child: BottomStackBtn(
                        title: LanKey.save.tr,
                        isClickable: true,
                        padding:
                            EdgeInsetsDirectional.only(bottom: 24.h, top: 70.h),
                        onTap: () {
                          logic.log();
                          //logic.addFriend();
                        },
                      )),
                ],
              );
            }));
  }

  ///限制为≤16字符，仅允许字母、数字及下划线，禁止空格和特殊符号
/*  bool isValidate(String input) =>
      RegExp(r'^[a-zA-Z0-9_]{1,16}$').hasMatch(input.trim());*/
}
