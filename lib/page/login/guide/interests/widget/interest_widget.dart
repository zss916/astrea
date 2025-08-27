import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InterestWidget extends StatelessWidget {
  final String title;
  final String icon;
  final bool isChecked;

  const InterestWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 151,
          height: 106,
          // padding: EdgeInsets.only(top: 10, bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Spacer(),
              SizedBox(
                width: 62,
                height: 62,
                child: Image.asset(icon, matchTextDirection: true),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 18.sp,
                  fontWeight: isChecked ? FontWeight.w800 : FontWeight.w400,
                ),
              ),
              Spacer(),
            ],
          ),
        ),

        //Image.asset(icon, matchTextDirection: true, width: 151, height: 106),
        if (isChecked)
          SvgPicture.asset(
            Assets.svgInterestBorder,
            matchTextDirection: true,
            width: 151,
            height: 106,
          ),
      ],
    );
  }
}
