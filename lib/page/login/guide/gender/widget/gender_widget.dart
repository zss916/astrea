import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GenderWidget extends StatelessWidget {
  final String title;
  final String icon;
  final bool isChecked;

  const GenderWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return buildScaleRatioWidget();
    return LayoutBuilder(
      builder: (context, constraints) {
        double w = constraints.maxWidth;
        if (w > 360) {
          return buildSexWidget();
        } else {
          return buildAspectRatioWidget();
        }
      },
    );
  }

  Widget buildAspectRatioWidget() => SizedBox(
    width: (Get.width - 16.w - 40.w) / 2,
    child: AspectRatio(aspectRatio: 151 / 168, child: buildSexWidget()),
  );

  Widget buildSexWidget() => Stack(
    alignment: AlignmentDirectional.center,
    children: [
      SvgPicture.asset(
        isChecked ? Assets.svgSexBorder : Assets.svgSexBorder2,
        width: 151,
        height: 168,
      ),

      SizedBox(
        width: 151,
        height: 168,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(bottom: 12),
              child: Image.asset(
                icon,
                matchTextDirection: true,
                width: 30,
                height: 29,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 18,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget buildScaleRatioWidget() =>
      LayoutBuilder(builder: (context, constraints) {
       final screenSize = MediaQuery.of(context).size;
       final screenWidth = screenSize.width;
        // 计算缩放比例
        double scaleRatio = screenWidth / 375.0;
       // 限制缩放范围，避免过大或过小
       scaleRatio = scaleRatio.clamp(0.7, 1);
        return Transform.scale(scale: scaleRatio, child: buildSexWidget());
      });
}
