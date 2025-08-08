import 'package:astrea/components/common_btn.dart';
import 'package:astrea/core/setting/global.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/login/guide/gender/widget/gender_widget.dart';
import 'package:astrea/page/login/guide/gender/widget/sex_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectGender extends StatefulWidget {
  final Function onNext;

  const SelectGender({Key? key, required this.onNext}) : super(key: key);

  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  bool isClick = false;
  bool isCheckFemale = false;
  bool isCheckMale = false;

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    int sex = AccountService.to.getUserSex();
    switch (sex) {
      case 0:
        isCheckFemale = false;
        isCheckMale = false;
        break;
      case 1:
        isCheckFemale = false;
        isCheckMale = true;
        isClick = true;
        break;
      case 2:
        isCheckFemale = true;
        isCheckMale = false;
        isClick = true;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            // VerticalDivider(width: 20.w, color: Colors.transparent),
            GestureDetector(
              onTap: () {
                setState(() {
                  isCheckFemale = true;
                  isCheckMale = false;
                  isClick = true;
                  AccountService.to.updateUserSex(SexEnum.female.index);
                });
              },
              child: GenderWidget(
                isChecked: isCheckFemale,
                title: LanKey.female.tr,
                icon: Assets.imageFremale,
              ),
            ),
            VerticalDivider(width: 10.w, color: Colors.transparent),
            GestureDetector(
              onTap: () {
                setState(() {
                  isCheckFemale = false;
                  isCheckMale = true;
                  isClick = true;
                  AccountService.to.updateUserSex(SexEnum.male.index);
                });
              },
              child: GenderWidget(
                isChecked: isCheckMale,
                title: LanKey.male.tr,
                icon: Assets.imageMale,
              ),
            ),
            Spacer(),
            //  VerticalDivider(width: 20.w, color: Colors.transparent),
          ],
        ),
        Spacer(),
        CommonBtn(
          isClickable: isClick,
          margin: EdgeInsetsDirectional.only(
            start: 20,
            end: 20,
            bottom: bottomPadding,
          ),
          title: LanKey.next.tr,
          onTap: () {
            if (isClick) {
              widget.onNext.call();
            }
          },
        ),
      ],
    );
  }
}
