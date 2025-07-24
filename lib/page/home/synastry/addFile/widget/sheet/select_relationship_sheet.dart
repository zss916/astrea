import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/components/common_btn.dart';
import 'package:astrea/components/custom_tag.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF0F1F5),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      width: double.maxFinite,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 6, vertical: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 10, end: 10),
                    child: Text(
                      LanKey.relationshipTitle.tr,
                      style: TextStyle(
                        color: const Color(0xFF323133),
                        fontSize: 20,
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
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(
              top: 18.h,
              bottom: 20.h,
              start: 10,
              end: 10,
            ),
            width: double.maxFinite,
            child: Wrap(
              spacing: 6.w,
              runSpacing: 12.h,
              children: [
                /*...[
                    "Family",
                    "Lover",
                    "Friend",
                    "Peer",
                    "Supervisor",
                    "Subordinate",
                    "Business Parners"
                  ].map((e) => Container(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 25, vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            //border: Border.all(width: 1, color: Colors.black),
                            borderRadius: BorderRadiusDirectional.circular(50)),
                        child: Text(
                          e,
                          style: TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 16,
                            fontFamily: AppFonts.textFontFamily,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ))*/
                ...[
                  "Family",
                  "Lover",
                  "Peer",
                  "Friend",
                  "Supervisor",
                  "Subordinate",
                  "Business Parners",
                ].map(
                  (e) => CustomTag(
                    isSelected: true,
                    child: Text(
                      e,
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 16,
                        fontFamily: AppFonts.textFontFamily,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CommonBtn(
            isClickable: selectedIndex != -1,
            title: LanKey.determine.tr,
            margin: EdgeInsetsDirectional.only(
              start: 10,
              end: 10,
              bottom: 10.h,
            ),
            onTap: () {
              widget.onSelect.call("");
            },
          ),
        ],
      ),
    );
  }
}
