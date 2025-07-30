import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';

class SynastryAdd extends StatelessWidget {
  final Widget child;
  const SynastryAdd({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageTools.toRecord();
      },
      child: Container(
        color: Colors.transparent,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 10, bottom: 3),
              child: Image.asset(
                Assets.imageSynastryAvatarBg,
                width: 134,
                height: 134,
                matchTextDirection: true,
              ),
            ),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(
                  matchTextDirection: true,
                  image: AssetImage(Assets.imageSynastryAvatarBg2),
                ),
              ),
              // margin: EdgeInsetsDirectional.only(start: 12, top: 4),
              child: Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
