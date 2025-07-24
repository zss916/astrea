import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:intl_country_data/intl_country_data.dart';
import 'package:wheel_picker/wheel_picker.dart';

void showCountryCodeSheet({
  required int initialIndex,
  required List<IntlCountryData> data,
  required Function(String, int) onChange,
  required Function() onFinish,
}) {
  Get.bottomSheet(
    CountryCode(
      initialIndex: initialIndex,
      data: data,
      onFinish: onFinish,
      onChange: onChange,
    ),
    settings: RouteSettings(name: APages.countryCodeSheet),
  );
}

class CountryCode extends StatefulWidget {
  final int initialIndex;
  final List<IntlCountryData> data;
  final Function() onFinish;
  final Function(String, int) onChange;
  const CountryCode({
    super.key,
    required this.initialIndex,
    required this.data,
    required this.onFinish,
    required this.onChange,
  });

  @override
  State<CountryCode> createState() => _CountryCodeState();
}

class _CountryCodeState extends State<CountryCode> {
  late WheelPickerController ctrl;

  @override
  void initState() {
    super.initState();
    ctrl = WheelPickerController(
      itemCount: widget.data.length,
      initialIndex: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();
    ctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, _) {
        widget.onFinish.call();
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsetsDirectional.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    LanKey.cancel.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF6A676C),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.onChange.call(
                      "${widget.data[ctrl.selected].flag} +${widget.data[ctrl.selected].telephoneCode}",
                      ctrl.selected,
                    );
                    Get.back();
                  },
                  child: Text(
                    LanKey.finish.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFF585FC4),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.maxFinite,
              height: 200.h,
              child: WheelPicker(
                controller: ctrl,
                //itemCount: widget.data.length,
                //initialIndex: widget.initialIndex,
                builder: (context, index) => Text(
                  "+${widget.data[index].telephoneCode} ${widget.data[index].name}",
                  style: TextStyle(color: Color(0xFF323133), fontSize: 15),
                ),
                onIndexChanged: (i, _) {
                  //  onChange.call("${data[i].flag} +${data[i].telephoneCode}");
                },
                selectedIndexColor: Colors.black,
                style: WheelPickerStyle(
                  itemExtent: 26,
                  squeeze: 1.25,
                  diameterRatio: 0.8,
                  surroundingOpacity: 0.25,
                  magnification: 1.2,
                ),
                looping: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
