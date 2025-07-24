import 'package:flutter/material.dart';
import 'package:astrea/core/setting/app_fonts.dart';

class BottomStack extends StatelessWidget {
  final VoidCallback onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const BottomStack({
    super.key,
    required this.onTap,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x00EDEDFD), Color(0xFFEDEDFE)],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          onTap.call();
        },
        child: Container(
          alignment: AlignmentDirectional.center,
          width: double.maxFinite,
          constraints: BoxConstraints(minHeight: 62),
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          margin: margin ?? EdgeInsetsDirectional.only(start: 20, end: 20),
          decoration: BoxDecoration(
            color: Color(0xFF766DF8),
            borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Is there any possibility for him and I to develop further?",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppFonts.textFontFamily,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                height: 30,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
                margin: EdgeInsetsDirectional.only(start: 5),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'Ask',
                  style: TextStyle(
                    color: const Color(0xFF585FC4),
                    fontSize: 14,
                    fontFamily: AppFonts.textFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
