import 'dart:convert';

import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/router/page_tools.dart';
import 'package:astrea/core/storage/storage.dart';
import 'package:astrea/core/utils/calculate.dart';
import 'package:astrea/generated/json/base/json_convert_content.dart';
import 'package:astrea/net/bean/account_entity.dart';
import 'package:astrea/net/bean/friend_entity.dart';
import 'package:astrea/page/login/guide/interests/widget/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountService extends GetxService {
  static AccountService get to => Get.find();

  static const String userData = "horoscope_save_user_info";
  static const String friendData = "horoscope_save_friends";
  static const String accountAndPwd = "horoscope_login_account_and_pwd";
  static const String noticeSelectIndexKey = "noticeSelectIndexKey";
  AccountEntity? data;

  ///初始化
  Future<AccountService> init() async {
    String? str = StorageService.to.getString(userData);
    if (str.isNotEmpty) {
      try {
        data = JsonConvert.fromJsonAsT<AccountEntity>(jsonDecode(str))!;
      } catch (e) {
        debugPrint("$e");
      }
    } else {
      data = AccountEntity();
    }
    return this;
  }

  ///是否登录
  bool get isLogin => (data != null) && (data?.authToken != null);

  ///是否更新用户信息
  // bool get isNotUpdateUserInfo => (data?.isNewUser ?? 1) == 1;

  ///获取登录邮箱
  String get loginEmail => data?.loginEmail ?? "-";

  ///获取登录渠道
  int get loginChannelIndex => data?.loginChannel ?? 0;

  ///获取用户ID
  String get userID => data?.userId ?? "-";

  ///请求星盘分析等需要
  String get friendId => data?.friendId ?? "";

  ///获取登录渠道
  //int? get loginStep => data?.loginStep;

  ///当前路由
  String? get currentRouter => data?.currentRouter;

  ///是否新用户
  bool get isNewUser => (data?.isNewUser ?? 1) == 1;

  ///是否完成资料的录入
  // bool get isFinishRecord => (loginStep == LoginStep.stepFinish.value);

  ///通知
  bool get switchNotification => data?.switchNotification ?? false;

  ///设置通知
  void setNotify(bool? switchNotification) {
    data?.switchNotification = switchNotification;
    save(data!);
  }

  ///设置通知选择
  void setNoticeSelectIndex(int index) =>
      StorageService.to.setInt(noticeSelectIndexKey, index);

  ///获取通知选择
  int getNoticeSelectIndex() =>
      StorageService.to.getInt(noticeSelectIndexKey) ?? 2;

  ///保存用户信息
  void updateLocalUserInfo({
    required String loginEmail,
    required int loginChannel,
    required String authToken,
    required String? uid,
    String? friendId,
    String? nickName,
    int? isNewUser,
    AccountEntity? value,
  }) {
    if (value != null) {
      data = value;
    }
    if (uid != null) {
      data?.userId = uid;
    }
    if (friendId != null) {
      data?.friendId = friendId;
    }
    data?.loginEmail = loginEmail;
    data?.loginChannel = loginChannel;
    data?.authToken = authToken;
    if (nickName != null) {
      data?.nickName = nickName;
    }
    if (isNewUser != null) {
      data?.isNewUser = isNewUser;
    }
    save(data!);
  }

  ///记录报告失败
  /*void setResult({required bool isFinish}) {
    StorageService.to.setBool("horoscope_result", isFinish);
  }*/

  ///记录报告失败
  /*bool getResult() => StorageService.to.getBool("horoscope_result");
*/
  ///保存用户登录步骤
  /*  void updateLoginStep({int? step}) {
    if (step != null) {
      data?.loginStep = step;
    }
    save(data!);
  }*/

  void setCurrentRoute({String? route}) {
    switch (route) {
      case APages.guide:
        updateCurrentRoute(route: route);
        break;
      case APages.dateOfBirth:
        updateCurrentRoute(route: route);
        break;
      case APages.timeOfBirth:
      case APages.timeOfBirthTipDialog:
        updateCurrentRoute(route: APages.timeOfBirth);
        break;
      case APages.placeOfBirth:
        updateCurrentRoute(route: route);
        break;
      case APages.gender:
        updateCurrentRoute(route: route);
        break;
      case APages.editName:
        updateCurrentRoute(route: route);
        break;
      case APages.interests:
        updateCurrentRoute(route: route);
        break;
      case APages.welcome:
        // updateCurrentRoute(route: APages.welcome);
        break;
    }
  }

  ///保存当前路由
  void updateCurrentRoute({String? route}) {
    debugPrint("updateCurrentRoute ==>$route");
    if (route != null) {
      data?.currentRouter = route;
    }
    save(data!);
  }

  ///获取用户token
  String getAuthToken() => data?.authToken ?? "";

  ///更新用户token
  void updateAuthToken(String? authToken) {
    data?.authToken = authToken;
    save(data!);
  }

  ///更新用户生日
  void updateUserBirth(String birthday) {
    debugPrint("birthday => $birthday");
    data?.birthday = birthday;
    data?.age = CalculateTools.calculateAge(birthday);
    save(data!);
    getUserBirth();
  }

  ///获取用户生日数据
  (int year, int month, int day) getUserBirth() {
    if (data?.birthday != null) {
      List<String> list = (data?.birthday ?? "").split("-");
      if (list.isEmpty) {
        DateTime date = DateTime.now();
        // ((DateTime.now().year - 25), (DateTime.now().month), 15)
        return (date.year - 25, date.month, 15);
      } else {
        return (int.parse(list[0]), int.parse(list[1]), int.parse(list[2]));
      }
    } else {
      DateTime date = DateTime.now();
      return (date.year - 25, date.month, 15);
    }
  }

  ///更新用户生日时间
  void updateUserBirthHAndM(int birthHour, int birthMinute) {
    debugPrint("birthHour => $birthHour，birthMinute => $birthMinute");
    data?.birthHour = birthHour;
    data?.birthMinute = birthMinute;
    save(data!);
  }

  ///获取用户生日时间
  (int hour, int minute) getUserBirthHAndM() {
    if (data?.birthHour != null && data?.birthMinute != null) {
      return (data?.birthHour ?? 0, data?.birthMinute ?? 0);
    } else {
      DateTime date = DateTime.now();
      //return (date.hour, date.minute);
      return (12, 0);
    }
  }

  ///更新用户出生地址
  void updatePlaceBirth(String place, String lat, String lon) {
    data?.locality = place;
    data?.lat = lat;
    data?.lon = lon;
    save(data!);
  }

  ///获取用户出生地址
  (String place, String lat, String lot) getPlaceBirth() {
    if (data?.locality != null) {
      return (
        data?.locality ?? "",
        data?.lat.toString() ?? "",
        data?.lon.toString() ?? "",
      );
    } else {
      return ("", "", "");
    }
  }

  String get showLocality => (data?.locality ?? "");

  ///更新用户兴趣
  void updateUserInterest(List<int> list) {
    data?.interestsIndex = list;
    data?.interests = list.map((e) => interests[e]).toList().join(",");
    save(data!);
  }

  ///获取用户兴趣
  List<String> getUserInterest() {
    if (data?.interests != null) {
      List<String> list = (data?.interests ?? "").split(",");
      return list;
    } else {
      return [];
    }
  }

  ///获取用户兴趣索引
  List<int> getUserInterestIndex() => data?.interestsIndex ?? [];

  ///获取兴趣str(接口需要)
  /*String getInterest() {
    return getUserInterestIndex().map((e) => interests[e]).toList().join(",");
  }*/

  ///更新用户性别
  void updateUserSex(int sex) {
    data?.sex = sex;
    save(data!);
  }

  ///获取用户性别
  int getUserSex() => data?.sex ?? 0;

  ///更新用户年龄
  /* void updateUserAge(int age) {
    data?.age = age;
    save(data!);
  }*/

  ///更新用户标签
  /*void updateUserTags(List<String> tags) {
    data?.tags = tags;
    save(data!);
  }*/

  ///更新用户头像
  void updateUserAvatar(String avatar) {
    data?.headimg = avatar;
    save(data!);
  }

  ///更新用户昵称
  void updateUserNickName(String nickName) {
    data?.nickName = nickName;
    save(data!);
  }

  ///获取用户昵称
  String getUserNickName() => data?.nickName ?? "";

  ///更新用户账号信息(接口获取account)
  void update(AccountEntity value) {
    if (value.friendId != null) {
      data?.friendId = value.friendId;
    }
    if (value.userId != null) {
      data?.userId = value.userId;
    }
    if (value.nickName != null) {
      data?.nickName = value.nickName;
    }
    if (value.headimg != null) {
      data?.headimg = value.headimg;
    }
    if (value.isNewUser != null) {
      data?.isNewUser = value.isNewUser;
    }
    if (value.sex != null) {
      data?.sex = value.sex;
    }
    if (value.age != null) {
      data?.age = value.age;
    }
    if (value.birthday != null) {
      data?.birthday = value.birthday;
    }
    if (value.interests != null) {
      data?.interests = value.interests;
    }
    if (value.lat != null) {
      data?.lat = value.lat;
    }
    if (value.lon != null) {
      data?.lon = value.lon;
    }
    if (value.birthHour != null) {
      data?.birthHour = value.birthHour;
    }
    if (value.birthMinute != null) {
      data?.birthMinute = value.birthMinute;
    }
    //this.data = data;
    save(data!);
  }

  ///保存用户账号信息
  void save(AccountEntity value) {
    StorageService.to.setString(userData, jsonEncode(value.toJson()));
  }

  ///获取用户账号信息
  AccountEntity? getAccount() {
    String? str = StorageService.to.getString(userData);
    if (str.isNotEmpty) {
      try {
        data = JsonConvert.fromJsonAsT<AccountEntity>(jsonDecode(str));
        return data;
      } catch (e) {
        debugPrint("$e");
        return null;
      }
    } else {
      return null;
    }
  }

  ///保存朋友列表
  void updateFriendList(List<FriendEntity> friends) {
    List<String> value = friends.map((e) => jsonEncode(e.toJson())).toList();
    StorageService.to.setList(friendData, value);
  }

  ///获取朋友列表
  List<FriendEntity> getFriendList() {
    List<String> list = StorageService.to.getList(friendData);
    if (list.isNotEmpty) {
      List<FriendEntity> value = list
          .map(
            (e) =>
                JsonConvert.fromJsonAsT<FriendEntity>(jsonDecode(e)) ??
                FriendEntity(),
          )
          .toList();
      return value;
    } else {
      return [];
    }
  }

  ///注销
  Future<void> logout() async {
    //updateCurrentRoute(route: null);
    clear();
    data = AccountEntity();
    //PageTools.offAllNamedLogin();
    PageTools.offAllNamedSplash();
  }

  ///清除用户信息
  void clear() {
    StorageService.to.remove(userData);
  }

  ///删除账号
  void deleteAccount() {
    clear();
    StorageService.to.clear();
    data = AccountEntity();
    PageTools.offAllNamedSplash();
  }

  ///保存已登录账号和密码
  void saveAccountAndPsd(String account, String pwd) {
    Map<String, dynamic> map = {"account": account, "pwd": pwd};
    StorageService.to.setString(accountAndPwd, jsonEncode(map));
  }

  ///获取已登录账号和密码
  (String? account, String? pwd) getAccountAndPsd() {
    String? str = StorageService.to.getString(accountAndPwd);
    if (str.isNotEmpty) {
      try {
        Map<String, dynamic> map = jsonDecode(str);
        return (map["account"] ?? "", map["pwd"] ?? "");
      } catch (e) {
        debugPrint("$e");
        return ("", "");
      }
    } else {
      return ("", "");
    }
  }
}
