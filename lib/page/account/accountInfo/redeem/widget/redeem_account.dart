import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/account/accountInfo/redeem/widget/account_display.dart';

class RedeemAccount extends StatelessWidget {
  final String account;
  final Function onTap;
  const RedeemAccount({super.key, required this.account, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 80,
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            onTap.call();
          },
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: EdgeInsetsDirectional.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          'Account',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: AccountDisplay(account: account),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 8),
                  child: Image.asset(
                    Assets.imageArrowEnd,
                    width: 24,
                    height: 24,
                    matchTextDirection: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
