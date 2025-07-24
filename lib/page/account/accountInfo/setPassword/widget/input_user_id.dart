import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/translations/en.dart';

class InputUserId extends StatelessWidget {
  final Function(String) onChange;
  const InputUserId({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 20.h, start: 16, end: 16),
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Text(
              LanKey.userID.tr,
              textAlign: TextAlign.start,
              style: TextStyle(color: const Color(0xFF6A676C), fontSize: 18),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 16.h),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(16),
            ),
            width: double.maxFinite,
            child: TextField(
              //autofocus: true,
              style: TextStyle(color: const Color(0xFF323133), fontSize: 16),
              onChanged: (value) {
                onChange.call(value);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "xxxxxxxxxxxxxxx",
                hintStyle: TextStyle(
                  color: const Color(0xFFBDBDBD),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
