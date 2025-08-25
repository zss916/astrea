import 'package:flutter/material.dart';

class SwitchImage extends StatelessWidget {
  final String currentUrl;
  const SwitchImage({super.key, required this.currentUrl});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: Image.network(currentUrl),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
