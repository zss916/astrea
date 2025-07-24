import 'package:flutter/material.dart';

class AccountDisplay extends StatelessWidget {
  final String account;

  const AccountDisplay({super.key, required this.account});

  String _getMaskedAccount() {
    if (account.length <= 2) return account;

    final firstChar = account.substring(0, 1);
    final lastChar = account.substring(account.length - 1);
    final middle = '*' * (account.length - 2);

    return '$firstChar$middle$lastChar';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _getMaskedAccount(),
      style: TextStyle(
        color: const Color(0xFF6A676C),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
