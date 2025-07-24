import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditExpandItem extends StatelessWidget {
  final String title;
  final String hint;
  final Function(String) onChange;
  final EdgeInsetsGeometry? margin;
  final double? hintFontSize;
  const EditExpandItem({
    super.key,
    required this.title,
    required this.hint,
    required this.onChange,
    this.margin,
    this.hintFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsetsDirectional.only(start: 16, end: 16),
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 16.h),
            width: double.maxFinite,
            child: Text(
              title,
              style: TextStyle(
                color: const Color(0xFF6A676C),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(16)),
            width: double.maxFinite,
            child: TextField(
              autofocus: false,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 16,
              ),
              onChanged: (value) {
                ///todo
              },
              minLines: 1,
              maxLines: 4,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: const Color(0xFFBDBDBD),
                    fontSize: hintFontSize ?? 16,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
            ),
          )
        ],
      ),
    );
  }
}
