import 'package:bubble_box/bubble_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMsgItem extends StatelessWidget {
  final String msg;
  final bool isMe;
  const ChatMsgItem({super.key, required this.msg, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsetsDirectional.only(top: 16),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isMe)
            Spacer()
          else
            Container(
              width: 43.w,
              height: 43.w,
              margin: EdgeInsetsDirectional.only(start: 16.w, end: 8.w),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(50)),
            ),
          BubbleBox(
            maxWidth: (MediaQuery.of(context).size.width -
                    16.w * 2 -
                    43.w * 2 -
                    8.w) *
                1,
            shape: BubbleShapeBorder(
                direction: isMe ? BubbleDirection.right : BubbleDirection.left,
                position: BubblePosition.start(16.h),
                arrowQuadraticBezierLength: 2,
                radius: BorderRadius.circular(16.r)),
            backgroundColor: isMe ? Color(0xE6767CCE) : Color(0xE6FFFFFF),
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(16.w),
            child: Text(
              msg,
              style: TextStyle(
                  color: isMe ? Colors.white : Colors.black, fontSize: 15.sp),
            ),
          ),
          if (isMe)
            Container(
              width: 43.w,
              height: 43.w,
              margin: EdgeInsetsDirectional.only(start: 8.w, end: 16.w),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(50)),
            )
          else
            Spacer(),
        ],
      ),
    );
  }
}
