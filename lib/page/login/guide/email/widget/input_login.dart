import 'package:astrea/components/common_btn.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/setting/global.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/core/validator/app_validator.dart';
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
  Widget build(BuildContext context) {
    return SizedBox(
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
                  /*SizedBox(
                    height: 20.h,
                  ),
                  StepIndicator(
                    index: 5,
                  ),*/
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: 20,
                      end: 20,
                      top: 30.h,
                      bottom: 24.h,
                    ),
                    width: double.maxFinite,
                    child: Text(
                      LanKey.emailTitle.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 32,
                        fontFamily: AppFonts.textFontFamily,
                      ),
                    ),
                  ),
                  InputEmail(
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
                start: 20,
                end: 20,
                top: 10.h,
                bottom: bottomPadding,
              ),
              title: LanKey.confirm.tr,
              onTap: () {
                if (isEditEmail && isPsdEmail) {
                  //PageTools.toResult();
                  widget.logic.toAuthEmail(email: email, pwd: pwd);
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
