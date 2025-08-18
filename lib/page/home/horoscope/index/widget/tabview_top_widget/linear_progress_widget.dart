import 'package:flutter/material.dart';

class LinearProgressWidget extends StatelessWidget {
  final int? value;
  const LinearProgressWidget({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: (value ?? 0) / 100,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      backgroundColor: Color(0xFFF0F1F5),
      valueColor: AlwaysStoppedAnimation(Color(0xFF585FC4)),
    );
  }
}
