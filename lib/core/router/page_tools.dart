import 'package:astrea/core/enum/view_state.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:astrea/net/bean/friend_entity.dart';
import 'package:astrea/net/bean/natal_report_entity.dart';
import 'package:astrea/page/login/guide/email/enum/login_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTools {
  static toSplash() => Get.toNamed(APages.splash);

  static toStart({bool isRegistered = true}) => Get.offAndToNamed(
    APages.start,
    arguments: {"isRegistered": isRegistered},
  );

  static toGuide({required int loginType}) {
    // AccountService.to.updateLoginStep(step: LoginStep.step0.value);
    Get.toNamed(APages.guide, arguments: loginType);
  }

  static toStep({required int loginType}) {
    //debugPrint("currentRouter ==>${AccountService.to.data}");
    String? currentRouter = AccountService.to.currentRouter;
    debugPrint("currentRouter ==>$currentRouter");
    if (currentRouter == null) {
      toGuide(loginType: loginType);
    } else {
      switch (currentRouter) {
        case APages.guide:
          toGuide(loginType: loginType);
          break;
        case APages.dateOfBirth:
          toDateOfBirth(loginType: loginType);
          break;
        case APages.timeOfBirth:
        case APages.timeOfBirthTipDialog:
          toTimeOfBirth(loginType: loginType);
          break;
        case APages.placeOfBirth:
          toPlaceOfBirth(loginType: loginType);
          break;
        case APages.gender:
          toGender(loginType: loginType);
          break;
        case APages.editName:
          toEditUserName(loginType: loginType);
          break;
        case APages.interests:
          toInterests(loginType: loginType);
          break;
        case APages.welcome:
          toWelcome(loginType: loginType);
          break;
      }
    }
  }

  /*static toStep2({required int loginType}) {
    if (AccountService.to.loginStep == null) {
      toGuide(loginType: loginType);
    } else {
      int step = (AccountService.to.loginStep ?? 0);
      debugPrint("step===>$step");
      switch (step) {
        case 0:
          toGuide(loginType: loginType);
          break;
        case 1:
          toDateOfBirth(loginType: loginType);
          break;
        case 2:
          toTimeOfBirth(loginType: loginType);
          break;
        case 3:
          toPlaceOfBirth(loginType: loginType);
          break;
        case 4:
          toGender(loginType: loginType);
          break;
        case 5:
          toEditUserName(loginType: loginType);
          break;
        case 6:
          toInterests(loginType: loginType);
          break;
        case 7:
          toWelcome(loginType: loginType);
          break;
      }
    }
  }*/

  static toDateOfBirth({required int loginType}) {
    // AccountService.to.updateLoginStep(step: LoginStep.step1.value);
    Get.toNamed(APages.dateOfBirth, arguments: loginType);
  }

  static toTimeOfBirth({required int loginType}) {
    // AccountService.to.updateLoginStep(step: LoginStep.step2.value);
    Get.toNamed(APages.timeOfBirth, arguments: loginType);
  }

  static toPlaceOfBirth({required int loginType}) {
    // AccountService.to.updateLoginStep(step: LoginStep.step3.value);
    Get.toNamed(APages.placeOfBirth, arguments: loginType);
  }

  static toGender({required int loginType}) {
    // AccountService.to.updateLoginStep(step: LoginStep.step4.value);
    Get.toNamed(APages.gender, arguments: loginType);
  }

  static toEditUserName({required int loginType}) {
    // AccountService.to.updateLoginStep(step: LoginStep.step5.value);
    Get.toNamed(APages.editName, arguments: loginType);
  }

  static toInterests({required int loginType}) {
    // AccountService.to.updateLoginStep(step: LoginStep.step6.value);
    Get.toNamed(APages.interests, arguments: loginType);
  }

  static toWelcome({required int loginType}) {
    Get.toNamed(APages.welcome, arguments: loginType);
  }

  static toNotifySetting() => Get.toNamed(APages.notifySetting);

  static toEmail({required int loginType}) =>
      Get.toNamed(APages.email, arguments: loginType);

  static toResult() => Get.toNamed(APages.result);

  static toStarChartAnalysis({
    NatalReportEntity? data,
    String? nickName,
    String? birthday,
  }) {
    if (data != null && nickName != null && birthday != null) {
      Get.toNamed(
        APages.starChartAnalysis,
        arguments: data,
        parameters: {"nickName": nickName, "birthday": birthday},
      );
    }
  }

  static toSpiritualList() => Get.toNamed(APages.spiritualList);

  static toMyCollection() => Get.toNamed(APages.myCollection);

  static toTechnician() => Get.toNamed(APages.technician);

  static toRecord() => Get.toNamed(APages.record);

  static toAddFile({
    bool isEditFile = false,
    FriendEntity? data,
    Function(FriendEntity)? onBack,
    bool? homeToAdd,
  }) {
    Get.toNamed(
      APages.addFile,
      arguments: {
        "isEditFile": isEditFile,
        "data": data,
        "homeToAdd": homeToAdd,
      },
    )?.then((value) {
      if (value != null) {
        FriendEntity entity = (value as FriendEntity);
        onBack?.call(entity);
      }
    });
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
      "relationship": relationship,
    },
  );

  /// 合盘分析
  static toStarReportPage({
    required String id,
    required String userName,
    required String friendName,
    required String userAvatar,
    required String friendAvatar,
    required String relationship,
  }) => Get.toNamed(
    APages.starReport,
    arguments: {"id": id, "isSave": true},
    parameters: {
      "userName": userName,
      "userAvatar": userAvatar,
      "friendName": friendName,
      "friendAvatar": friendAvatar,
      "relationship": relationship,
    },
  );

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

  static toHome({String? friendId}) {
    Get.toNamed(
      APages.home,
      arguments: {
        "viewSate": HomeViewState.loading.index,
        "data": null,
        "friendId": friendId,
      },
    );
  }

  static offAllNamedHome({NatalReportEntity? data, String? friendId}) {
    int viewSate = HomeViewState.reload.index;
    if (data != null && friendId != null) {
      viewSate = HomeViewState.data.index;
    }
    if (data == null && friendId != null) {
      viewSate = HomeViewState.loading.index;
    }
    if (data == null && friendId == null) {
      viewSate = HomeViewState.reload.index;
    }
    Get.offAllNamed(
      APages.home,
      arguments: {"viewSate": viewSate, "data": data, "friendId": friendId},
    );
  }

  static offAndNamedGuide() {
    // AccountService.to.updateLoginStep(step: LoginStep.step0.value);
    Get.offAndToNamed(APages.guide);
  }

  static offAllNamedLogin() =>
      Get.offAllNamed(APages.welcome, arguments: LoginType.onlyLogin.index);

  static loginToNext({required int loginType, String? friendId}) {
    if (loginType == LoginType.onlyLogin.index) {
      PageTools.offAllNamedHome(friendId: friendId);
    } else {
      PageTools.toResult();
    }
  }

  static toWeb({required String title, required String url}) =>
      Get.toNamed(APages.webview, arguments: {"title": title, "url": url});
}
