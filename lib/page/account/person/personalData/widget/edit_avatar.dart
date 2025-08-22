import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/account/person/personalData/index.dart';
import 'package:flutter/material.dart';

class EditAvatar extends StatelessWidget {
  final String? path;
  final PersonalDataLogic logic;
  final Function() onTap;
  const EditAvatar({
    super.key,
    required this.path,
    required this.logic,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        logic.showPhotoSheet();
        onTap.call();

        /* AppPermissionTools.checkCameraPermission(cancelPermission: () {}).then((
          isGranted,
        ) {
          debugPrint("isGranted===>>>> $isGranted");
          if (isGranted) {
            logic.showPhotoSheet();
            onTap.call();
          }
        });*/
      },
      child: Container(
        // color: Colors.red,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset(
              Assets.imageCameraAvatar,
              matchTextDirection: true,
              width: 91,
              height: 91,
            ),
            if ((path ?? "").isNotEmpty)
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    width: 85,
                    height: 85,
                    margin: EdgeInsetsDirectional.only(end: 3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(path ?? ""),
                      ),
                      borderRadius: BorderRadiusDirectional.circular(50),
                    ),
                  ),
                  Image.asset(
                    Assets.imageFrameEditAvatar,
                    matchTextDirection: true,
                    width: 91,
                    height: 91,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
