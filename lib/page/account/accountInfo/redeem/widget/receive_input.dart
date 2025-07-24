import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/translations/en.dart';

class ReceiveInput extends StatelessWidget {
  final Function(String) onChanged;
  const ReceiveInput({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: Text(
            LanKey.receive.tr,
            style: TextStyle(
              color: const Color(0xFF323133),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 10),
          width: double.maxFinite,
          height: 48,
          child: TextField(
            textAlign: TextAlign.start,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: "0",
              suffix: Container(
                margin: EdgeInsetsDirectional.only(end: 10.w),
                child: Text(
                  LanKey.usd.tr,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              hintStyle: TextStyle(
                color: Colors.black.withValues(alpha: 0.30),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xFFD9D9D9)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xFFD9D9D9)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Color(0xFFD9D9D9)),
              ),
            ),
            onChanged: (value) {
              onChanged.call(value);
            },
          ),
        ),
      ],
    );
  }
}
