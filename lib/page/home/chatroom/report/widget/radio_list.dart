import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/components/common_btn.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/generated/assets.dart';

class RadioList extends StatefulWidget {
  const RadioList({super.key});

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  int _selectedIndex = -1;

  List<String> titles = [
    LanKey.reportTitle1.tr,
    LanKey.reportTitle2.tr,
    LanKey.reportTitle3.tr,
    LanKey.reportTitle4.tr,
    LanKey.reportTitle5.tr,
    LanKey.reportTitle6.tr,
    LanKey.reportTitle7.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsetsDirectional.only(top: 5),
            itemCount: 7,
            itemBuilder: (_, i) => InkWell(
              onTap: () {
                setState(() {
                  _selectedIndex = i;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        titles[i],
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 40.w),
                      child: Image.asset(
                        _selectedIndex == i
                            ? Assets.imageRadioS
                            : Assets.imageRadioU,
                        width: 20,
                        height: 20,
                        matchTextDirection: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        CommonBtn(
          isClickable: _selectedIndex != -1,
          title: LanKey.submit.tr,
          margin: EdgeInsetsDirectional.only(
            bottom: 32.h,
            top: 10.h,
            start: 20,
            end: 20,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
