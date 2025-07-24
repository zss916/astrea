import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astrea/generated/assets.dart';

class CustomTag extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool? isSelected;
  const CustomTag({
    super.key,
    required this.child,
    this.padding,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      //constrainedAxis: Axis.horizontal,
      child: Container(
        height: 37,
        alignment: AlignmentDirectional.center,
        padding:
            padding ??
            EdgeInsetsDirectional.symmetric(horizontal: 25.w, vertical: 2),
        decoration: isSelected == true
            ? BoxDecoration(
                image: DecorationImage(
                  matchTextDirection: true,
                  // centerSlice: Rect.fromLTRB(50, 18, 50, 18),
                  centerSlice: Rect.fromLTRB(30, 2, 70, 35),
                  image: ExactAssetImage(Assets.imageTagBg),
                  fit: BoxFit.fill,
                ),
              )
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(50),
              ),
        margin: EdgeInsetsDirectional.symmetric(horizontal: 6),
        child: child,
      ),
    );
  }
}
