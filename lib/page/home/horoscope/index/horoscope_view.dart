import 'package:astrea/components/bottom_stack_btn.dart';
import 'package:astrea/components/loading_widget.dart';
import 'package:astrea/core/enum/view_state.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/global.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/home/horoscope/index/logic.dart';
import 'package:astrea/page/home/horoscope/index/widget/home_refresh.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_content/content/horoscope_content.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_content/star_content.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_list_view/horoscope_listview.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_tabbar.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_tabview.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_title.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' hide RefreshIndicator;

class HoroscopeView extends StatefulWidget {
  const HoroscopeView({super.key});

  @override
  State<HoroscopeView> createState() => _HoroscopeViewState();
}

class _HoroscopeViewState extends State<HoroscopeView>
    with SingleTickerProviderStateMixin {
  late final TabController tabCtrl;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 6, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    super.dispose();
  }

  final RefreshController refreshCtrl = RefreshController(
    initialRefresh: false,
    initialLoadStatus: LoadStatus.canLoading,
  );

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
              RepaintBoundary(child: HoroscopeTitle()),
              // buildTitle(logic),
              Expanded(child: buildBody(logic)),
            ],
          );
        },
      ),
    );
  }

  /// body
  Widget buildBody(HoroscopeLogic logic) {
    return NestedScrollView(
      headerSliverBuilder: (_, w) {
        return [
          ///title
          SliverToBoxAdapter(child: buildTitle(logic)),

          ///content
          // if (isShowOneself && logic.viewState == 0) buildContent(logic: logic),
          if (logic.isShowOneself &&
              logic.viewState == HomeViewState.data.index)
            SliverToBoxAdapter(child: HoroscopeContent(logic: logic)),

          ///tabbar
          if (logic.isShowOneself &&
              logic.viewState == HomeViewState.data.index)
            buildTabBar(),
        ];
      },

      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          (logic.isShowOneself)
              ? Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    if (logic.viewState == HomeViewState.data.index)
                      buildTabViewBody(logic),
                    if (logic.viewState == HomeViewState.loading.index)
                      Container(
                        margin: EdgeInsetsDirectional.only(bottom: 140),
                        child: LoadingWidget(),
                      ),
                    if (logic.viewState == HomeViewState.reload.index)
                      HomeRefresh(logic: logic),
                  ],
                )
              : buildStarWidget(index: logic.selectedStarIndex),
        ],
      ),
    );
  }

  /// refresh
  Widget buildRefresh(HoroscopeLogic logic) {
    return RefreshIndicator(
      displacement: 40.h,
      notificationPredicate: (notification) {
        return true;
      },
      child: buildBody(logic),
      onRefresh: () async {
        logic.toRefresh();
      },
    );
  }

  Widget buildTabViewBody(HoroscopeLogic logic) => Stack(
    alignment: AlignmentDirectional.topCenter,
    children: [
      TabBarView(
        controller: tabCtrl,
        children: [
          HoroscopeTabview(tabIndex: 0, content: logic.yesterdaySummary),
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
          HoroscopeTabview(tabIndex: 4, content: logic.monthSummary),
          HoroscopeTabview(tabIndex: 5, content: logic.yearSummary),
        ],
      ),
    ],
  );

  Widget buildStarWidget({required int index}) => Column(
    children: [
      StarContent(index: index),
      Spacer(),
    ],
  );

  Widget buildTitle(HoroscopeLogic logic) => HoroscopeListview(
    logic: logic,
    onAdd: () {
      PageTools.toAddFile(
        homeToAdd: true,
        onBack: (value) {
          setState(() {
            logic.isShowOneself = true;
            logic.isCheckUser = false;
            logic.starList.forEachIndexed((index, element) {
              element.isChecked = false;
            });
            logic.friends.insert(0, value);
            logic.friends.forEachIndexed((index, element) {
              element.isChecked = (element.id == value.id);
            });
          });

          logic.changeReport(
            id: value.id.toString(),
            index: logic.friends.indexWhere(
              (element) => element.id == value.id,
            ),
            isOneself: false,
          );
        },
      );
    },
    onOneself: () {
      setState(() {
        logic.isShowOneself = true;
        logic.isCheckUser = true;
        logic.starList.forEachIndexed((index, element) {
          element.isChecked = false;
        });
        logic.friends.forEachIndexed((index, element) {
          element.isChecked = false;
        });
      });
      logic.changeReport(isOneself: true);
    },
    onFriends: (i) {
      setState(() {
        logic.isShowOneself = true;
        logic.isCheckUser = false;
        logic.starList.forEachIndexed((index, element) {
          element.isChecked = false;
        });
        logic.friends.forEachIndexed((index, element) {
          element.isChecked = index == i;
        });
      });
      int? reportId = logic.friends[i].id;
      if (reportId != null) {
        logic.changeReport(
          id: logic.friends[i].id.toString(),
          index: i,
          isOneself: false,
        );
      }
    },
    onSelect: (i) {
      setState(() {
        logic.isShowOneself = false;
        logic.selectedStarIndex = i;
        logic.isCheckUser = false;
        logic.friends.forEachIndexed((index, element) {
          element.isChecked = false;
        });
        logic.starList.forEachIndexed((index, element) {
          element.isChecked = index == i;
        });
      });
    },
  );

  Widget buildTabBar() => HoroscopeTabBar(tabCtrl: tabCtrl);

  @Deprecated("hide")
  Widget buildOpenVip() => PositionedDirectional(
    bottom: 0,
    start: 0,
    end: 0,
    child: BottomStackBtn(
      title: LanKey.openVip.tr,
      margin: EdgeInsetsDirectional.only(bottom: 70.h),
      padding: EdgeInsetsDirectional.only(bottom: 24.h, top: 70.h),
      onTap: () {
        //todo
      },
    ),
  );
}
