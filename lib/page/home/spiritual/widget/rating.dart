import 'package:flutter/material.dart';
import 'package:astrea/generated/assets.dart';

class Rating extends StatelessWidget {
  final int rating;
  final Size? size;
  final double? fontSize;
  const Rating({super.key, required this.rating, this.size, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          rating >= 1 ? Assets.imageStarFill : Assets.imageStarBorde,
          width: size?.width ?? 10,
          height: size?.height ?? 10,
          matchTextDirection: true,
        ),
        SizedBox(width: 3),
        Image.asset(
          rating >= 2 ? Assets.imageStarFill : Assets.imageStarBorde,
          width: size?.width ?? 10,
          height: size?.height ?? 10,
          matchTextDirection: true,
        ),
        SizedBox(width: 3),
        Image.asset(
          rating >= 3 ? Assets.imageStarFill : Assets.imageStarBorde,
          width: size?.width ?? 10,
          height: size?.height ?? 10,
          matchTextDirection: true,
        ),
        SizedBox(width: 3),
        Image.asset(
          rating >= 4 ? Assets.imageStarFill : Assets.imageStarBorde,
          width: size?.width ?? 10,
          height: size?.height ?? 10,
          matchTextDirection: true,
        ),
        SizedBox(width: 3),
        Image.asset(
          rating >= 5 ? Assets.imageStarFill : Assets.imageStarBorde,
          width: size?.width ?? 10,
          height: size?.height ?? 10,
          matchTextDirection: true,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsetsDirectional.only(start: 2),
            child: Text(
              '876',
              maxLines: 1,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: const Color(0xFFFFCA0B),
                fontSize: fontSize ?? 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
