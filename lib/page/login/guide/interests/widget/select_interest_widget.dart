import 'package:astrea/components/common_btn.dart';
import 'package:astrea/core/setting/app_common_setting.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/login/guide/interests/widget/interest_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common.dart';

class SelectInterestWidget extends StatefulWidget {
  final Function(List<int> list) onNext;

  const SelectInterestWidget({super.key, required this.onNext});

  @override
  _SelectInterestWidgetState createState() => _SelectInterestWidgetState();
}

class _SelectInterestWidgetState extends State<SelectInterestWidget> {
  //  bool isSelected = false;
  //  int select = -1;

  List<int> selectList = [];

  List<String> images = [
    Assets.imageMoneyIcon,
    Assets.imageBusinessIcon,
    Assets.imageFriendsIcon,
    Assets.imageLoveIcon,
    Assets.imageFamilyIcon,
    Assets.imageCareerIcon,
  ];

  @override
  void initState() {
    super.initState();
    selectList = AccountService.to.getUserInterestIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.maxFinite,
            constraints: BoxConstraints(minHeight: 350.h),
            margin: EdgeInsetsDirectional.symmetric(
              horizontal: 42,
              vertical: 24.h,
            ),
            child: GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 151 / 106,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // isSelected = !isSelected;
                      // select = index;
                      if (selectList.contains(index)) {
                        selectList.remove(index);
                      } else {
                        selectList.add(index);
                      }
                    });

                    AccountService.to.updateUserInterest(selectList);
                  },
                  child: InterestWidget(
                    icon: images[index],
                    title: interests[index],
                    isChecked: selectList.contains(index),
                  ),
                );
              },
            ),
          ),
        ),
        CommonBtn(
          margin: EdgeInsetsDirectional.only(
            start: 20,
            end: 20,
            bottom: bottomPadding,
          ),
          isClickable: selectList.isNotEmpty,
          title: LanKey.next.tr,
          onTap: () {
            if (selectList.isNotEmpty) {
              widget.onNext.call(selectList);
            }
          },
        ),
      ],
    );
  }
}
