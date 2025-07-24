import 'package:flutter/material.dart';

class MsgTime extends StatelessWidget {
  final String time;
  const MsgTime({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 95,
      // color: Colors.red,
      margin: EdgeInsetsDirectional.only(start: 5),
      child: Text(
        time,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: const Color(0xFF91929D),
          fontSize: 12,
        ),
      ),
    );
  }
}
