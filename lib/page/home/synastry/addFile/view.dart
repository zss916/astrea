part of 'index.dart';

class AddFilePage extends StatelessWidget {
  final FocusNode _focusNode = FocusNode();
  AddFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 防止键盘影响布局
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
              ),
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
                      start: 16,
                      end: 16,
                      top: 25.h,
                      bottom: 160.h,
                    ),
                    child: Column(
                      children: [
                        EditAvatar(
                          path: logic.data.headImg ?? "",
                          logic: logic,
                          onTap: () {
                            _focusNode.unfocus();
                          },
                        ),
                        EditName(
                          focusNode: _focusNode,
                          nickName: logic.data.nickName ?? "",
                          onChange: (value) {
                            logic.data.nickName = value;
                            logic.updateButtonState();
                          },
                        ),
                        Divider(height: 1, color: Color(0xFFD5D5D5)),
                        SelectSex(
                          sex: (logic.data.sex ?? 2),
                          onNext: (sex) {
                            logic.data.sex = sex;
                            _focusNode.unfocus();
                            logic.updateButtonState();
                          },
                        ),
                        Divider(height: 1, color: Color(0xFFD5D5D5)),
                        SelectBirth(
                          initialDateTime: logic.initDateTime,
                          birth: logic.data.showBirthDay,
                          onNext: (dateBirth, hourBirth, minuteBirth) {
                            logic.data.birthday = dateBirth;
                            logic.data.birthHour = hourBirth;
                            logic.data.birthMinute = minuteBirth;
                            logic.updateButtonState();
                            _focusNode.unfocus();
                          },
                          onUnfocus: () {
                            _focusNode.unfocus();
                          },
                        ),
                        Divider(height: 1, color: Color(0xFFD5D5D5)),
                        EditPlaceOfBirth(
                          showPlace: logic.data.locality,
                          onChange: (value, latitude, longitude) {
                            logic.data.locality = value;
                            logic.data.lat = num.parse(latitude);
                            logic.data.lon = num.parse(longitude);
                            logic.updateButtonState();
                            _focusNode.unfocus();
                          },
                          onUnfocus: () {
                            _focusNode.unfocus();
                          },
                        ),
                        Divider(height: 1, color: Color(0xFFD5D5D5)),
                        InkWell(
                          onTap: () {
                            _focusNode.unfocus();
                            showInterestsSheet(logic.data.interests ?? "", (
                              value,
                            ) {
                              logic.data.interests = value;
                              logic.updateButtonState();
                              _focusNode.unfocus();
                            });
                          },
                          child: SelectInterests(
                            interests: logic.data.interests,
                          ),
                        ),
                        Divider(height: 1, color: Color(0xFFD5D5D5)),
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
                  isClickable: logic.isSave,
                  padding: EdgeInsetsDirectional.only(bottom: 24.h, top: 70.h),
                  onTap: () {
                    if (logic.isSave) {
                      if (logic.id == null) {
                        logic.addFriend();
                      } else {
                        logic.updateFriend();
                      }
                    } else {
                      // AppLoading.toast("");
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  ///限制为≤16字符，仅允许字母、数字及下划线，禁止空格和特殊符号
  /*  bool isValidate(String input) =>
      RegExp(r'^[a-zA-Z0-9_]{1,16}$').hasMatch(input.trim());*/
}
