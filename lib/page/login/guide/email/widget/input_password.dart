import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/core/validator/app_validator.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';

class InputPassword extends StatefulWidget {
  final Function(String) onNext;

  const InputPassword({Key? key, required this.onNext}) : super(key: key);

  @override
  _EditNameState createState() => _EditNameState();
}

class _EditNameState extends State<InputPassword> with AppValidatorMixin {
  TextEditingController textEditCtrl = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool isError = false;

  @override
  void initState() {
    super.initState();
    focusNode.unfocus();
    focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    focusNode.dispose();
    textEditCtrl.dispose();
    super.dispose();
  }

  bool isValidPassword(String password) {
    return isPwd(password);
  }

  void _onFocusChange() {
    if (!focusNode.hasFocus) {
      _valid();
    }
  }

  void _valid() {
    setState(() {
      String psd = textEditCtrl.text.trim();
      isError = !isValidPassword(psd);
    });
  }

  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode()); // 隐藏键盘
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibility(
      onChanged: (bool isKeyboardVisible) {
        if (!isKeyboardVisible) {
          if (textEditCtrl.text.isNotEmpty) {
            _valid();
          }
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
            width: double.maxFinite,
            child: TextField(
              controller: textEditCtrl,
              focusNode: focusNode,
              obscureText: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: AppFonts.textFontFamily,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: LanKey.password.tr,
                hintStyle: TextStyle(
                  color: const Color(0xFFA4A4A4),
                  fontSize: 16,
                  fontFamily: AppFonts.textFontFamily,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Color(0xFFE1DFE3)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Color(0xFFE1DFE3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // 启用时的边框圆角
                  borderSide: BorderSide(
                    color: Color(0xFFE1DFE3),
                  ), // 启用时的下划线颜色设置为透明
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0), // 聚焦时的边框圆角
                  borderSide: BorderSide(
                    color: Color(0xFFE1DFE3),
                  ), // 聚焦时的下划线颜色设置为透明
                ),
              ),
              onChanged: (value) {
                if (value.trim().isEmpty && isError) {
                  setState(() {
                    isError = false;
                  });
                }
                if (isValidPassword(value)) {
                  widget.onNext.call(value);
                }
              },
              onEditingComplete: () {
                _hideKeyboard();
                _valid();
              },
              onSubmitted: (value) {
                _hideKeyboard();
                _valid();
              },
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 32, end: 32, top: 6.h),
            width: double.maxFinite,
            child: Text(
              isError
                  ? LanKey.invalidPasswordError.tr
                  : LanKey.invalidPasswordHint.tr,
              style: TextStyle(
                color: isError ? const Color(0xFFFF2200) : Color(0xFF6A686D),
                fontSize: 14,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Divider(height: 16.h, color: Colors.transparent),
        ],
      ),
    );
  }
}
