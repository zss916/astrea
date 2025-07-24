import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/translations/en.dart';

void showChatBackgroundSheet() {
  Get.bottomSheet(
    Container(
      alignment: AlignmentDirectional.bottomCenter,
      margin: EdgeInsetsDirectional.only(start: 8, end: 8, bottom: 24),
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsetsDirectional.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                      PageTools.toChooseBackground();
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 58,
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        LanKey.chatBackground.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 53,
            clipBehavior: Clip.hardEdge,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(20),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  alignment: AlignmentDirectional.center,
                  width: double.maxFinite,
                  height: 53,
                  child: Text(
                    LanKey.cancel.tr,
                    style: TextStyle(
                      color: const Color(0xFF323133),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    settings: RouteSettings(name: APages.chatMoreSheet),
  );
}
