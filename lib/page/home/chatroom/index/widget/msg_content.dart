import 'package:flutter/material.dart';

class MsgContent extends StatelessWidget {
  const MsgContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Text(
        '10 Downing Street, London',
        textAlign: TextAlign.start,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: const Color(0xFF6A676C),
          fontSize: 16,
        ),
      ),
    );
  }
}
