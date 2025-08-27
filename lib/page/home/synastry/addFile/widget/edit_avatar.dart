import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/synastry/addFile/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EditAvatar extends StatelessWidget {
  final String? path;
  final AddFileLogic logic;
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
        logic.showSheet();
        onTap.call();
      },
      child: Container(
        // color: Colors.red,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            if ((path ?? "").isEmpty)
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
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(100),
                    ),
                    child: CachedNetworkImage(
                      width: 85,
                      height: 85,
                      fit: BoxFit.cover,
                      placeholder: (BuildContext context, String url) =>
                          Container(
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            width: 85,
                            height: 85,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFF766DF8),
                              ),
                            ),
                          ),
                      errorWidget:
                          (BuildContext context, String url, dynamic error) =>
                              Container(
                                alignment: Alignment.center,
                                width: 85,
                                height: 85,
                                color: Colors.transparent,
                                child: Icon(
                                  Icons.error,
                                  size: 40,
                                  color: Colors.black,
                                ),
                              ),
                      imageUrl: path ?? "",
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
