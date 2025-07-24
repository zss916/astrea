import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return buildIntroduction();
  }

  Widget buildIntroduction() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Text(
                '🌐 Qualifications',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsetsDirectional.only(top: 8),
              child: Text(
                'Certificate of Astrological Proficiency',
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 24, bottom: 12),
              width: double.maxFinite,
              child: Text(
                '🔮 Areas of expertise',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ...[
                    "Personal destiny",
                    "Interpersonal relationships",
                    "Career development",
                    "Health care"
                  ].map((e) => Container(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 12, vertical: 3),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
                            borderRadius: BorderRadiusDirectional.circular(50)),
                        child: Text(
                          e,
                          style: TextStyle(
                            color: const Color(0xFF6A676C),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 12, bottom: 0),
              width: double.maxFinite,
              child: Text(
                '💎  Self-introduction',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsetsDirectional.only(top: 8),
              child: Text(
                'Hi, I\'m lulu, a CAP-certified astrologer specializing in relationship synastry and career guidance. With 8+ years of experience, I blend traditional techniques with psychological insights to help clients navigate life transitions. My approach is practical and empowering—whether decoding your natal chart or timing major decisions. ',
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
