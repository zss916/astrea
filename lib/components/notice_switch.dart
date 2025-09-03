import 'package:flutter/material.dart';
import 'package:astrea/generated/assets.dart';

class NoticeSwitch extends StatefulWidget {
  final bool isSwitchOn;

  const NoticeSwitch({super.key, required this.isSwitchOn});

  @override
  _NoticeSwitchState createState() => _NoticeSwitchState();
}

class _NoticeSwitchState extends State<NoticeSwitch> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.isSwitchOn ? Assets.imageSwitchS : Assets.imageSwitchN,
      width: 46,
      height: 46,
      matchTextDirection: true,
    );
  }
}
