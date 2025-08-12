import 'package:astrea/components/common_btn.dart';
import 'package:astrea/components/custom_tag.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showRelationshipSheet(Function(String) onSelect) {
  Get.bottomSheet(
    SelectRelationshipSheet(onSelect: onSelect),
    isScrollControlled: true,
    settings: RouteSettings(name: APages.selectRelationshipSheet),
  );
}

class SelectRelationshipSheet extends StatefulWidget {
  final Function(String) onSelect;
  const SelectRelationshipSheet({super.key, required this.onSelect});

  @override
  State<SelectRelationshipSheet> createState() =>
      _SelectRelationshipSheetState();
}

class _SelectRelationshipSheetState extends State<SelectRelationshipSheet> {
  int selectedIndex = -1;
  /*List<Map<String, dynamic>> list2 = [
    {"title": "Family", "value": false},
    {"title": "Lover", "value": false},
    {"title": "Friend", "value": false},
    {"title": "Partners", "value": false},
    {"title": "Customers", "value": false},
    {"title": "Colleagues", "value": false},
  ];*/

  List<Map<String, dynamic>> list = [
    {"title": LanKey.family.tr, "value": false},
    {"title": LanKey.lover.tr, "value": false},
    {"title": LanKey.friend.tr, "value": false},
    //{"title": LanKey.partners.tr, "value": false},
    {"title": LanKey.colleagues.tr, "value": false},
    {"title": LanKey.customers.tr, "value": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF0F1F5),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 6.h, vertical: 14.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: 0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
                    child: Text(
                      LanKey.relationshipTitle.tr,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 20.sp,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsetsDirectional.all(10),
                      child: Image.asset(
                        Assets.imageCloseDialog,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(
              top: 10.h,
              bottom: 40.h,
              start: 10.w,
              end: 10.w,
            ),
            width: double.maxFinite,
            child: Wrap(
              spacing: 6.w,
              runSpacing: 12.h,
              children: [
                ...list.mapIndexed(
                  (i, e) => GestureDetector(
                    onTap: () {
                      setState(() {
                        for (int index = 0; index < (list.length); index++) {
                          list[index]["value"] = (index == i);
                          selectedIndex = i;
                        }
                      });
                    },
                    child: CustomTag(
                      isSelected: list[i]["value"],
                      child: Text(
                        list[i]["title"],
                        style: TextStyle(
                          color: const Color(0xFF333333),
                          fontSize: 16.sp,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CommonBtn(
            isClickable: selectedIndex != -1,
            title: LanKey.confirm.tr,
            margin: EdgeInsetsDirectional.only(
              start: 10.w,
              end: 10.w,
              bottom: 10.h,
            ),
            onTap: () {
              Get.back();
              widget.onSelect.call(list[selectedIndex]["title"]);
            },
          ),
        ],
      ),
    );
  }
}
