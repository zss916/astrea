import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/components/common_btn.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

void showLoginPasswordSheet() {
  Get.bottomSheet(
    LoginPassword(),
    settings: RouteSettings(name: APages.setLoginPasswordSheet),
  );
}

class LoginPassword extends StatefulWidget {
  const LoginPassword({super.key});

  @override
  State<LoginPassword> createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(16),
          topEnd: Radius.circular(16),
        ),
        color: Color(0xFFFFFFFF),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  Get.back();
                },
                child: Container(
                  margin: EdgeInsetsDirectional.all(4),
                  child: Image.asset(
                    Assets.imageCloseDialog,
                    width: 24,
                    height: 24,
                    matchTextDirection: true,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.only(start: 12, end: 12, top: 20.h),
            child: Text(
              LanKey.enterLoginPassword.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 24.h, start: 16, end: 16),
            width: double.maxFinite,
            height: 48,
            child: TextField(
              textAlign: TextAlign.start,
              obscureText: obscureText,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: LanKey.enterLoginPasswordHint.tr,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        obscureText
                            ? Assets.imageEyeClose
                            : Assets.imageEyeOpen,
                        width: 24,
                        height: 24,
                        matchTextDirection: true,
                      ),
                    ],
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintStyle: TextStyle(color: Color(0xFF91929D), fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                ),
              ),
              onChanged: (value) {
                //todo
              },
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.only(top: 8.h, start: 16, end: 16),
            child: Text(
              LanKey.loginPasswordTip.tr,
              style: TextStyle(color: const Color(0xFFFF2200), fontSize: 14),
            ),
          ),
          CommonBtn(
            isClickable: false,
            margin: EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
              bottom: 45.h,
              top: 32.h,
            ),
            title: LanKey.next.tr,
            onTap: () {
              //todo
            },
          ),
        ],
      ),
    );
  }
}
