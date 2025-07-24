import 'package:flutter/material.dart';
import 'package:astrea/components/common_btn.dart';

class BottomStackBtn extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool? isClickable;
  final Gradient? gradient;
  const BottomStackBtn({
    super.key,
    required this.title,
    required this.onTap,
    this.margin,
    this.padding,
    this.isClickable,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient:
            gradient ??
            LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0x00EDEDFD), Color(0xFFEDEDFE)],
            ),
      ),
      child: CommonBtn(
        title: title,
        isClickable: isClickable,
        onTap: () {
          onTap.call();
        },
      ),
    );
  }
}
