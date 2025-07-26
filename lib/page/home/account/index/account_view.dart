import 'package:astrea/components/common_app_bar.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/account/accountInfo/details/widget/common_divider.dart';
import 'package:astrea/page/home/account/index/logic.dart';
import 'package:astrea/page/home/synastry/addFile/widget/edit_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../account/index/widget/common_item.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ComAppBar(
        title: LanKey.myFile.tr,
        leading: SizedBox.shrink(),
        backgroundColor: AppColor.pageBackground,
      ),
      backgroundColor: AppColor.pageBackground,
      body: SingleChildScrollView(
        child: GetBuilder<AccountLogic>(
          init: AccountLogic(),
          builder: (logic) {
            return Column(
              children: [
                EditAvatar(path: logic.avatar),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsetsDirectional.only(
                    start: 16,
                    end: 16,
                    top: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        logic.nickName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF323133),
                          fontSize: 16,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                buildPersonalData(logic),
                buildLawAndPrivacy(),
                SizedBox(height: 120.h),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildPersonalData(AccountLogic logic) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(
            start: 16,
            top: 24,
            end: 16,
            bottom: 16,
          ),
          width: double.maxFinite,
          child: Text(
            LanKey.personalDataTitle.tr,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 18,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 16, end: 16),
          constraints: BoxConstraints(minHeight: 224),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.hardEdge,
          width: double.maxFinite,
          child: Column(
            children: [
              CommonItem(
                title: LanKey.accountInformation.tr,
                onTap: () {
                  logic.toAccountInformation();
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.personalData.tr,
                onTap: () {
                  logic.toPersonalData();
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.feedback.tr,
                onTap: () {
                  PageTools.toFeedback();
                },
              ),
              CommonDivider(),
              CommonItem(
                title: LanKey.notice.tr,
                onTap: () {
                  PageTools.toNoticeSetting();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLawAndPrivacy() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(
            start: 16,
            top: 24,
            end: 16,
            bottom: 16,
          ),
          width: double.maxFinite,
          child: Text(
            LanKey.lawAndPrivacy.tr,
            style: TextStyle(
              color: const Color(0xFF6A676C),
              fontSize: 18,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 0.h),
          constraints: BoxConstraints(minHeight: (56 * 3)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.hardEdge,
          width: double.maxFinite,
          child: Column(
            children: [
              CommonItem(
                title: LanKey.agreement.tr,
                onTap: () {
                  AppLoading.toast("${LanKey.agreement.tr}");
                },
              ),
              CommonDivider(),
              /*CommonItem(
                title: LanKey.subscriptionTerms.tr,
              ),
              CommonDivider(),*/
              CommonItem(title: LanKey.privacyPolicy.tr),
              CommonDivider(),
              CommonItem(
                title: LanKey.contentRules.tr,
                onTap: () {
                  // LocationAPI.getCountryList();
                },
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(top: 18),
          alignment: AlignmentDirectional.center,
          width: double.maxFinite,
          child: Text(
            "V 1.0.0",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF91929D),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
