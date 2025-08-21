import 'package:astrea/components/common_btn.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/core/validator/app_validator.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';

class EditName extends StatefulWidget {
  final Function(String) onNext;

  const EditName({Key? key, required this.onNext}) : super(key: key);

  @override
  _EditNameState createState() => _EditNameState();
}

class _EditNameState extends State<EditName> with AppValidatorMixin {
  bool isEdit = false;
  bool isError = false;

  TextEditingController textEditCtrl = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
    focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    focusNode.unfocus();
    focusNode.removeListener(_onFocusChange);
    focusNode.dispose();
    textEditCtrl.dispose();
    super.dispose();
  }

  bool isValidate(String input) => isMatchName(input);

  void _valid() {
    setState(() {
      String text = textEditCtrl.text.trimRight();
      isError = !isValidate(text);
    });
  }

  void _onFocusChange() {
    if (!focusNode.hasFocus) {
      _valid();
    }
  }

  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode()); // 隐藏键盘
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibility(
      onChanged: (bool isKeyboardVisible) {
        if (!isKeyboardVisible) {
          _valid();
        }
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(
              start: 20.w,
              end: 20.w,
              top: 24.h,
            ),
            width: double.maxFinite,
            child: TextField(
              controller: textEditCtrl,
              focusNode: focusNode,
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: AppFonts.textFontFamily,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: LanKey.editNameHint.tr,
                hintStyle: TextStyle(
                  color: const Color(0xFFA4A4A4),
                  fontSize: 16.sp,
                  fontFamily: AppFonts.textFontFamily,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(color: Color(0xFFE1DFE3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r), // 启用时的边框圆角
                  borderSide: BorderSide(
                    color: Color(0xFFE1DFE3),
                  ), // 启用时的下划线颜色设置为透明
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r), // 聚焦时的边框圆角
                  borderSide: BorderSide(
                    color: Color(0xFFE1DFE3),
                  ), // 聚焦时的下划线颜色设置为透明
                ),
                suffixIcon: isEdit
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            textEditCtrl.clear();
                            isEdit = false;
                            isError = false;
                          });
                        },
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.asset(
                              Assets.imageClear,
                              width: 20.r,
                              height: 20.r,
                              matchTextDirection: true,
                            ),
                          ],
                        ),
                      )
                    : null,
              ),
              onChanged: (value) {
                if (value.trimRight().isEmpty) {
                  setState(() {
                    isError = false;
                  });
                } else {
                  setState(() {
                    isError = !isValidate(value.trimRight());
                  });
                }

                setState(() {
                  isEdit = value.isNotEmpty;
                });
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
          if (isError)
            Container(
              constraints: BoxConstraints(minHeight: 20.h),
              margin: EdgeInsetsDirectional.only(
                start: 20.w,
                end: 20.w,
                top: 12.h,
              ),
              width: double.maxFinite,
              child: Text(
                LanKey.nameMatchErrorHint.tr,
                style: TextStyle(
                  color: const Color(0xFFFF2200),
                  fontSize: 14.sp,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
            )
          else
            SizedBox(height: 20.h),
          CommonBtn(
            isClickable: isEdit && (!isError),
            margin: EdgeInsetsDirectional.only(
              start: 20.w,
              end: 20.w,
              top: 16.h,
            ),
            title: LanKey.next.tr,
            onTap: () {
              if (isEdit && textEditCtrl.text.trimRight().isNotEmpty) {
                focusNode.unfocus();
                if (isValidate(textEditCtrl.text.trimRight())) {
                  widget.onNext.call(textEditCtrl.text.trimRight());
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
