import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/core/validator/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditName extends StatefulWidget {
  final String nickName;
  final Function(String) onChange;
  final FocusNode focusNode;
  const EditName({
    super.key,
    required this.nickName,
    required this.onChange,
    required this.focusNode,
  });

  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> with AppValidatorMixin {
  TextEditingController textEditCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.focusNode.unfocus();
    if (widget.nickName.isNotEmpty) {
      setState(() {
        textEditCtrl.text = widget.nickName;
      });
    }
  }

  /* @override
  void didUpdateWidget(covariant EditName oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.nickName.isNotEmpty) {
      setState(() {
        textEditCtrl.text = widget.nickName;
      });
    }
  }*/

  @override
  void dispose() {
    widget.focusNode.unfocus();
    widget.focusNode.dispose();
    textEditCtrl.dispose();
    super.dispose();
  }

  //bool isValidate(String input) => isMatchName(input);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 35.h),
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.only(end: 10),
            child: Text(
              LanKey.name.tr,
              style: TextStyle(
                color: AppColor.contentTitleColor,
                fontSize: 14.sp,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            child: TextField(
              focusNode: widget.focusNode,
              controller: textEditCtrl,
              textAlign: TextAlign.start,
              /* inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9+]+$')),
              ],*/
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: AppFonts.textFontFamily,
              ),
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                filled: true,
                hintText: LanKey.editNameHint.tr,
                hintStyle: TextStyle(
                  color: const Color(0xFF91929D),
                  fontSize: 18.sp,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
                errorBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (value) {
                widget.onChange.call(value.trimRight());
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*class EditName extends StatelessWidget {
  final Function(String) onChange;
  const EditName({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 40.h),
      height: 72,
      width: double.maxFinite,
      child: Row(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 10),
            child: Text(
              LanKey.name.tr,
              style: TextStyle(
                color: const Color(0xFF6A676C),
                fontSize: 18,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
              child: TextField(
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 18,
              fontFamily: AppFonts.textFontFamily,
            ),
            decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                hintText: LanKey.editNameHint.tr,
                hintStyle: TextStyle(
                  color: const Color(0xFF91929D),
                  fontSize: 18,
                  fontFamily: AppFonts.textFontFamily,
                  fontWeight: FontWeight.w400,
                ),
                errorBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
            onChanged: (value) {
              onChange.call(value);
            },
          ))
        ],
      ),
    );
  }
}*/
