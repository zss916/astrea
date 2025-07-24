import 'dart:math';

//import 'package:country_calling_code_picker_plus/country_calling_code_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/account/person/personalData/telephone/widget/country_code_sheet.dart';
import 'package:intl_country_data/intl_country_data.dart';

class TelephoneCode extends StatefulWidget {
  const TelephoneCode({super.key});

  @override
  State<TelephoneCode> createState() => _TelephoneCodeState();
}

class _TelephoneCodeState extends State<TelephoneCode> {
  bool isShow = false;
  List<IntlCountryData> countryList = [];
  String flag = '';
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    loadList();
  }

  void loadList() {
    countryList = IntlCountryData.all();
    selectIndex = countryList.indexWhere(
      (e) =>
          (e.codeAlpha2).toLowerCase() ==
          (Get.locale?.countryCode ?? "").toLowerCase(),
    );

    flag =
        "${countryList[selectIndex].flag} +${countryList[selectIndex].telephoneCode}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShow = true;
        });
        showCountryCodeSheet(
          initialIndex: selectIndex,
          data: countryList,
          onChange: (value, i) {
            setState(() {
              flag = value;
              selectIndex = i;
            });
          },
          onFinish: () {
            setState(() {
              isShow = false;
            });
          },
        );
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Color(0xFFE1DFE3)),
          borderRadius: BorderRadius.circular(20),
        ),
        width: 107,
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              flag,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF323133),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 8),
              child: Transform.rotate(
                angle: isShow ? (pi / 1) : 0,
                child: Image.asset(
                  Assets.imageArrowBottom,
                  matchTextDirection: true,
                  width: 18,
                  height: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
