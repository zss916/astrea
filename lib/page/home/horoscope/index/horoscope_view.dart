import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_common_setting.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_content/content/horoscope_content.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_content/star_content.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_list_view/horoscope_listview.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_tabbar.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_tabview.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'logic.dart';

class HoroscopeView extends StatefulWidget {
  const HoroscopeView({super.key});

  @override
  State<HoroscopeView> createState() => _HoroscopeViewState();
}

class _HoroscopeViewState extends State<HoroscopeView>
    with SingleTickerProviderStateMixin {
  late final TabController tabCtrl;
  bool isShowOneself = true;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.pageBackground,
        surfaceTintColor: AppColor.pageBackground,
        toolbarHeight: 0,
        leading: const SizedBox.shrink(),
        systemOverlayStyle: barStyle,
      ),
      backgroundColor: AppColor.pageBackground,
      body: GetBuilder<HoroscopeLogic>(
        init: HoroscopeLogic(),
        builder: (logic) {
          return Column(
            children: [
              /*SvgPicture.network(
                    logic.natalChartImage,
                    width: 150,
                    height: 150,
                    placeholderBuilder: (context) =>
                        CircularProgressIndicator(),
                    errorBuilder: (con, _, p) => Container(
                      color: Colors.blue,
                    ),
                  ),*/
              HoroscopeTitle(),
              Expanded(
                child: NestedScrollView(
                  headerSliverBuilder: (_, w) {
                    return [
                      ///title
                      buildTitle(
                        logic,
                        isNewUser: logic.isNewUser,
                        avatar: logic.avatar,
                      ),

                      ///content
                      buildContent(logic: logic),

                      ///tabbar
                      if (isShowOneself) buildTabBar(),
                    ];
                  },
                  body: (isShowOneself)
                      ? Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            TabBarView(
                              controller: tabCtrl,
                              children: [
                                HoroscopeTabview(
                                  tabIndex: 0,
                                  content: logic.yesterdaySummary,
                                ),
                                HoroscopeTabview(
                                  tabIndex: 1,
                                  content: logic.todaySummary,
                                  love: logic.loveValue,
                                  wealth: logic.wealthValue,
                                  career: logic.careerValue,
                                  guide: logic.todayGuide,
                                  should: logic.todayShould,
                                  avoid: logic.todayAvoid,
                                  loveContent: logic.todayLove,
                                  careerContent: logic.todayCareer,
                                  wealthContent: logic.todayWealth,
                                ),
                                HoroscopeTabview(
                                  tabIndex: 2,
                                  content: logic.tomorrowSummary,
                                  guide: logic.tomorrowGuide,
                                ),
                                HoroscopeTabview(
                                  tabIndex: 3,
                                  content: logic.weekSummary,
                                  guide: logic.weekGuide,
                                ),
                                HoroscopeTabview(
                                  tabIndex: 4,
                                  content: logic.monthSummary,
                                ),
                                HoroscopeTabview(
                                  tabIndex: 5,
                                  content: logic.yearSummary,
                                ),
                              ],
                            ),
                            /*PositionedDirectional(
                        bottom: 0,
                        start: 0,
                        end: 0,
                        child: BottomStackBtn(
                          title: LanKey.openVip.tr,
                          margin: EdgeInsetsDirectional.only(bottom: 70.h),
                          padding: EdgeInsetsDirectional.only(
                              bottom: 24.h, top: 70.h),
                          onTap: () {
                            //todo
                          },
                        ))*/
                          ],
                        )
                      : SizedBox.shrink(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildTitle(
    HoroscopeLogic logic, {
    required bool isNewUser,
    required String avatar,
  }) {
    return SliverToBoxAdapter(
      child: HoroscopeListview(
        avatar: avatar,
        isNewUser: isNewUser,
        onAdd: () {
          PageTools.toAddFile();
        },
        onOneself: () {
          setState(() {
            isShowOneself = true;
          });
        },
        onSelect: (i) {
          setState(() {
            isShowOneself = false;
            selectedIndex = i;
          });
        },
      ),
    );
  }

  Widget buildContent({required HoroscopeLogic logic}) {
    return SliverToBoxAdapter(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          if (isShowOneself)
            HoroscopeContent(logic: logic)
          else
            StarContent(index: selectedIndex),
        ],
      ),
    );
  }

  Widget buildTabBar() {
    return HoroscopeTabBar(tabCtrl: tabCtrl);
  }
}
