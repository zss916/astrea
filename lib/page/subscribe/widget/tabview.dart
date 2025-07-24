import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart' show Assets;
import 'package:astrea/page/subscribe/widget/tab_card.dart';

class SubscribeTbaView extends StatefulWidget {
  const SubscribeTbaView({super.key});

  @override
  _SubscribeTbaViewState createState() => _SubscribeTbaViewState();
}

class _SubscribeTbaViewState extends State<SubscribeTbaView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (_, w) {
        return [
          SliverAppBar(
            surfaceTintColor: Colors.white,
            pinned: true,
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
            // floating: true,
            expandedHeight: 320,
            forceElevated: true,
            elevation: 0.5,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 10),
                      child: Image.asset(
                        Assets.imageSubscribeTop,
                        matchTextDirection: true,
                        width: 110,
                        height: 51,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 20, end: 20),
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 10.h),
                            child: Image.asset(
                              Assets.imageSubscribeCenter,
                              width: 260,
                              height: 203,
                              matchTextDirection: true,
                            ),
                          ),
                          PositionedDirectional(
                            start: 0,
                            top: 40,
                            child: Image.asset(
                              Assets.imageSubscribeLeft,
                              matchTextDirection: true,
                              width: 25,
                              height: 33,
                            ),
                          ),
                          PositionedDirectional(
                            end: 0,
                            top: 0,
                            child: Image.asset(
                              Assets.imageSubscribeRight,
                              matchTextDirection: true,
                              width: 38,
                            ),
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(
                              top: 12,
                              bottom: 10,
                              start: 10,
                              end: 15,
                            ),
                            //width: 270,
                            child: Text(
                              LanKey.subscribeTip.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF323133),
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(52.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFF6A686D),
                ),
                margin: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
                padding: EdgeInsets.all(2),
                child: TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 0,
                  ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(fontSize: 13, color: Colors.black),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  tabs: [
                    Tab(text: LanKey.quarterly.tr),
                    Tab(text: LanKey.annual.tr),
                    Tab(text: LanKey.permanent.tr),
                  ],
                ),
              ),
            ),
          ),
        ];
      },
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 16, end: 16, top: 22.h),
        child: TabBarView(
          controller: _tabController,
          children: [
            TabCard(),
            Center(child: Text('选项卡2内容')),
            Center(child: Text('选项卡3内容')),
          ],
        ),
      ),
    );
  }
}
