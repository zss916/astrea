import 'package:flutter/material.dart';
import 'package:astrea/generated/assets.dart';

class ChatroomBg extends StatelessWidget {
  final Widget child;
  const ChatroomBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        PositionedDirectional(
          top: 0,
          end: 0,
          child: Image.asset(
            Assets.imageChatroomTopRight,
            matchTextDirection: true,
            height: 72,
          ),
        ),
        PositionedDirectional(
          bottom: 60,
          start: 0,
          child: Image.asset(
            Assets.imageChatroomBottomLeft,
            height: 180,
            matchTextDirection: true,
          ),
        ),
        child,
      ],
    );
  }
}
