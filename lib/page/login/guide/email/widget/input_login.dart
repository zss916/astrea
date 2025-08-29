import 'package:astrea/components/common_btn.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/setting/global.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/core/validator/app_validator.dart';
import 'package:astrea/page/login/guide/email/enum/login_enum.dart';
import 'package:astrea/page/login/guide/email/index.dart';
import 'package:astrea/page/login/guide/email/widget/input_email.dart';
import 'package:astrea/page/login/guide/email/widget/input_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InputLogin extends StatefulWidget {
  final EmailLogic logic;
  const InputLogin({super.key, required this.logic});

  @override
  _InputLoginState createState() => _InputLoginState();
}

class _InputLoginState extends State<InputLogin> with AppValidatorMixin {
  bool isEditEmail = false;
  bool isPsdEmail = false;

  String email = "";
  String pwd = "";

  @override
  void initState() {
    super.initState();
    if (widget.logic.loginType == LoginType.onlyLogin.index) {
      (String? account, String? pwd) value = AccountService.to
          .getAccountAndPsd();
      if ((value.$1) != null) {
        setState(() {
          email = (value.$1 ?? "");
          isEditEmail = true;
        });
      }
      if ((value.$2) != null) {
        setState(() {
          pwd = (value.$2 ?? "");
          isPsdEmail = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SizedBox(
        width: Get.width,
        height: double.maxFinite,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            SizedBox(
              width: Get.width,
              height: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(
                        start: 20.w,
                        end: 20.w,
                        top: 80.h,
                        bottom: 24.h,
                      ),
                      width: double.maxFinite,
                      child: Text(
                        LanKey.emailTitle.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.textTitleColor,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: AppFonts.subTitleFontFamily,
                        ),
                      ),
                    ),
                    InputEmail(
                      email: email,
                      type: widget.logic.loginType,
                      isShowError: widget.logic.isEmailError,
                      onNext: (value) {
                        setState(() {
                          email = value;
                          // isEditEmail = EmailValidator.validate(email);
                          isEditEmail = value.trim().isNotEmpty;
                        });
                      },
                    ),
                    InputPassword(
                      pwd: pwd,
                      type: widget.logic.loginType,
                      isShowError: widget.logic.isPsdError,
                      onNext: (value) {
                        setState(() {
                          pwd = value;
                          //isPsdEmail = isPwd(value);
                          isPsdEmail = value.trim().isNotEmpty;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: CommonBtn(
                isClickable: (isEditEmail && isPsdEmail),
                margin: EdgeInsetsDirectional.only(
                  start: 20.w,
                  end: 20.w,
                  top: 10.h,
                  bottom: bottomPadding,
                ),
                title: LanKey.submit.tr,
                onTap: () {
                  if (isEditEmail && isPsdEmail) {
                    widget.logic.toAuthEmail(email: email, pwd: pwd);
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
