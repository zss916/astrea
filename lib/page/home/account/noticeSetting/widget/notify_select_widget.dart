import 'package:astrea/components/custom_item_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotifySelectWidget extends StatelessWidget {
  final int? selectIndex;
  final Function(int)? onNet;
  NotifySelectWidget({super.key, this.selectIndex, this.onNet});
  final List<String> items = ["Noon", "Morning", "Evening"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            height: 35,
            width: 180,
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xFFEDEDFD),
              borderRadius: BorderRadiusDirectional.circular(100),
            ),
          ),
          CustomItemPicker(
            items: items,
            initialIndex: selectIndex ?? 2,
            maxIndex: 2,
            minIndex: 0,
            backgroundColor: Colors.transparent,
            fadeEffect: false,
            selectedTextStyle: TextStyle(
              color: Color(0xFF323133),
              fontSize: 22,
              //fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w500,
            ),
            unselectedTextStyle: TextStyle(
              color: Color(0xFF323133),
              fontSize: 16.sp,
              // fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
            selectorColor: Colors.transparent,
            visibleItemCount: 3,
            itemHeight: 35,
            itemWidth: 200,
            onSelectedItemChanged: (index) {
              debugPrint("item:${items[index]}");
              onNet?.call(index);
            },
          ),
        ],
      ),
    );
  }
}
