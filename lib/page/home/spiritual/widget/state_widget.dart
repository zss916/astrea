import 'package:flutter/material.dart';

class StateWidget extends StatelessWidget {
  final bool isBusy;
  const StateWidget({super.key, required this.isBusy});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 46),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Color(0x80000000),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            margin: EdgeInsetsDirectional.only(end: 3),
            decoration: ShapeDecoration(
              color: Color(isBusy ? 0xFFF74E57 : 0xFF51C75B),
              shape: OvalBorder(),
            ),
          ),
          Text(
            isBusy ? "Busy" : 'Online',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
