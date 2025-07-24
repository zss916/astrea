import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final bool? isIncome;
  final String price;
  const PriceText({super.key, required this.price, this.isIncome});

  @override
  Widget build(BuildContext context) {
    return Text(
      price,
      style: TextStyle(
        color: isIncome == true ? Color(0xFFFF2200) : Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
