import 'dart:io';

import 'package:astrea/core/gallery/image_utils.dart';
import 'package:astrea/core/permission/app_permission_tools.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/net/api/system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCameraAndGallerySheet({required Function(String) onFinish}) {
  Get.bottomSheet(OpenCamera(onFinish: onFinish), barrierColor: Colors.black12);
}

class OpenCamera extends StatelessWidget {
  final Function(String) onFinish;
  const OpenCamera({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.width / 2,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(20),
          topEnd: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          const SizedBox(height: 10),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                Get.back();
                AppPermissionTools.checkCameraPermission(
                  cancelPermission: () {},
                ).then((isGranted) {
                  if (isGranted) {
                    ImageUtils.chooseImage(camera: true).then((xFile) {
                      ImageUtils.compressImageAndGetFile(
                        File(xFile?.path ?? ""),
                      ).then((path) {
                        uploadFile(
                          fileName: xFile?.name ?? "",
                          filePath: path,
                          // filePath: xFile?.path ?? "",
                          onFinish: (url) {
                            onFinish.call(url);
                            // debugPrint("uploadFile url => $url");
                          },
                        );
                      });
                    });
                  }
                });
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                margin: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Text(
                  LanKey.camera.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Divider(height: 0, color: Color(0xFFD6D6D6), thickness: 0.5),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                Get.back();
                AppPermissionTools.checkPhotosPermission(
                  cancelPermission: () {},
                ).then((isGranted) {
                  if (isGranted) {
                    ImageUtils.chooseImage(camera: false).then((xFile) {
                      uploadFile(
                        fileName: xFile?.name ?? "",
                        filePath: xFile?.path ?? "",
                        onFinish: (url) {
                          onFinish.call(url);
                          // debugPrint("uploadFile url => $url");
                        },
                      );
                    });
                  }
                });
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                margin: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Text(
                  LanKey.gallery.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Divider(height: 0, color: Color(0xFFD6D6D6), thickness: 0.5),
          const Spacer(),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Get.back();
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                margin: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(20),
                  ),
                ),
                child: Text(
                  LanKey.cancel.tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: AppFonts.textFontFamily,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void uploadFile({
    required String fileName,
    required String filePath,
    required Function(String) onFinish,
  }) async {
    File file = File(filePath);
    bool isExist = file.existsSync();
    if (isExist) {
      AppLoading.show();
      SystemAPI.getUploadUrl(fileName: fileName, filePath: file.path)
          .then((url) async {
            if ((url ?? "").isNotEmpty) {
              // debugPrint("getUploadUrl => $url");
              onFinish.call(url ?? "");
            }
          })
          .onError((_, _) {
            AppLoading.dismiss();
          })
          .catchError((_) {
            AppLoading.dismiss();
          })
          .whenComplete(() {
            // AppLoading.dismiss();
          });
    } else {
      AppLoading.dismiss();
      AppLoading.toast("File is not exist");
      debugPrint("file is not exist");
    }
  }
}
