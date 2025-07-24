import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.5,
      color: Color(0xFFF0F1F5),
      indent: 16,
      endIndent: 16,
    );
  }
}
