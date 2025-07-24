import 'package:flutter/material.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/spiritual/widget/rating_star.dart';

class Evaluate extends StatelessWidget {
  const Evaluate({super.key});

  @override
  Widget build(BuildContext context) {
    return buildEvaluate();
  }

  Widget buildEvaluate() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
        top: 4,
        bottom: 10,
      ),
      itemBuilder: (_, i) {
        return Container(
          padding: EdgeInsetsDirectional.symmetric(vertical: 12),
          width: double.maxFinite,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: ShapeDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage("https://placehold.co/45x43"),
                        fit: BoxFit.cover,
                      ),
                      shape: OvalBorder(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'C*****o',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '06/06/2025, 1:08 PM',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: const Color(0xFF91929D),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RatingStar(rating: 5),
                ],
              ),
              Container(
                margin: EdgeInsetsDirectional.symmetric(vertical: 10),
                width: double.maxFinite,
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    ...[
                      "Personal destiny",
                      "Interpersonal relationships",
                      "Career development",
                      "Health care",
                    ].map(
                      (e) => Container(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 12,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius: BorderRadiusDirectional.circular(50),
                        ),
                        child: Text(
                          e,
                          style: TextStyle(
                            color: const Color(0xFF6A676C),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                child: Text(
                  'Explained complex aspects (e.g., my Moon-Pluto square) with relatable metaphors.',
                  style: TextStyle(
                    color: const Color(0xFF6A676C),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, i) => Divider(height: 1, color: Color(0xFFE6E6E6)),
      itemCount: 50,
    );
  }

  Widget buildEvaluateEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.imageEvaluateEmpty,
          width: 88,
          height: 78,
          matchTextDirection: true,
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 15, end: 15, top: 20),
          child: Text(
            'There are no comments yet. \nPlease write your first comment.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
