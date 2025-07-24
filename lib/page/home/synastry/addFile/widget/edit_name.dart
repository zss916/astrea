import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';

class EditName extends StatefulWidget {
  final String nickName;
  final Function(String) onChange;
  const EditName({super.key, required this.nickName, required this.onChange});

  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  TextEditingController textEditCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.nickName.isNotEmpty) {
      textEditCtrl.text = widget.nickName;
    }
  }

  @override
  void dispose() {
    textEditCtrl.dispose();
    super.dispose();
  }

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
              controller: textEditCtrl,
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
                focusedBorder: InputBorder.none,
              ),
              onChanged: (value) {
                widget.onChange.call(value);
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
