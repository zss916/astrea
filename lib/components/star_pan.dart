import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';

class StarPan extends StatelessWidget {
  const StarPan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(Assets.timeBig286, width: 286, height: 286),
        Image.asset(Assets.timeMiddle194, width: 194, height: 194),
        Image.asset(Assets.timeSmall132, width: 132, height: 132),
      ],
    );
  }
}
