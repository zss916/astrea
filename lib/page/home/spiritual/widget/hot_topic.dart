import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astrea/page/home/spiritual/widget/loop_scroll.dart';

class HotTopic extends StatelessWidget {
  const HotTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsetsDirectional.symmetric(horizontal: 15),
          width: double.infinity,
          child: Text(
            '🪐 Hot Topics',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: const Color(0xFF323133),
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsetsDirectional.symmetric(horizontal: 15),
          child: Text(
            'See what everyone is asking about',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: const Color(0xFF91929D),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: EdgeInsetsDirectional.only(top: 14, bottom: 14),
          child: LoopScrollWidget(
            //rowHeight: 29,
            items: [
              [
                "❤️ Emotional relationship matching？",
                "🏠 Optimizing living environment",
              ],
              [
                "🧘 Anxiety Relief Guide？",
                "💼 Workplace interpersonal relationships",
              ],
            ],
            itemBuilder: (context, rowIndex, index, item) {
              return Container(
                height: 27,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 8),
                padding: EdgeInsetsDirectional.only(
                  start: 8.w,
                  end: 8.w,
                  top: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(100),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Text(
                  "$item",
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
