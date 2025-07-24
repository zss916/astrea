import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class SelectTag extends StatefulWidget {
  const SelectTag({super.key});

  @override
  State<SelectTag> createState() => _SelectTagState();
}

class _SelectTagState extends State<SelectTag> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isShow = !isShow;
            });
          },
          child: Container(
            padding: EdgeInsetsDirectional.symmetric(vertical: 16),
            width: double.maxFinite,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(end: 10),
                  child: Text(
                    LanKey.tagSelection.tr,
                    style: TextStyle(
                      color: const Color(0xFF6A676C),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LanKey.selectRelationship.tr,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0xFF91929D),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Transform.rotate(
                      angle: isShow ? (pi / 2) : 0,
                      child: Image.asset(
                        Assets.imageArrowEnd,
                        width: 24,
                        height: 24,
                        matchTextDirection: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (isShow)
          SizedBox(
            width: double.maxFinite,
            child: Wrap(
              spacing: 16.w,
              runSpacing: 16.h,
              children: [
                ...[
                  "Family",
                  "Lover",
                  "Friend",
                  "Peer",
                  "Supervisor",
                  "Subordinate",
                  "Business Parners",
                ].map(
                  (e) => Container(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 25,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadiusDirectional.circular(50),
                    ),
                    child: Text(
                      e,
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
