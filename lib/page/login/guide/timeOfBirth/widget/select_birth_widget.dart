import 'dart:math';

import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/login/guide/timeOfBirth/widget/transform_rotate_widget.dart';
import 'package:awesome_datetime_picker/awesome_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectBirthWidget extends StatefulWidget {
  final Function(int, int) onSelect;

  const SelectBirthWidget({super.key, required this.onSelect});

  @override
  _SelectBirthWidgetState createState() => _SelectBirthWidgetState();
}

class _SelectBirthWidgetState extends State<SelectBirthWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationCtrl;
  late Animation<double> _animation;

  late AnimationController _animationCtrl2;

  @override
  void initState() {
    super.initState();
    _animationCtrl = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animationCtrl2 = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationCtrl,
      curve: Curves.easeInOut, // 关键修改点
    );
    stopAnimation();
    initData();
  }

  /// 初始化数据
  (int, int) initValue = (12, 0);

  bool isToday = false;

  initData() {
    final (int y, int m, int d) = AccountService.to.getUserBirth();
    // debugPrint("initData ===>> $y,$m,$d");
    isToday =
        (y == DateTime.now().year) &&
        (m == DateTime.now().month) &&
        (d == DateTime.now().day);
    if (isToday) {
      initValue = (0, 0);
    } else {
      initValue = AccountService.to.getUserBirthHAndM();
    }
  }

  @override
  void dispose() {
    super.dispose();
    stopAnimation();
    _animationCtrl.dispose();
    _animationCtrl2.dispose();
  }

  void startAnimation() {
    if (_animationCtrl.isCompleted) {
      _animationCtrl.reset();
    }
    _animationCtrl.forward();
    if (_animationCtrl2.isCompleted) {
      _animationCtrl2.reset();
    }
    _animationCtrl2.forward();
  }

  void stopAnimation() {
    _animationCtrl.stop();
    _animationCtrl2.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            PositionedDirectional(
              start: 0,
              top: 151,
              child: Text(
                'AC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF585FC4),
                  fontSize: 12,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
            ),
            PositionedDirectional(
              end: 0,
              top: 151,
              child: Text(
                'DC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF585FC4),
                  fontSize: 12,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
            ),

            Container(
              margin: EdgeInsetsDirectional.only(top: 20, start: 20, end: 20),
              child: Transform.flip(
                flipY: true,
                //alignment: Alignment.center,
                //transform: Matrix4.identity()..scale(1.0, -1.0),
                child: TransformRotateWidget(
                  angle: (pi / 12) * 14,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      RotationTransition(
                        turns: _animation,
                        child: TransformRotateWidget(
                          angle: (pi / 12) * 2,
                          child: Image.asset(
                            Assets.timeBig286,
                            matchTextDirection: true,
                            width: 286,
                            height: 286,
                          ),
                        ),
                      ),
                      RotationTransition(
                        turns: Tween(
                          begin: 0.0,
                          end: -1.0,
                        ).animate(_animationCtrl2),
                        child: TransformRotateWidget(
                          angle: (pi / 12) * 4,
                          child: Image.asset(
                            Assets.timeMiddle194,
                            matchTextDirection: true,
                            width: 194,
                            height: 194,
                          ),
                        ),
                      ),
                      RotationTransition(
                        turns: (_animation),
                        child: TransformRotateWidget(
                          angle: (pi / 12) * 2,
                          child: Image.asset(
                            Assets.timeSmall132,
                            matchTextDirection: true,
                            width: 132,
                            height: 132,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            PositionedDirectional(
              top: 0,
              child: Text(
                'MC',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF585FC4),
                  fontSize: 12,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 164),
          decoration: BoxDecoration(color: AppColor.pageBackground),
          width: double.maxFinite,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 35,
                width: 215,
                padding: EdgeInsetsDirectional.only(bottom: 4),
                alignment: AlignmentDirectional.center,
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(7),
                ),
                child: Text(
                  ':',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF323133),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              AwesomeTimePicker(
                timeFormat: AwesomeTimeFormat.Hm,
                backgroundColor: Colors.transparent,
                itemWidth: 100,
                maxTime: isToday
                    ? AwesomeTime(
                        hour: DateTime.now().hour,
                        minute: DateTime.now().minute,
                      )
                    : AwesomeTime(hour: 23, minute: 59),
                initialTime: AwesomeTime(
                  hour: initValue.$1,
                  minute: initValue.$2,
                ),
                fadeEffect: false,
                selectorColor: Colors.transparent,
                onChanged: (AwesomeTime time) {
                  print("----Time changed : ${time.hour}:${time.minute}\n");
                  startAnimation();
                  widget.onSelect(time.hour, time.minute);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
