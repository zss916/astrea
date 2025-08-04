import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/global.dart';
import 'package:astrea/page/home/spiritual/widget/horizontal_listview.dart';
import 'package:astrea/page/home/spiritual/widget/hot_topic.dart';
import 'package:astrea/page/home/spiritual/widget/spiritual_bg.dart';
import 'package:astrea/page/home/spiritual/widget/spiritual_title.dart';
import 'package:flutter/material.dart';

class SpiritualView extends StatelessWidget {
  const SpiritualView({super.key});

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
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.pageBackground,
      body: SafeArea(
        top: false,
        child: SpiritualBg(
          child: Column(
            children: [
              SpiritualTitle(),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: HotTopic()),

                    /*SliverList.builder(
                          itemCount: 6,
                          itemBuilder: (_, i) {
                            return HorizontalListview(
                              title: '🔥 Today\'s top',
                              subTitle:
                                  'Medium is perfect for you and loved by its followers.',
                            );
                          }),*/
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return HorizontalListview(
                          title: '🔥 Today\'s top',
                          subTitle:
                              'Medium is perfect for you and loved by its followers.',
                        );
                      }, childCount: 6),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget old() => Expanded(
    child: SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsetsDirectional.only(bottom: 80),
        child: Column(
          children: [
            HotTopic(),

            ///today
            HorizontalListview(
              title: '🔥 Today\'s top',
              subTitle: 'Medium is perfect for you and loved by its followers.',
            ),

            ///recommend
            HorizontalListview(
              title: '👍 Recommended to you',
              subTitle:
                  "Thousands have praised this legendary medium over time.",
            ),

            ///love
            HorizontalListview(
              title: '💖 Best at interpreting love',
              subTitle:
                  "Spiritual mediums offer accurate predictions and guidance.",
            ),

            ///career
            HorizontalListview(
              title: '💼 Best interprets career',
              subTitle:
                  "Spiritual mediums offer accurate predictions and guidance.",
            ),
          ],
        ),
      ),
    ),
  );
}
