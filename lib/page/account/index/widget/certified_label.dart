import 'package:astrea/core/translations/en.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CertifiedLabel extends StatelessWidget {
  final int state;

  const CertifiedLabel({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        if (state == 0)
          Container(
            margin: EdgeInsetsDirectional.only(end: 0),
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 8,
              vertical: 1,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFEDEDFE),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              LanKey.certified.tr,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
        if (state == 1)
          Container(
            margin: EdgeInsetsDirectional.only(end: 8),
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 8,
              vertical: 1,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFEDFDF2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              LanKey.inReview.tr,
              style: TextStyle(color: Color(0xFF24C004), fontSize: 14),
            ),
          ),
        if (state == 2)
          Container(
            margin: EdgeInsetsDirectional.only(end: 0),
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 8,
              vertical: 1,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFEEDED),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              LanKey.auditFailed.tr,
              style: TextStyle(color: Color(0xFFFF2200), fontSize: 14),
            ),
          ),
      ],
    );
  }
}
