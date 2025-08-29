import 'dart:math';

import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/utils/calculate.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/login/guide/dateOfBirth/widget/zodiac_wheel.dart';
import 'package:awesome_datetime_picker/awesome_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

class SelectDateWidget extends StatefulWidget {
  final Function(String) onSelect;
  const SelectDateWidget({Key? key, required this.onSelect}) : super(key: key);

  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDateWidget>
    with SingleTickerProviderStateMixin {
  int select = -1;
  double angle = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _targetAngle = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );
    _animationController.addListener(() {
      setState(() {
        // 从当前角度逐渐过渡到目标角度
        angle = _animation.value * (_targetAngle - angle) + angle;
      });
    });
    initData();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  ///初始化数据
  (int, int, int) initValue = (
    (DateTime.now().year - 25),
    (DateTime.now().month),
    15,
  );

  initData() {
    (int, int, int) value = AccountService.to.getUserBirth();
    initValue = value;
    int index = getSign(month: value.$2, day: value.$3);
    setSelect(index, animate: false);
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
              top: 0,
              child: Image.asset(
                Assets.imageSelected,
                width: 74,
                height: 144,
                matchTextDirection: true,
              ),
            ),
            Transform.rotate(
              angle: angle,
              child: ZodiacWheel(size: 260, selectedZodiac: select),
            ),
          ],
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 135),
          color: AppColor.pageBackground,
          width: double.maxFinite,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 35,
                width: double.maxFinite,
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(7),
                ),
              ),
              AwesomeDatePicker(
                space: 70,
                initialDate: AwesomeDate(
                  year: initValue.$1,
                  month: initValue.$2,
                  day: initValue.$3,
                ),
                maxDate: AwesomeDate(
                  year: DateTime.now().year,
                  month: DateTime.now().month,
                  day: DateTime.now().day,
                ),
                minDate: AwesomeDate(year: 1910, month: 1, day: 1),
                dateFormat: AwesomeDateFormat.mMdy,
                backgroundColor: Colors.transparent,
                fadeEffect: false,
                selectorColor: Colors.transparent,
                onChanged: (AwesomeDate date) {
                  debugPrint(
                    "----Date changed : ${date.day}/${date.month}/${date.year}\n",
                  );
                  int index = getSign(month: date.month, day: date.day);
                  setSelect(index, animate: true);

                  String data = sprintf("%s-%s-%s", [
                    date.year,
                    date.month.formatted,
                    date.day.formatted,
                  ]);
                  widget.onSelect(CalculateTools.formattedDate(data));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///设置选择的星座
  setSelect(int index, {bool animate = true}) {
    // 计算目标角度
    _targetAngle = -((15 * (pi / 180)) * 1 + (30 * (pi / 180) * (3 + index)));

    if (animate) {
      // 先旋转额外的角度，然后再回到目标位置，增强动画效果
      setState(() {
        select = index;
        // 随机生成一个额外旋转角度，使动画更生动
        double extraRotation = 2 * pi * (1 + Random().nextDouble());
        angle = _targetAngle - extraRotation;
      });

      // 重置动画控制器并开始动画
      _animationController.reset();
      _animationController.forward();
    } else {
      // 不需要动画时直接设置角度
      setState(() {
        select = index;
        angle = _targetAngle;
      });
    }
  }

  /*白羊座（阳历3月21日-4月19日）
                金牛座（阳历4月20日-5月20日）
                双子座（阳历5月21日-6月21日）
                巨蟹座（阳历6月22日-7月22日）
                狮子座（阳历7月23日-8月22日）
                处女座（阳历8月23日-9月22日）
                天秤座（阳历9月23日-10月23日）
                天蝎座（阳历10月24日-11月22日）
                射手座（阳历11月23日-12月21日）
                摩羯座（阳历12月22日-1月19日）
                水瓶座（阳历1月20日-2月18日）
                双鱼座（阳历2月19日-3月20日）*/

  int getSign({required int month, required int day}) {
    if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      // return '水瓶座';
      return 10;
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
      // return '双鱼座';
      return 11;
    } else if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      //return '白羊座';
      return 0;
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      //return '金牛座';
      return 1;
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 21)) {
      //return '双子座';
      return 2;
    } else if ((month == 6 && day >= 22) || (month == 7 && day <= 22)) {
      // return '巨蟹座';
      return 3;
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      //return '狮子座';
      return 4;
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      // return '处女座';
      return 5;
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 23)) {
      //return '天秤座';
      return 6;
    } else if ((month == 10 && day >= 24) || (month == 11 && day <= 22)) {
      // return '天蝎座';
      return 7;
    } else if ((month == 11 && day >= 23) || (month == 12 && day <= 21)) {
      // return '射手座';
      return 8;
    } else {
      // return '摩羯座';
      return 9;
    }
  }
}
