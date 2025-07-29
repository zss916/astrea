import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/account/index/logic.dart';
import 'package:flutter/material.dart';

class EditAvatar extends StatelessWidget {
  final String? path;
  final AccountLogic logic;
  const EditAvatar({super.key, required this.path, required this.logic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // logic.showSheet();
        logic.toPersonalData();
      },
      child: Container(
        // color: Colors.red,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            /*Image.asset(
              Assets.imageCameraAvatar,
              matchTextDirection: true,
              width: 91,
              height: 91,
            ),*/
            // if ((path ?? "").isNotEmpty)
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: 85,
                  height: 85,
                  margin: EdgeInsetsDirectional.only(end: 3),
                  decoration: BoxDecoration(
                    color: Color(0x1A000000),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: (path ?? "").isNotEmpty
                          ? NetworkImage(path ?? "")
                          : ExactAssetImage(Assets.imageDefaultAvatar),
                    ),
                    borderRadius: BorderRadiusDirectional.circular(50),
                  ),
                ),
                /*Image.asset(
                    Assets.imageFrameEditAvatar,
                    matchTextDirection: true,
                    width: 91,
                    height: 91,
                  ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
