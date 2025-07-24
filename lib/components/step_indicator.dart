import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int index; //0-8

  const StepIndicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: index >= 0 ? Color(0xFF6F4DFF) : Color(0xFFEDEDFD),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            width: 30,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: index >= 1 ? Color(0xFF6F4DFF) : Color(0xFFEDEDFD),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            width: 30,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: index >= 2 ? Color(0xFF6F4DFF) : Color(0xFFEDEDFD),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            width: 30,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: index >= 3 ? Color(0xFF6F4DFF) : Color(0xFFEDEDFD),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            width: 30,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: index >= 4 ? Color(0xFF6F4DFF) : Color(0xFFEDEDFD),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            width: 30,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: index >= 5 ? Color(0xFF6F4DFF) : Color(0xFFEDEDFD),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            width: 30,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: index >= 6 ? Color(0xFF6F4DFF) : Color(0xFFEDEDFD),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            width: 30,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: index >= 7 ? Color(0xFF6F4DFF) : Color(0xFFEDEDFD),
            ),
          ),
          /*SizedBox(
            width: 4,
          ),
          Container(
            width: 30,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: index >= 8 ? Color(0xFF6F4DFF) : Color(0xFFEDEDFD),
            ),
          ),*/
        ],
      ),
    );
  }
}
