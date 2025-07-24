import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatTimeItem extends StatelessWidget {
  final bool isUser;
  const ChatTimeItem({super.key, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
              color: isUser ? Colors.transparent : const Color(0xB3FFFFFF),
              borderRadius: BorderRadiusDirectional.circular(4)),
          child: Text(
            DateFormat('HH:mm').format(DateTime.now()),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
