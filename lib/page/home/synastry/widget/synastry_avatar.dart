import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';

class SynastryAvatar extends StatelessWidget {
  final String avatar;
  const SynastryAvatar({super.key, required this.avatar});

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
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  color: Color(0x1A000000),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    matchTextDirection: true,
                    image: ExactAssetImage(Assets.imageHomeAvatar),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                foregroundDecoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    matchTextDirection: true,
                    image: NetworkImage(avatar),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
