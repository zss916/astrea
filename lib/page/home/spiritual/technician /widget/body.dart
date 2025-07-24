import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/components/tab/kugou_tabbar.dart';
import 'package:astrea/components/tab/rrect_indicator.dart';
import 'package:astrea/components/tab_bar_delegate.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/spiritual/technician%20/widget/evaluate.dart';
import 'package:astrea/page/home/spiritual/technician%20/widget/follow_btn.dart';
import 'package:astrea/page/home/spiritual/technician%20/widget/introduction.dart';
import 'package:astrea/page/home/spiritual/technician%20/widget/top_bg.dart';
import 'package:astrea/page/home/spiritual/widget/chat_btn.dart';
import 'package:astrea/page/home/spiritual/widget/rating.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  final ScrollController _scrollCtrl = ScrollController();
  double _scrollOffset = 0.0;
  late final TabController tabCtrl;

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(_onScroll);
    tabCtrl = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _scrollOffset = (_scrollCtrl.offset / 250).clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollCtrl,
      headerSliverBuilder: (_, innerBoxIsScrolled) => [
        buildAppBar(),
        buildContent(),
        buildTab(),
      ],
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          TabBarView(
            controller: tabCtrl,
            children: [Introduction(), Evaluate()],
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: buildBottomButton(),
          ),
        ],
      ),
    );
  }

  Widget buildAppBar() => SliverAppBar(
    pinned: true,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    leading: Container(
      margin: EdgeInsetsDirectional.only(start: 16),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () => Get.back(),
            child: Image.asset(
              Assets.imageBackIcon,
              matchTextDirection: true,
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    ),
    title: Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.only(end: 56),
      child: Text(
        _scrollOffset == 1 ? 'myname' : '',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFF323133),
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    expandedHeight: 260,
    flexibleSpace: FlexibleSpaceBar(
      background: TopBg(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          //color: Colors.grey,
          child: Row(
            children: [
              Container(
                //color: Colors.blue,
                margin: EdgeInsetsDirectional.only(top: 80, start: 0),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    PositionedDirectional(
                      top: 26,
                      start: 53,
                      child: Container(
                        padding: EdgeInsetsDirectional.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F1F5),
                          borderRadius: BorderRadiusDirectional.circular(100),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              width: 105,
                              height: 105,
                            ),
                            PositionedDirectional(
                              bottom: 6,
                              end: 6,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Color(0xFFF0F1F5),
                                  ),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(50),
                                  color: Color(0xFF51C75B),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      Assets.imageTechnicianBg7,
                      width: 180,
                      height: 180,
                      matchTextDirection: true,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  //color: Colors.blue,
                  margin: EdgeInsetsDirectional.only(
                    top: 130,
                    end: 16,
                    start: 10,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        child: Text(
                          'MysticHazefdsgfdsgds',
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.06,
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Image.asset(
                              Assets.imageAuthIcon,
                              width: 12,
                              height: 12,
                              matchTextDirection: true,
                            ),
                            Text(
                              '12 years exp',
                              style: TextStyle(
                                color: const Color(0xFF6F4DFF),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Rating(rating: 2, size: Size(15, 15), fontSize: 14),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 5),
                            constraints: BoxConstraints(maxWidth: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '4612',
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: const Color(0xFF323133),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Follow',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: const Color(0xFF91929D),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 5),
                            constraints: BoxConstraints(maxWidth: 60),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '4612',
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: const Color(0xFF323133),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'Fans',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: const Color(0xFF91929D),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
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
              ),
            ],
          ),
        ),
      ),
    ),
    backgroundColor: AppColor.pageBackground.withValues(alpha: _scrollOffset),
  );

  Widget buildContent() => SliverToBoxAdapter(
    child: Container(
      //color: Colors.red,
      margin: EdgeInsetsDirectional.only(start: 24, end: 24, top: 0),
      width: double.maxFinite,
      child: Text(
        '" Starlight guide, cosmic storyteller, me want a beautiful decoding your celestial blueprint." ',
        style: TextStyle(
          color: const Color(0xFF323133),
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.06,
        ),
      ),
    ),
  );

  Widget buildTab() => SliverPersistentHeader(
    pinned: true,
    delegate: StickyTabBarDelegate(
      child: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          height: 60,
          decoration: BoxDecoration(color: AppColor.pageBackground),
          // padding: EdgeInsetsDirectional.only(start: 8, end: 8),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              KuGouTabBar(
                tabs: [
                  Tab(text: "Introduction"),
                  Tab(text: "Evaluate"),
                ],
                controller: tabCtrl,
                labelStyle: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF91929D),
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 22,
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
              Container(
                margin: EdgeInsetsDirectional.only(start: 80, bottom: 20),
                child: Image.asset(
                  Assets.imageTechnicianBg6,
                  matchTextDirection: true,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget buildBottomButton() => Container(
    margin: EdgeInsetsDirectional.only(bottom: 0.h),
    padding: EdgeInsetsDirectional.only(
      bottom: 24.h + 8.h,
      top: 70.h,
      start: 18,
      end: 18,
    ),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0x00EDEDFD), Color(0xFFEDEDFE), Color(0xFFEDEDFE)],
      ),
    ),
    child: Row(
      children: [
        Expanded(flex: 1, child: FollowBtn(isFollowed: false)),
        VerticalDivider(color: Colors.transparent, width: 13),
        Expanded(
          flex: 2,
          child: ChatBtn(
            isBusy: false,
            iconSize: Size(24, 24),
            height: 58,
            fontSize: 18,
            radius: 20,
            title: "\$2/mine",
          ),
        ),
      ],
    ),
  );
}
