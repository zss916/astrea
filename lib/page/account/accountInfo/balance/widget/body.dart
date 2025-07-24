import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/page/account/accountInfo/balance/widget/balance_card.dart';
import 'package:astrea/page/account/accountInfo/balance/widget/balance_tabbar.dart';
import 'package:astrea/page/account/accountInfo/balance/widget/expenses_state.dart';
import 'package:astrea/page/account/accountInfo/balance/widget/price_text.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late final TabController tabCtrl;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (_, w) {
        return [
          SliverPadding(padding: EdgeInsetsDirectional.only(top: 20.h)),
          SliverToBoxAdapter(child: BalanceCard(balance: "\$ 987.200")),
          SliverPadding(padding: EdgeInsetsDirectional.only(top: 16.h)),
          BalanceTabBar(tabCtrl: tabCtrl),
        ];
      },
      body: TabBarView(
        controller: tabCtrl,
        children: [buildListView(), buildListView(), buildListView()],
      ),
    );
  }

  Widget buildListView() => ListView.builder(
    padding: EdgeInsetsDirectional.only(top: 16.h),
    prototypeItem: Container(
      margin: EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(16),
      ),
      width: double.maxFinite,
      height: 86,
    ),
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 30,
    //itemExtent: 86,
    itemBuilder: (_, i) => GestureDetector(
      onTap: () {
        //todo
        PageTools.toRewardDetails();
      },
      child: Container(
        padding: EdgeInsetsDirectional.all(16),
        margin: EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(16),
        ),
        width: 370,
        height: 86,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'Expenses',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 16,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: AutoSizeText(
                      '09/09/2020 01:09:23 PM',
                      maxFontSize: 14,
                      minFontSize: 10,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xFF91929D),
                        fontSize: 14,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(width: 10, color: Colors.transparent),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PriceText(price: '-10.1'),
                ExpensesState(state: 1),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
