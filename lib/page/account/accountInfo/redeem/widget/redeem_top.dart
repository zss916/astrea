import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class RedeemTop extends StatelessWidget {
  final String balance;

  const RedeemTop({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {
              //todo
            },
            child: Row(
              children: [
                Text(
                  LanKey.redeem.tr,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 5.w),
                  child: Image.asset(
                    Assets.imageProblem,
                    matchTextDirection: true,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: LanKey.coinsBalance.tr,
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.60),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: balance,
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.80),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
