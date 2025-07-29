import 'dart:math';

import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';

class HousesWidget extends StatelessWidget {
  final Size size;
  const HousesWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: (pi / 12) * 2,
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 0),
        child: Image.asset(
          Assets.imageHouses,
          matchTextDirection: true,
          width: size.width,
          height: size.height,
        ),
      ),
    );
  }
}
