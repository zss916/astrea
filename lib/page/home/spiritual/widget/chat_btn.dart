import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class ChatBtn extends StatelessWidget {
  final bool isBusy;
  final String? title;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Size? iconSize;
  final double? fontSize;
  const ChatBtn(
      {super.key,
      required this.isBusy,
      this.title,
      this.width,
      this.margin,
      this.height,
      this.padding,
      this.iconSize,
      this.radius,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      constraints: BoxConstraints(minHeight: 24),
      decoration: BoxDecoration(
          color: Color(isBusy ? 0xFF91929D : 0xFF585FC4),
          borderRadius: BorderRadiusDirectional.circular(radius ?? 100)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 3),
            child: Image.asset(
              Assets.imageChatIcon,
              matchTextDirection: true,
              width: iconSize?.width ?? 0,
              height: iconSize?.height ?? 0,
            ),
          ),
          Text(
            title ?? LanKey.chat.tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
