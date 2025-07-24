import 'package:flutter/material.dart';

class MsgName extends StatelessWidget {
  final String name;
  const MsgName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(

          ///todo 这里会卡顿，优化
          maxWidth: MediaQuery.of(context).size.width -
              16 * 2 -
              56 -
              -12 -
              8 -
              10 -
              50 -
              5 -
              100 -
              10),
      margin: EdgeInsetsDirectional.only(start: 5, end: 5),
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: const Color(0xFF323133),
          fontSize: 18,
        ),
      ),
    );
  }
}
