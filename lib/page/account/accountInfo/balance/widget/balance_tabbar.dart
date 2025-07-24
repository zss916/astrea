import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/components/tab/kugou_tabbar.dart';
import 'package:astrea/components/tab/rrect_indicator.dart';
import 'package:astrea/components/tab_bar_delegate.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';

class BalanceTabBar extends StatelessWidget {
  final TabController tabCtrl;

  const BalanceTabBar({super.key, required this.tabCtrl});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(
        child: PreferredSize(
          preferredSize: const Size.fromHeight(36),
          child: Container(
            decoration: BoxDecoration(color: AppColor.pageBackground),
            padding: EdgeInsetsDirectional.only(start: 8, end: 8),
            child: KuGouTabBar(
              tabs: [
                Tab(text: LanKey.all.tr),
                Tab(text: LanKey.income.tr),
                Tab(text: LanKey.expenses.tr),
              ],
              controller: tabCtrl,
              labelStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                fontFamily: AppFonts.textFontFamily,
                color: Color(0xFF91929D),
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 22,
                fontFamily: AppFonts.textFontFamily,
                color: Color(0xFF323133),
                fontWeight: FontWeight.w400,
              ),
              isScrollable: true,
              padding: EdgeInsets.zero,
              labelColor: Color(0xFF323133),
              unselectedLabelColor: Color(0xFF91929D),
              indicator: const RRecTabIndicator(
                radius: 10,
                insets: EdgeInsets.only(bottom: 2),
                color: Color(0xFF585FC4),
              ),
              indicatorMinWidth: 15,
            ),
          ),
        ),
      ),
    );
  }
}
