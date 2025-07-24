import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astrea/generated/assets.dart';

class TabCard extends StatelessWidget {
  const TabCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Container(
              width: ((MediaQuery.of(context).size.width - 32) / 2) + 16,
              //height: 400,
              margin: EdgeInsetsDirectional.only(top: 20),
              constraints: BoxConstraints(minWidth: 170, minHeight: 400),
              padding: EdgeInsetsDirectional.only(
                start: 16,
                end: 16,
                top: 16,
                bottom: 36,
              ),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Color(0xCCF3F3F3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                spacing: 8,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'Non-member',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Personal horoscope drawing',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Horoscope analysis',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Fortune query',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Friends\' horoscope drawing',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Personal fortune push',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Combined fortune query',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Online tarot card drawing',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Tarot analysis',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Fortune guide',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '1v1 horoscope',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Tarot 1v1 divination',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              width: ((MediaQuery.of(context).size.width - 32) / 2) + 16,
              //height: 400,
              margin: EdgeInsetsDirectional.only(top: 0, bottom: 0),
              constraints: BoxConstraints(minWidth: 170, minHeight: 400),
              clipBehavior: Clip.hardEdge,
              padding: EdgeInsetsDirectional.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                spacing: 8,
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'Non-member',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Personal horoscope drawing',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Horoscope analysis',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Fortune query',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Friends\' horoscope drawing',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Personal fortune push',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Combined fortune query',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Online tarot card drawing',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Tarot analysis',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Fortune guide',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '1v1 horoscope',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 8.w),
                        child: Image.asset(
                          Assets.imageFinishIcon,
                          width: 20,
                          height: 20,
                          matchTextDirection: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Tarot 1v1 divination',
                          style: TextStyle(
                            color: const Color(0xFF323133),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
