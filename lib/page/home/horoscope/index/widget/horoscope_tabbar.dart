import 'package:astrea/components/tab/kugou_tabbar.dart';
import 'package:astrea/components/tab/rrect_indicator.dart';
import 'package:astrea/components/tab_bar_delegate.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HoroscopeTabBar extends StatelessWidget {
  final TabController tabCtrl;

  const HoroscopeTabBar({super.key, required this.tabCtrl});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(
        child: PreferredSize(
          preferredSize: Size.fromHeight(44.h),
          child: Container(
            decoration: BoxDecoration(color: AppColor.pageBackground),
            padding: EdgeInsetsDirectional.only(start: 4.w, end: 4.w),
            child: KuGouTabBar(
              tabs: [
                Tab(text: LanKey.yesterday.tr),
                Tab(text: LanKey.today.tr),
                Tab(text: LanKey.tomorrow.tr),
                Tab(text: LanKey.weekly.tr),
                Tab(text: LanKey.monthly.tr),
                Tab(text: LanKey.yearly.tr),
              ],
              controller: tabCtrl,
              labelStyle: TextStyle(
                fontSize: 20.sp,
                fontFamily: AppFonts.textFontFamily,
                fontWeight: FontWeight.w500,
                color: Color(0xFF91929D),
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 20.sp,
                fontFamily: AppFonts.textFontFamily,
                color: Color(0xFF323133),
                fontWeight: FontWeight.w500,
              ),
              isScrollable: true,
              padding: EdgeInsets.zero,
              labelColor: Color(0xFF323133),
              unselectedLabelColor: Color(0xFF91929D),
              indicator: RRecTabIndicator(
                radius: 10.r,
                insets: EdgeInsets.only(bottom: 2.h),
                color: Color(0xFF585FC4),
              ),
              indicatorMinWidth: 15.w,
            ),
          ),
        ),
      ),
    );
  }
}
