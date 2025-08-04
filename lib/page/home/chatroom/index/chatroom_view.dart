import 'package:astrea/components/bottom_stack_btn.dart';
import 'package:astrea/components/star_level.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/global.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/home/chatroom/index/widget/chatroom_bg.dart';
import 'package:astrea/page/home/chatroom/index/widget/line_state.dart';
import 'package:astrea/page/home/chatroom/index/widget/msg_content.dart';
import 'package:astrea/page/home/chatroom/index/widget/msg_name.dart';
import 'package:astrea/page/home/chatroom/index/widget/msg_time.dart';
import 'package:astrea/page/home/chatroom/index/widget/number_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatroomView extends StatelessWidget {
  const ChatroomView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChatroomBg(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Container(
            margin: EdgeInsetsDirectional.only(start: 10),
            child: Text(
              LanKey.chatroom.tr,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          leadingWidth: 0,
          leading: const SizedBox.shrink(),
          systemOverlayStyle: barStyle,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            ListView.builder(itemCount: 20, itemBuilder: (_, i) => buildItem()),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: BottomStackBtn(
                title: LanKey.exploreMorePsychics.tr,
                margin: EdgeInsetsDirectional.only(bottom: 70.h),
                padding: EdgeInsetsDirectional.only(bottom: 24.h, top: 70.h),
                onTap: () {
                  //todo
                  PageTools.toChat();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem() => Stack(
    alignment: AlignmentDirectional.center,
    children: [
      SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              // color: Colors.black38,
              width: double.maxFinite,
              padding: EdgeInsetsDirectional.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    margin: EdgeInsetsDirectional.only(end: 12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.maxFinite,
                      // color: Colors.black38,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                LineState(state: 1),
                                MsgName(name: 'ddddddxxxxxxxxxxxxx'),
                                StarLevel(level: "9.0"),
                                Spacer(),
                                MsgTime(time: "Monday 19:02"),
                              ],
                            ),
                          ),
                          MsgContent(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 0,
              indent: 16,
              endIndent: 16,
              thickness: 1,
              color: Color(0xFFE6E6E6),
            ),
          ],
        ),
      ),
      PositionedDirectional(top: 15, start: 12, child: NumberTag(number: 101)),
    ],
  );
}
