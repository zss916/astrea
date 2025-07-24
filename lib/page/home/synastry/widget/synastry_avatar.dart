import 'package:flutter/material.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/generated/assets.dart';

class SynastryAvatar extends StatelessWidget {
  final Widget child;
  const SynastryAvatar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageTools.toRecord();
      },
      child: Container(
        //color: Colors.red,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(end: 12, bottom: 3),
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
                  image: AssetImage(Assets.imageSynastryAvatarBg1),
                ),
              ),
              child: Container(
                margin: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
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
