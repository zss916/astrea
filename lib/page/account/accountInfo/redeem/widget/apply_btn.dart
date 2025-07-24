import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/core/translations/en.dart';

class ApplyBtn extends StatelessWidget {
  final bool isClickable;
  final Function onTap;

  const ApplyBtn({super.key, required this.isClickable, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        alignment: AlignmentDirectional.center,
        width: double.maxFinite,
        height: 50,
        foregroundDecoration: isClickable == false
            ? BoxDecoration(
                color: Color(0x80FFFFFF),
                borderRadius: BorderRadiusDirectional.all(Radius.circular(50)),
              )
            : BoxDecoration(),
        decoration: BoxDecoration(
          color: Color(0xFF766DF8),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(50)),
        ),
        child: Text(
          LanKey.apply.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
