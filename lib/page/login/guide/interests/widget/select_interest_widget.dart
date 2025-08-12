import 'package:astrea/components/common_btn.dart';
import 'package:astrea/core/mixin/delayed_init_mixin.dart';
import 'package:astrea/core/setting/global.dart';
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

class _SelectInterestWidgetState extends State<SelectInterestWidget>
    with DelayedInitMixin {
  //  bool isSelected = false;
  //  int select = -1;

  List<int> selectList = [];

  final List<String> images = [
    Assets.imageMoneyIcon,
    Assets.imageBusinessIcon,
    Assets.imageFriendsIcon,
    Assets.imageLoveIcon,
    Assets.imageFamilyIcon,
    Assets.imageCareerIcon,
  ];

  bool isShow = false;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      setState(() {
        selectList = AccountService.to.getUserInterestIndex();
      });
    }
  }

  @override
  void afterFirstLayout() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isShow = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          width: double.maxFinite,
          height: double.maxFinite,
          constraints: BoxConstraints(minHeight: 350.h),
          margin: EdgeInsetsDirectional.only(
            start: 42.w,
            end: 42.w,
            top: 24.h,
            bottom: 90.h,
          ),
          child: isShow
              ? GridView.builder(
                  padding: EdgeInsetsDirectional.only(bottom: 0),
                  shrinkWrap: true,
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
                )
              : Center(child: CircularProgressIndicator()),
        ),
        PositionedDirectional(
          bottom: 0,
          start: 0,
          end: 0,
          child: CommonBtn(
            margin: EdgeInsetsDirectional.only(
              start: 20.w,
              end: 20.w,
              bottom: 24.h,
            ),
            isClickable: selectList.isNotEmpty,
            title: LanKey.next.tr,
            onTap: () {
              if (selectList.isNotEmpty) {
                widget.onNext.call(selectList);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget buildOld() => Column(
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
            shrinkWrap: true,
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
