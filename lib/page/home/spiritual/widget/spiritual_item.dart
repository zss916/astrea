import 'package:flutter/material.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/page/home/spiritual/widget/chat_btn.dart';
import 'package:astrea/page/home/spiritual/widget/rating.dart';
import 'package:astrea/page/home/spiritual/widget/state_widget.dart';

class SpiritualItem extends StatelessWidget {
  final double height;
  final double width;

  const SpiritualItem({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageTools.toTechnician();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadiusDirectional.circular(12),
        ),
        width: width,
        height: height,
        padding: EdgeInsetsDirectional.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StateWidget(isBusy: true),
            Spacer(),
            Container(
              margin: EdgeInsetsDirectional.only(bottom: 0),
              width: double.maxFinite,
              child: Text(
                'AuroraPulse‌sdfdsffdsafds',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(bottom: 0),
              width: double.maxFinite,
              child: Text(
                '12 years exp',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF1FDEDA),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(bottom: 0),
              width: double.maxFinite,
              child: Rating(rating: 3),
            ),
            ChatBtn(
              isBusy: true,
              width: double.maxFinite,
              fontSize: 10,
              iconSize: Size(13, 12),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 9,
                vertical: 6,
              ),
              margin: EdgeInsetsDirectional.only(top: 9),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 5),
              width: double.maxFinite,
              child: Text(
                'Free 3 minutes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFFFCA0B) /* Color7 */,
                  fontSize: 8,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
