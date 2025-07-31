import 'package:astrea/core/bus/app_event_bus.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/horoscope/index/logic.dart';
import 'package:astrea/page/home/horoscope/index/widget/add_friend_tip_box.dart';
import 'package:astrea/page/home/horoscope/index/widget/horoscope_list_view/horoscope_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoroscopeListview extends StatelessWidget {
  final Function(int)? onSelect;
  final Function? onAdd;
  final Function? onOneself;
  final Function? onSynastry;
  final HoroscopeLogic logic;
  const HoroscopeListview({
    super.key,
    required this.logic,
    this.onSelect,
    this.onAdd,
    this.onOneself,
    this.onSynastry,
  });

  List<String> get list => [
    Assets.imageImgAries,
    Assets.imageImgTaurus,
    Assets.imageImgGemini,
    Assets.imageImgCancer,
    Assets.imageImgLeo,
    Assets.imageImgVirgo,
    Assets.imageImgLibra,
    Assets.imageImgScorpio,
    Assets.imageImgSagittarius,
    Assets.imageImgCapricom,
    Assets.imageImgAquarius,
    Assets.imageImgPisces,
  ];

  List<String> get listTitle => [
    LanKey.aries.tr,
    LanKey.taurus.tr,
    LanKey.gemini.tr,
    LanKey.cancer.tr,
    LanKey.leo.tr,
    LanKey.virgo.tr,
    LanKey.libra.tr,
    LanKey.scorpio.tr,
    LanKey.sagittarius.tr,
    LanKey.capricorn.tr,
    LanKey.aquarius.tr,
    LanKey.pisces.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      padding: EdgeInsetsDirectional.only(top: 0),
      margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 0),
      height: 90,
      width: double.maxFinite,
      child: Row(
        children: [
          Expanded(
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        //color: Colors.black,
                        padding: EdgeInsetsDirectional.only(
                          top: 22,
                          end: logic.isAddFriend ? 0 : 10,
                        ),
                        child: Row(
                          children: [
                            ///add
                            InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {
                                onAdd?.call();
                              },
                              child: buildAdd(),
                            ),

                            /// oneself
                            InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {
                                onOneself?.call();
                              },
                              child: buildOneself(logic.avatar, logic.nickName),
                            ),
                          ],
                        ),
                      ),

                      PositionedDirectional(
                        top: 0,
                        start: 0,
                        child: AddFriendTip(logic: logic),
                      ),
                    ],
                  ),
                ),

                ///friends
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => Container(
                      margin: EdgeInsetsDirectional.only(start: 0, top: 22),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          // onSelect?.call(i);
                        },
                        child: Container(
                          margin: EdgeInsetsDirectional.only(start: 0),
                          child: buildFriend(
                            logic.friends[i].headImg ?? "",
                            logic.friends[i].nickName ?? "",
                          ),
                        ),
                      ),
                    ),
                    childCount: logic.friends.length,
                  ),
                ),

                /// star
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => Container(
                      margin: EdgeInsetsDirectional.only(top: 22),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          onSelect?.call(i);
                        },
                        child: HoroscopeListItem(
                          icon: list[i],
                          title: listTitle[i],
                        ),
                      ),
                    ),
                    childCount: 12,
                  ),
                ),
              ],
            ),
          ),

          buildSynastry(),
        ],
      ),
    );
  }

  Widget buildAdd() {
    return Column(
      children: [
        Image.asset(
          Assets.imageAdd,
          width: 48,
          height: 48,
          matchTextDirection: true,
        ),
        Spacer(),
        Text(
          LanKey.addFriends.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF323133),
            fontSize: 12,
            fontFamily: AppFonts.textFontFamily,
          ),
        ),
      ],
    );
  }

  Widget buildOneself(String avatar, String name) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              padding: EdgeInsetsDirectional.all(1.6),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xFF9292CA)),
                // color: Color(0xFFEDEDFE),
                borderRadius: BorderRadiusDirectional.circular(50),
              ),
              width: 48,
              height: 48,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage(Assets.imageHomeAvatar),
                  ),
                ),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: avatar.isEmpty
                      ? BoxDecoration()
                      : BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: NetworkImage(avatar),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadiusDirectional.circular(50),
                        ),
                ),
              ),
            ),
            PositionedDirectional(
              bottom: 3,
              end: 0,
              child: Image.asset(
                Assets.imagePersion,
                matchTextDirection: true,
                width: 12,
                height: 12,
              ),
            ),
          ],
        ),
        Spacer(),
        SizedBox(
          width: 65,
          child: Text(
            name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFF323133),
              fontSize: 12,
              fontFamily: AppFonts.textFontFamily,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildFriend(String avatar, String name) {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(top: 0),
          clipBehavior: Clip.hardEdge,
          padding: EdgeInsetsDirectional.all(1.6),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Color(0xFF9292CA)),
            // color: Color(0xFFEDEDFE),
            borderRadius: BorderRadiusDirectional.circular(50),
          ),
          width: 48,
          height: 48,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(50),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage(Assets.imageFriendDefaultIcon),
              ),
            ),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: avatar.isEmpty
                  ? BoxDecoration()
                  : BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: NetworkImage(avatar),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadiusDirectional.circular(50),
                    ),
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          width: 65,
          child: Text(
            name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFF323133),
              fontSize: 12,
              fontFamily: AppFonts.textFontFamily,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSynastry() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 22),
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          AppEventBus.eventBus.fire(TabEvent(1));
        },
        child: Column(
          children: [
            Image.asset(
              Assets.imageSynastryIcons,
              width: 48,
              height: 48,
              matchTextDirection: true,
            ),
            Spacer(),
            Text(
              LanKey.synastry.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF585FC4),
                fontSize: 12,
                fontFamily: AppFonts.textFontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
