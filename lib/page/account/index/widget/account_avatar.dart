import 'package:flutter/material.dart';
import 'package:astrea/generated/assets.dart';

class AccountAvatar extends StatelessWidget {
  const AccountAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 82,
          height: 82,
          margin: EdgeInsetsDirectional.all(6),
          padding: EdgeInsetsDirectional.all(5),
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadiusDirectional.circular(100),
          ),
          child: Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadiusDirectional.circular(100),
            ),
          ),
        ),
        PositionedDirectional(
          bottom: 10,
          end: 0,
          child: Image.asset(
            Assets.imageCameraIcon,
            width: 32,
            height: 32,
            matchTextDirection: true,
          ),
        ),
      ],
    );
  }
}
