import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectCountryItem extends StatefulWidget {
  const SelectCountryItem({super.key});

  @override
  State<SelectCountryItem> createState() => _SelectCountryItemState();
}

class _SelectCountryItemState extends State<SelectCountryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(bottom: 16.h),
            width: double.maxFinite,
            child: Text(
              'Payee country/region',
              style: TextStyle(
                color: const Color(0xFF6A676C),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            height: 56,
            padding: EdgeInsetsDirectional.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          )
        ],
      ),
    );
  }
}
