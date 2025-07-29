import 'package:astrea/core/enum/app_enum.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:astrea/net/bean/friend_entity.dart';
import 'package:astrea/net/bean/natal_report_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTools {
  static toSplash() => Get.toNamed(APages.splash);

  static toStart() => Get.offAndToNamed(APages.start);

  static toGuide() {
    AccountService.to.updateLoginStep(step: LoginStep.step0.value);
    Get.toNamed(APages.guide);
  }

  static toStep() {
    if (AccountService.to.loginStep == null) {
      toGuide();
    } else {
      int step = (AccountService.to.loginStep ?? 0);
      debugPrint("step===>$step");
      switch (step) {
        case 0:
          toGuide();
          break;
        case 1:
          toDateOfBirth();
          break;
        case 2:
          toTimeOfBirth();
          break;
        case 3:
          toPlaceOfBirth();
          break;
        case 4:
          toGender();
          break;
        case 5:
          toEditUserName();
          break;
        case 6:
          toInterests();
          break;
        case 7:
          toWelcome();
          break;
      }
    }
  }

  static toDateOfBirth() {
    AccountService.to.updateLoginStep(step: LoginStep.step1.value);
    Get.toNamed(APages.dateOfBirth);
  }

  static toTimeOfBirth() {
    AccountService.to.updateLoginStep(step: LoginStep.step2.value);
    Get.toNamed(APages.timeOfBirth);
  }

  static toPlaceOfBirth() {
    AccountService.to.updateLoginStep(step: LoginStep.step3.value);
    Get.toNamed(APages.placeOfBirth);
  }

  static toGender() {
    AccountService.to.updateLoginStep(step: LoginStep.step4.value);
    Get.toNamed(APages.gender);
  }

  static toEditUserName() {
    AccountService.to.updateLoginStep(step: LoginStep.step5.value);
    Get.toNamed(APages.editName);
  }

  static toInterests() {
    AccountService.to.updateLoginStep(step: LoginStep.step6.value);
    Get.toNamed(APages.interests);
  }

  static toWelcome() {
    Get.toNamed(APages.welcome);
  }

  static toHome() => Get.toNamed(APages.home);

  static toNotifySetting() => Get.toNamed(APages.notifySetting);

  static toEmail() => Get.toNamed(APages.email);

  static toResult() => Get.toNamed(APages.result);

  static toStarChartAnalysis({
    NatalReportEntity? data,
    AccountEntity? account,
  }) {
    if (data != null && account != null) {
      Get.toNamed(APages.starChartAnalysis, arguments: [data, account]);
    }
  }

  static toSpiritualList() => Get.toNamed(APages.spiritualList);

  static toMyCollection() => Get.toNamed(APages.myCollection);

  static toTechnician() => Get.toNamed(APages.technician);

  static toRecord() => Get.toNamed(APages.record);

  static toAddFile({bool isEditFile = false, FriendEntity? data}) {
    Get.toNamed(
      APages.addFile,
      arguments: {"isEditFile": isEditFile, "data": data},
    );
  }

  static toLogs() => Get.toNamed(APages.starLog);

  /// 合盘分析
  static toStarReport({
    required num firstId,
    required num secondId,
    required String relationship,
    bool isSave = false,
    required String userName,
    required String friendName,
    required String userAvatar,
    required String friendAvatar,
  }) => Get.toNamed(
    APages.starReport,
    arguments: {
      "firstId": firstId,
      "secondId": secondId,
      "relationship": relationship,
      "isSave": isSave,
    },
    parameters: {
      "userName": userName,
      "userAvatar": userAvatar,
      "friendName": friendName,
      "friendAvatar": friendAvatar,
    },
  );

  /// 合盘分析
  static toStarReportPage({required String id}) =>
      Get.toNamed(APages.starReport, parameters: {"id": id});

  static toAccount() => Get.toNamed(APages.account);

  static toAccountInformation({AccountEntity? account}) {
    Map<String, dynamic> map = {};
    if (account?.loginEmail != null) {
      map["email"] = account?.loginEmail;
    }
    if (account?.userId != null) {
      map["uid"] = account?.userId;
    }
    if (account?.loginChannel != null) {
      map["loginChannel"] = account?.loginChannel;
    }
    Get.toNamed(APages.accountInformation, arguments: map);
  }

  static toPersonalData({AccountEntity? account, Function? onRefresh}) {
    Get.toNamed(APages.personalData, arguments: account)?.whenComplete(() {
      onRefresh?.call();
    });
  }

  static toTelephone() => Get.toNamed(APages.telephone);

  static toCertifiedDiviner() => Get.toNamed(APages.certifiedDiviner);

  static toCertifiedName() async {
    var result = await Get.toNamed(APages.certifiedName);
    debugPrint("====>>>>>result:$result");
  }

  static toCertifiedGender() async {
    var result = await Get.toNamed(APages.certifiedGender);
    debugPrint("result:$result");
  }

  static toCertifiedPreference() => Get.toNamed(APages.certifiedPreference);

  static toCertifiedIntroduction() => Get.toNamed(APages.certifiedIntroduction);

  static toCertifiedLink() => Get.toNamed(APages.certifiedLink);

  static toAstrologicalDirection() => Get.toNamed(APages.astrologicalDirection);

  static toUploadVideo() => Get.toNamed(APages.uploadVideo);

  static toRealName() => Get.toNamed(APages.realName);

  static toPayment() => Get.toNamed(APages.payment);

  static toBalance() => Get.toNamed(APages.balance);

  static toIndividualPrice() => Get.toNamed(APages.individualPrice);

  static toRewardDetails() => Get.toNamed(APages.rewardDetails);

  static toRedeem() => Get.toNamed(APages.redeem);

  static toSetPassword() => Get.toNamed(APages.setPassword);

  static toChat() => Get.toNamed(APages.chat);

  static toReport() => Get.toNamed(APages.report);

  static toEvaluation() => Get.toNamed(APages.evaluation);

  static toChooseBackground() => Get.toNamed(APages.chooseBackground);

  static toSubscribe() => Get.toNamed(APages.subscribe);

  static toFeedback() => Get.toNamed(APages.feedback);

  static toNoticeSetting() => Get.toNamed(APages.noticeSetting);

  static offAllNamedSplash() => Get.offAllNamed(APages.splash);

  static offAllNamedHome({NatalReportEntity? data}) =>
      Get.offAllNamed(APages.home, arguments: data);

  static offAllNamedLogin() => Get.offAllNamed(APages.welcome);
}
