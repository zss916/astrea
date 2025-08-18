import 'package:astrea/components/common_app_bar.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/setting/app_color.dart';
import 'package:astrea/core/setting/app_fonts.dart';
import 'package:astrea/core/setting/app_setting.dart';
import 'package:astrea/core/translations/en.dart';
import 'package:astrea/page/account/accountInfo/details/widget/common_divider.dart';
import 'package:astrea/page/home/account/index/logic.dart';
import 'package:astrea/page/home/account/index/widget/edit_avatar.dart';
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
                EditAvatar(path: logic.avatar, logic: logic),
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
                          fontSize: 16.sp,
                          fontFamily: AppFonts.textFontFamily,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                buildPersonalData(logic),
                buildLawAndPrivacy(logic),
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
            start: 16.w,
            top: 24.h,
            end: 16.w,
            bottom: 16.h,
          ),
          width: double.maxFinite,
          child: Text(
            LanKey.personalDataTitle.tr,
            style: TextStyle(
              color: AppColor.textTitleColor,
              fontSize: 18.sp,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
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

  Widget buildLawAndPrivacy(AccountLogic logic) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(
            start: 16.w,
            top: 24.h,
            end: 16.w,
            bottom: 16.h,
          ),
          width: double.maxFinite,
          child: Text(
            LanKey.aboutUs.tr,
            style: TextStyle(
              color: AppColor.textTitleColor,
              fontSize: 18.sp,
              fontFamily: AppFonts.textFontFamily,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(
            start: 16.w,
            end: 16.w,
            bottom: 0.h,
          ),
          constraints: BoxConstraints(minHeight: (56 * 2)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.hardEdge,
          width: double.maxFinite,
          child: Column(
            children: [
              CommonItem(
                title: LanKey.privacyPolicy.tr,
                onTap: () {
                  logic.toPrivacy();
                },
              ),

              CommonDivider(),
              /*CommonItem(
                title: LanKey.subscriptionTerms.tr,
              ),
              CommonDivider(),*/
              CommonItem(
                title: LanKey.agreement.tr,
                onTap: () {
                  logic.toService();
                },
              ),
              //CommonDivider(),
              /*CommonItem(
                title: LanKey.contentRules.tr,
                onTap: () {
                  // LocationAPI.getCountryList();
                },
              ),*/
            ],
          ),
        ),

        Container(
          margin: EdgeInsetsDirectional.only(top: 18.h),
          alignment: AlignmentDirectional.center,
          width: double.maxFinite,
          child: Text(
            AppSetting.versionNumber,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF91929D),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
