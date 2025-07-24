import 'package:flutter/material.dart';
import 'package:astrea/generated/assets.dart';

class RatingStar extends StatelessWidget {
  final int rating;
  final Size? size;
  const RatingStar({super.key, required this.rating, this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          rating >= 1 ? Assets.imageStarFill : Assets.imageStarBorde,
          width: size?.width ?? 14,
          height: size?.height ?? 14,
          matchTextDirection: true,
        ),
        SizedBox(width: 3),
        Image.asset(
          rating >= 2 ? Assets.imageStarFill : Assets.imageStarBorde,
          width: size?.width ?? 14,
          height: size?.height ?? 14,
          matchTextDirection: true,
        ),
        SizedBox(width: 3),
        Image.asset(
          rating >= 3 ? Assets.imageStarFill : Assets.imageStarBorde,
          width: size?.width ?? 14,
          height: size?.height ?? 14,
          matchTextDirection: true,
        ),
        SizedBox(width: 3),
        Image.asset(
          rating >= 4 ? Assets.imageStarFill : Assets.imageStarBorde,
          width: size?.width ?? 14,
          height: size?.height ?? 14,
          matchTextDirection: true,
        ),
        SizedBox(width: 3),
        Image.asset(
          rating >= 5 ? Assets.imageStarFill : Assets.imageStarBorde,
          width: size?.width ?? 14,
          height: size?.height ?? 14,
          matchTextDirection: true,
        ),
      ],
    );
  }
}
