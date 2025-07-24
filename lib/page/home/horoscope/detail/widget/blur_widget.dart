import 'dart:ui';

import 'package:flutter/material.dart';

class BlurWidget extends StatelessWidget {
  final Widget child;
  final bool isBlur;
  final double? sigma;
  final double? radius;
  const BlurWidget(
      {super.key,
      required this.child,
      required this.isBlur,
      this.sigma,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        child,
        if (isBlur)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius ?? 12),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: sigma ?? 2.8,
                  sigmaY: sigma ?? 2.8,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
