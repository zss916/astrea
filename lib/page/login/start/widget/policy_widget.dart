import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PolicyWidget extends StatelessWidget {
  final Function onServiceTap;
  final Function onPrivacyTap;

  const PolicyWidget({
    super.key,
    required this.onServiceTap,
    required this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: LanKey.startPolicyTitle1.tr,
            children: [
              const TextSpan(text: ' '),
              TextSpan(
                style: TextStyle(
                  fontFamily: AppFonts.textFontFamily,
                  decorationColor: const Color(0xFF766DF8),
                  color: const Color(0xFF766DF8),
                  decoration: TextDecoration.underline,
                ),
                text: LanKey.startTermsOfService.tr,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    debugPrint("onTap:${LanKey.startTermsOfService.tr}");
                    onServiceTap.call();
                  },
              ),
              const TextSpan(text: ' '),
              TextSpan(text: LanKey.startAnd.tr),
              const TextSpan(text: ' '),
              TextSpan(
                style: TextStyle(
                  fontFamily: AppFonts.textFontFamily,
                  decorationColor: const Color(0xFF766DF8),
                  color: const Color(0xFF766DF8),
                  decoration: TextDecoration.underline,
                ),
                text: LanKey.startPrivacyPolicy.tr,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    debugPrint("onTap:${LanKey.startPrivacyPolicy.tr}");
                    onPrivacyTap.call();
                  },
              ),
            ],
            style: TextStyle(
              fontFamily: AppFonts.textFontFamily,
              color: Color(0xFF999999),
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      maxLines: 3,
    );
  }
}
