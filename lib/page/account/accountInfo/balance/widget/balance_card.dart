import 'package:auto_size_text/auto_size_text.dart' show AutoSizeText;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class BalanceCard extends StatelessWidget {
  final String balance;

  const BalanceCard({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageTools.toRedeem();
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 16, end: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(16),
        ),
        width: double.maxFinite,
        height: 140,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            PositionedDirectional(
              top: 0,
              end: 0,
              child: Image.asset(
                Assets.imageBalanceTop,
                matchTextDirection: true,
                width: 120,
                height: 77,
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 24,
                vertical: 0,
              ),
              width: double.maxFinite,
              height: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.cyan,
                    constraints: BoxConstraints(maxHeight: 70),
                    width: double.maxFinite,
                    // height: 70,
                    margin: EdgeInsetsDirectional.only(end: 120, bottom: 0),
                    child: AutoSizeText(
                      balance,
                      textAlign: TextAlign.start,
                      //maxLines: 1,
                      maxFontSize: 32,
                      minFontSize: 16,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 32,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Text(
                            LanKey.accountBalance.tr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: const Color(0xFF91929D),
                              fontSize: 16,
                              fontFamily: AppFonts.textFontFamily,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsetsDirectional.only(
                          start: 12,
                          end: 4,
                          top: 6,
                          bottom: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF585FC4),
                          borderRadius: BorderRadiusDirectional.circular(50),
                        ),
                        child: Row(
                          children: [
                            Text(
                              LanKey.cash.tr,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: AppFonts.textFontFamily,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(start: 0),
                              child: Image.asset(
                                Assets.imageArrowEnd,
                                matchTextDirection: true,
                                color: Colors.white,
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
