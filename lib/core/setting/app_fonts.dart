import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class AppFonts {
  ///文字Family
  static const String titleFontFamily = 'AVENIR-BLACK';
  static const String subTitleFontFamily = 'Avenir-Medium';
  static const String? textFontFamily = null;
  static const String? rateFontFamily = null;
}

class AppTextStyle {
  ///最大标题样式
  static TextStyle get titleCommonStyle {
    return TextStyle(
      fontFamily: AppFonts.titleFontFamily,
      fontSize: 24.sp,
      color: AppColor.textTitleColor,
    );
  }

  ///小标题样式
  static TextStyle get subTitleStyle {
    return TextStyle(
      fontFamily: AppFonts.textFontFamily,
      fontSize: 18.sp,
      color: AppColor.textTitleColor,
    );
  }

  ///内容样式
  static TextStyle get contentStyle14 {
    return TextStyle(fontSize: 14.sp, color: AppColor.contentTitleColor);
  }

  static TextStyle get contentStyle12 {
    return TextStyle(fontSize: 12.sp, color: AppColor.contentTitleColor);
  }
}
