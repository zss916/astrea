import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/friend_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

///Friend
abstract class FriendAPI {
  ///查询朋友列表
  static Future<(bool, List<FriendEntity>)> getFriends({
    CancelToken? cancelToken,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getFriends,
        cancelToken: cancelToken,
      );
      if (result["code"] == 0) {
        List<FriendEntity> value = await compute(
          (List<dynamic> jsonList) =>
              jsonList.map((e) => FriendEntity.fromJson(e)).toList(),
          (result['data']['friends'] as List),
        );
        List<FriendEntity> me = value.where((e) => e.isMe).toList();
        List<FriendEntity> friends = value
            .where((e) => !e.isMe)
            .toList()
            .reversed
            .toList();
        me.addAll(friends);
        return (true, me);
      } else {
        AppLoading.toast(result["msg"]);
        return (false, <FriendEntity>[]);
      }
    } catch (error) {
      return (false, <FriendEntity>[]);
    }
  }

  ///添加朋友
  static Future<int?> addFriend({
    String? nickName,
    String? avatar,
    String? birthday,
    num? birthHour,
    num? birthMinute,
    int? sex,
    String? lon,
    String? lat,
    String? locality,
    String? interests,
    CancelToken? cancelToken,
  }) async {
    Map<String, dynamic> map = {};
    if (nickName != null) {
      map["nick_name"] = nickName;
    }

    if (avatar != null) {
      map["head_img"] = avatar;
    }

    if (birthday != null) {
      map["birthday"] = birthday;
    }

    if (birthHour != null) {
      map["birth_hour"] = birthHour;
    }

    if (birthMinute != null) {
      map["birth_minute"] = birthMinute;
    }

    if (sex != null) {
      map["sex"] = sex;
    }

    if (lon != null) {
      map["lon"] = num.parse(lon);
    }

    if (lat != null) {
      map["lat"] = num.parse(lat);
    }

    if (locality != null) {
      map["locality"] = locality;
    }

    if (interests != null) {
      map["interests"] = interests;
    }

    try {
      var result = await Http.instance.post(
        ApiPath.addFriend,
        cancelToken: cancelToken,
        data: map,
      );
      if (result["code"] == 0) {
        return result["data"]["id"] as int?;
      } else {
        AppLoading.toast(result["msg"]);
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///删除朋友
  static Future<bool> deleteFriend({
    required String id,
    CancelToken? cancelToken,
  }) async {
    try {
      Map<String, dynamic> map = {};
      map["friend_id"] = num.parse(id);
      await Http.instance.delete(
        ApiPath.deleteFriend,
        cancelToken: cancelToken,
        data: map,
      );
      return true;
    } catch (error) {
      return false;
    }
  }

  ///修改朋友
  static Future<bool> updateFriend({
    required String id,
    String? nickName,
    String? avatar,
    String? birthday,
    num? birthHour,
    num? birthMinute,
    int? sex,
    String? lon,
    String? lat,
    String? locality,
    String? interests,
    CancelToken? cancelToken,
  }) async {
    try {
      Map<String, dynamic> map = {};
      map["friend_id"] = num.parse(id);

      if (nickName != null) {
        map["nick_name"] = nickName;
      }

      if (avatar != null) {
        map["head_img"] = avatar;
      }

      if (birthday != null) {
        map["birthday"] = birthday;
      }

      if (birthHour != null) {
        map["birth_hour"] = birthHour;
      }

      if (birthMinute != null) {
        map["birth_minute"] = birthMinute;
      }

      if (sex != null) {
        map["sex"] = sex;
      }

      if (lon != null) {
        map["lon"] = num.parse(lon);
      }

      if (lat != null) {
        map["lat"] = num.parse(lat);
      }

      if (locality != null) {
        map["locality"] = locality;
      }

      if (interests != null) {
        map["interests"] = interests;
      }

      var result = await Http.instance.put(
        ApiPath.putFriend,
        cancelToken: cancelToken,
        data: map,
      );
      return result["code"] == 0;
    } catch (error) {
      return false;
    }
  }
}
