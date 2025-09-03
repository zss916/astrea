import 'package:astrea/core/enum/view_state.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:astrea/net/bean/friend_entity.dart';
import 'package:astrea/net/bean/natal_report_entity.dart';
import 'package:astrea/page/login/guide/email/enum/login_enum.dart';
import 'package:get/get.dart';

class PageTools {
  static toSplash() => Get.toNamed(APages.splash);

  static toStart({bool isRegistered = true}) => Get.offAndToNamed(
    APages.start,
    arguments: {"isRegistered": isRegistered},
  );

  static toGuide({required int loginType}) {
    Get.toNamed(APages.guide, arguments: loginType);
  }

  static offAllNamedGuide({required int loginType}) {
    Get.offAllNamed(APages.guide, arguments: loginType);
  }

  static toStep({required int loginType}) {
    String? currentRouter = AccountService.to.currentRouter;
    // debugPrint("currentRouter ==>$currentRouter");
    if (currentRouter == null) {
      offAllNamedGuide(loginType: loginType);
    } else {
      switch (currentRouter) {
        case APages.guide:
          offAllNamedGuide(loginType: loginType);
          break;
        case APages.dateOfBirth:
          offAllNamedGuide(loginType: loginType);
          toDateOfBirth(loginType: loginType);
          break;
        case APages.timeOfBirth:
        case APages.timeOfBirthTipDialog:
          offAllNamedGuide(loginType: loginType);
          toDateOfBirth(loginType: loginType);
          toTimeOfBirth(loginType: loginType);
          break;
        case APages.placeOfBirth:
          offAllNamedGuide(loginType: loginType);
          toDateOfBirth(loginType: loginType);
          toTimeOfBirth(loginType: loginType);
          toPlaceOfBirth(loginType: loginType);
          break;
        case APages.gender:
          offAllNamedGuide(loginType: loginType);
          toDateOfBirth(loginType: loginType);
          toTimeOfBirth(loginType: loginType);
          toPlaceOfBirth(loginType: loginType);
          toGender(loginType: loginType);
          break;
        case APages.editName:
          offAllNamedGuide(loginType: loginType);
          toDateOfBirth(loginType: loginType);
          toTimeOfBirth(loginType: loginType);
          toPlaceOfBirth(loginType: loginType);
          toGender(loginType: loginType);
          toEditUserName(loginType: loginType);
          break;
        case APages.interests:
          offAllNamedGuide(loginType: loginType);
          toDateOfBirth(loginType: loginType);
          toTimeOfBirth(loginType: loginType);
          toPlaceOfBirth(loginType: loginType);
          toGender(loginType: loginType);
          toEditUserName(loginType: loginType);
          toInterests(loginType: loginType);
          break;
      }
    }

    /*  if (currentRouter == null) {
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
          toGuide(loginType: loginType);
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
      }
    }*/
  }

  static toDateOfBirth({required int loginType}) {
    Get.toNamed(APages.dateOfBirth, arguments: loginType);
  }

  static toTimeOfBirth({required int loginType}) {
    Get.toNamed(APages.timeOfBirth, arguments: loginType);
  }

  static toPlaceOfBirth({required int loginType}) {
    Get.toNamed(APages.placeOfBirth, arguments: loginType);
  }

  static toGender({required int loginType}) {
    Get.toNamed(APages.gender, arguments: loginType);
  }

  static toEditUserName({required int loginType}) {
    Get.toNamed(APages.editName, arguments: loginType);
  }

  static toInterests({required int loginType}) {
    Get.toNamed(APages.interests, arguments: loginType);
  }

  static toWelcome({required int loginType, bool isRegistered = false}) {
    Get.toNamed(
      APages.welcome,
      arguments: {"loginType": loginType, "isRegistered": isRegistered},
    );
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
    required bool firstIsMe,
    required bool secondIsMe,
  }) => Get.toNamed(
    APages.starReport,
    arguments: {
      "firstId": firstId,
      "secondId": secondId,
      "relationship": relationship,
      "isSave": isSave,
      "firstIsMe": firstIsMe,
      "secondIsMe": secondIsMe,
    },
    parameters: {
      "userName": userName,
      "userAvatar": userAvatar,
      "friendName": friendName,
      "friendAvatar": friendAvatar,
      "relationship": relationship,
    },
  );

  static toStarReportPage({
    required String id,
    required String relationship,
    required String userName,
    required String friendName,
    required String userAvatar,
    required String friendAvatar,
    required bool firstIsMe,
    required bool secondIsMe,
  }) => Get.toNamed(
    APages.starReport,
    arguments: {
      "id": id,
      "isSave": true,
      "firstIsMe": firstIsMe,
      "secondIsMe": secondIsMe,
    },
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
    map["loginChannel"] = AccountService.to.getLoginChannel();
    Get.toNamed(APages.accountInformation, arguments: map);
  }

  static toPersonalData({AccountEntity? account, Function? onRefresh}) {
    Get.toNamed(APages.personalData, arguments: account)?.whenComplete(() {
      onRefresh?.call();
    });
  }

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
