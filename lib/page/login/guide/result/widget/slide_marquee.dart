import 'package:flutter/material.dart';
import 'package:astrea/components/widget_marquee.dart';

class SlideMarquee extends StatelessWidget {
  const SlideMarquee({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFCBD1EA),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsetsDirectional.symmetric(horizontal: 28),
      height: 5,
      width: double.maxFinite,
      child: Marquee(
        delay: const Duration(seconds: 0),
        pause: const Duration(seconds: 0),
        duration: const Duration(milliseconds: 1500),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF5D61BB),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 160,
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 300,
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 100,
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
