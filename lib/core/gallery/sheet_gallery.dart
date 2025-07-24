import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/gallery/image_utils.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';

void showCameraAndGallerySheet() {
  Get.bottomSheet(
    Container(
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
                ImageUtils.chooseImage(camera: true).then((file) {});
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
                ImageUtils.chooseImage(camera: false).then((file) {});
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
    ),
    barrierColor: Colors.black12,
  );
}
