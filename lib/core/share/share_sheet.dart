import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

void showShareSheet() {
  Get.bottomSheet(
    isScrollControlled: true,
    Container(
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: Text(
              LanKey.shareWithFriends.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(
              top: 16.h,
              bottom: 6.h,
              start: 16,
            ),
            width: double.maxFinite,
            child: Text(
              LanKey.shareTo.tr,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 24.h),
            width: double.maxFinite,
            height: 90,
            child: ListView(
              padding: EdgeInsetsDirectional.only(start: 16, end: 16),
              scrollDirection: Axis.horizontal,
              children: [
                Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      //todo
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.only(
                            top: 10.h,
                            bottom: 9.h,
                          ),
                          child: Image.asset(
                            Assets.imageFacebook,
                            width: 46,
                            height: 46,
                            matchTextDirection: true,
                          ),
                        ),
                        Text(
                          'Facebook',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF6A676C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(width: 16, color: Colors.transparent),
                Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      //todo
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.only(
                            top: 10.h,
                            bottom: 9.h,
                          ),
                          child: Image.asset(
                            Assets.imageSnapchat,
                            width: 46,
                            height: 46,
                            matchTextDirection: true,
                          ),
                        ),
                        Text(
                          'Snapchat',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF6A676C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(width: 16, color: Colors.transparent),
                Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      //todo
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.only(
                            top: 10.h,
                            bottom: 9.h,
                          ),
                          child: Image.asset(
                            Assets.imageFacebook,
                            width: 46,
                            height: 46,
                            matchTextDirection: true,
                          ),
                        ),
                        Text(
                          'Facebook',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF6A676C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(width: 16, color: Colors.transparent),
                Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      //todo
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.only(
                            top: 10.h,
                            bottom: 9.h,
                          ),
                          child: Image.asset(
                            Assets.imageTwitter,
                            width: 46,
                            height: 46,
                            matchTextDirection: true,
                          ),
                        ),
                        Text(
                          'Twitter',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF6A676C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(width: 16, color: Colors.transparent),
                Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      //todo
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.only(
                            top: 10.h,
                            bottom: 9.h,
                          ),
                          child: Image.asset(
                            Assets.imageInstagram,
                            width: 46,
                            height: 46,
                            matchTextDirection: true,
                          ),
                        ),
                        Text(
                          'Instagram',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF6A676C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(width: 16, color: Colors.transparent),
                Material(
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      //todo
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsetsDirectional.only(
                            top: 10.h,
                            bottom: 9.h,
                          ),
                          child: Image.asset(
                            Assets.imageFacebook,
                            width: 46,
                            height: 46,
                            matchTextDirection: true,
                          ),
                        ),
                        Text(
                          'You Tube',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xFF6A676C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              bottom: 16.h,
            ),
            width: double.maxFinite,
            child: Text(
              LanKey.shareLink.tr,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              //todo
            },
            child: Container(
              padding: EdgeInsetsDirectional.all(16),
              margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFFEDEDFD),
                borderRadius: BorderRadiusDirectional.circular(16),
              ),
              width: double.maxFinite,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'https://rebbjhfvbl.design',
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 10),
                    child: Image.asset(
                      Assets.imageCopy,
                      width: 18,
                      height: 18,
                      matchTextDirection: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 24.h,
              bottom: 16.h,
            ),
            width: double.maxFinite,
            child: Text(
              LanKey.invite.tr,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            height: 58,
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
            margin: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              bottom: 20.h,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFEDEDFD),
              borderRadius: BorderRadiusDirectional.circular(16),
            ),
            width: double.maxFinite,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(end: 16),
                  child: Image.asset(
                    Assets.imageInviteIcon,
                    width: 26,
                    height: 26,
                    matchTextDirection: true,
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    //inputFormatters: [],
                    decoration: InputDecoration(
                      hintText: LanKey.enterEmailToShare.tr,
                      hintStyle: TextStyle(
                        color: const Color(0xFFBDBDBD),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 10),
                  child: Image.asset(
                    Assets.imageSend,
                    width: 26,
                    height: 26,
                    matchTextDirection: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    settings: RouteSettings(name: APages.shareSheet),
  );
}
