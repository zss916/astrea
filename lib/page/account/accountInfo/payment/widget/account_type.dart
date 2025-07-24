import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class AccountType extends StatefulWidget {
  final Function(dynamic) onChecked;
  const AccountType({super.key, required this.onChecked});

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  int radioIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 16, end: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 16.h),
            width: double.maxFinite,
            child: Text(
              LanKey.accountType.tr,
              style: TextStyle(
                color: const Color(0xFF6A676C),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  radioIndex = 1;
                  widget.onChecked.call(radioIndex);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(16),
                ),
                padding: EdgeInsetsDirectional.all(16),
                width: double.maxFinite,
                child: Row(
                  children: [
                    if (radioIndex == 1)
                      Image.asset(
                        Assets.imageRadioS,
                        width: 21,
                        height: 21,
                        matchTextDirection: true,
                      )
                    else
                      Image.asset(
                        Assets.imageRadioU,
                        width: 21,
                        height: 21,
                        matchTextDirection: true,
                      ),
                    VerticalDivider(width: 16, color: Colors.transparent),
                    Expanded(
                      child: Text(
                        LanKey.check.tr,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            height: 16.h,
            indent: 16,
            endIndent: 16,
            color: Colors.transparent,
          ),
          Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  radioIndex = 2;
                  widget.onChecked.call(radioIndex);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(16),
                ),
                padding: EdgeInsetsDirectional.all(16),
                width: double.maxFinite,
                child: Row(
                  children: [
                    if (radioIndex == 2)
                      Image.asset(
                        Assets.imageRadioS,
                        width: 21,
                        height: 21,
                        matchTextDirection: true,
                      )
                    else
                      Image.asset(
                        Assets.imageRadioU,
                        width: 21,
                        height: 21,
                        matchTextDirection: true,
                      ),
                    VerticalDivider(width: 16, color: Colors.transparent),
                    Expanded(
                      child: Text(
                        LanKey.saving.tr,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
