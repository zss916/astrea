import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/home/horoscope/index/logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// refresh
class HomeRefresh extends StatelessWidget {
  final HoroscopeLogic logic;
  const HomeRefresh({super.key, required this.logic});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: Get.height * 0.55,
          margin: EdgeInsetsDirectional.only(bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Assets.imageHomeLoading,
                width: 74,
                height: 76,
                matchTextDirection: true,
              ),
              SizedBox(height: 24),
              Text(
                'Data loading failed. Please click to\nreload.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF6A676C),
                  fontSize: 14,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  logic.refreshData();
                },
                child: Container(
                  width: 140,
                  height: 46,
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFF766DF8)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Reload',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF766DF8),
                      fontSize: 16,
                      fontFamily: AppFonts.textFontFamily,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
