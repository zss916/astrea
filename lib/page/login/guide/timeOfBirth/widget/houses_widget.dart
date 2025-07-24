import 'dart:math';

import 'package:flutter/material.dart';
import 'package:astrea/generated/assets.dart';

class HousesWidget extends StatelessWidget {
  const HousesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: (pi / 12) * 2,
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 0),
        child: Image.asset(
          Assets.imageHouses,
          matchTextDirection: true,
          width: 132,
          height: 132,
        ),
      ),
    );
  }
}
