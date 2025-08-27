import 'package:astrea/components/common_btn.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/setting/global.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/login/guide/interests/widget/common.dart';
import 'package:astrea/page/login/guide/interests/widget/interest_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showInterestsSheet(String interests, Function(String) onSelect) {
  Get.bottomSheet(
    SelectInterestWidget(interests: interests, onSelect: onSelect),
    isScrollControlled: true,
    settings: RouteSettings(name: APages.selectInterestsSheet),
  );
}

class SelectInterestWidget extends StatefulWidget {
  final String interests;
  final Function(String value) onSelect;

  const SelectInterestWidget({
    super.key,
    required this.interests,
    required this.onSelect,
  });

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

  List<String> names = [
    LanKey.money.tr,
    LanKey.business.tr,
    LanKey.friends.tr,
    LanKey.love.tr,
    LanKey.family.tr,
    LanKey.career.tr,
  ];

  @override
  void initState() {
    super.initState();
    if (widget.interests.isNotEmpty) {
      List<String> arr = widget.interests.split(",").toList();
      selectList = arr.map((e) => interests.indexOf(e)).toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Container(
          padding: EdgeInsetsDirectional.only(top: 20.h),
          decoration: BoxDecoration(
            color: AppColor.pageBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                LanKey.interestsTitle.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF323133),
                  fontSize: 22.sp,
                  fontFamily: AppFonts.textFontFamily,
                ),
              ),
              Container(
                height: 380.h,
                width: double.maxFinite,
                margin: EdgeInsetsDirectional.symmetric(
                  horizontal: 42.w,
                  vertical: 24.h,
                ),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
              CommonBtn(
                margin: EdgeInsetsDirectional.only(
                  start: 20.w,
                  end: 20.w,
                  bottom: bottomPadding,
                ),
                isClickable: selectList.isNotEmpty,
                title: LanKey.next.tr,
                onTap: () {
                  if (selectList.isNotEmpty) {
                    String value = selectList
                        .map((e) => interests[e])
                        .toList()
                        .join(",");
                    // interests[e]).toList().join(",");
                    widget.onSelect.call(value);
                    Get.back();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
