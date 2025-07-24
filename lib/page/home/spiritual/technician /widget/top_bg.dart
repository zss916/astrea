import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astrea/generated/assets.dart';

class TopBg extends StatelessWidget {
  final Widget child;
  const TopBg({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          //color: Colors.black,
          width: double.maxFinite,
          height: 300,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              PositionedDirectional(
                top: 0,
                start: -10.w,
                child: Image.asset(
                  Assets.imageTechnicianBg1,
                  matchTextDirection: true,
                  height: 280,
                ),
              ),
              PositionedDirectional(
                top: 87,
                start: 110,
                child: Image.asset(
                  Assets.imageTechnicianBg2,
                  matchTextDirection: true,
                  width: 6,
                  height: 6,
                ),
              ),
              PositionedDirectional(
                top: 60,
                start: 175,
                child: Image.asset(
                  Assets.imageTechnicianBg3,
                  matchTextDirection: true,
                  width: 50,
                  height: 47,
                ),
              ),
              PositionedDirectional(
                top: 160,
                end: 28,
                child: Image.asset(
                  Assets.imageTechnicianBg4,
                  matchTextDirection: true,
                  width: 33,
                  height: 30,
                ),
              ),
              PositionedDirectional(
                bottom: 0,
                start: 13,
                child: Image.asset(
                  Assets.imageTechnicianBg5,
                  matchTextDirection: true,
                  width: 3,
                  height: 4,
                ),
              ),
            ],
          ),
        ),
        child,
      ],
    );
  }
}
