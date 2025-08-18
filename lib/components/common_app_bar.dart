import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/setting/global.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///no title appBar
AppBar get noTitleAppBar => AppBar(
  backgroundColor: Colors.transparent,
  toolbarHeight: 0,
  leading: const SizedBox.shrink(),
  systemOverlayStyle: barStyle,
);

///base appBar
class ComAppBar extends AppBar {
  ComAppBar({
    super.key,
    String? title,
    Widget? leading,
    bool? centerTitle,
    super.actions,
    Color? backgroundColor,
    super.bottom,
    SystemUiOverlayStyle? systemOverlayStyle,
    Widget? titleWidget,
    bool isTextDark = true,
    Function? back,
    bool? isSetBg,
  }) : super(
         backgroundColor: backgroundColor ?? Colors.transparent,
         elevation: 0,
         title:
             titleWidget ??
             Text(
               title ?? '',
               maxLines: 1,
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: isTextDark ? AppColor.textTitleColor : Colors.white,
                 fontSize: 22.sp,
                 fontFamily: AppFonts.textFontFamily,
                 fontWeight: FontWeight.w500,
               ),
             ),
         leading:
             leading ??
             UnconstrainedBox(
               child: InkWell(
                 borderRadius: BorderRadius.circular(30),
                 onTap: () {
                   if (back == null) {
                     //Get.back();
                     Navigator.maybePop(Get.context!);
                   } else {
                     back.call();
                   }
                 },
                 child: Container(
                   padding: const EdgeInsetsDirectional.all(5),
                   child: Image.asset(
                     Assets.imageBack,
                     matchTextDirection: true,
                     width: 30,
                     height: 30,
                   ),
                 ),
               ),
             ),
         centerTitle: centerTitle ?? true,
         foregroundColor: Colors.transparent,
         surfaceTintColor: Colors.transparent,
         systemOverlayStyle: barStyle,
       );
}
