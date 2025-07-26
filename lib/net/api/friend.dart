import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/friend_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';

///Friend
abstract class FriendAPI {
  ///查询朋友列表
  static Future<List<FriendEntity>> getFriends() async {
    try {
      var result = await Http.instance.get(ApiPath.getFriends);
      if (result["code"] == 0) {
        List<FriendEntity> value = (result['data']['friends'] as List)
            .map((e) => FriendEntity.fromJson(e))
            .toList();
        return value;
      } else {
        AppLoading.toast(result["msg"]);
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///添加朋友
  static Future<int?> addFriend({
    String? nickName,
    String? avatar,
    String? birthday,
    String? birthHour,
    String? birthMinute,
    int? sex,
    int? lon,
    int? lat,
    String? locality,
  }) async {
    Map<String, dynamic> map = {};
    if (nickName != null) {
      map["nick_name"] = nickName;
    }

    if (avatar != null) {
      map["headimg"] = avatar;
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
      map["lon"] = lon;
    }

    if (lat != null) {
      map["lat"] = lat;
    }

    if (locality != null) {
      map["locality"] = locality;
    }

    try {
      var result = await Http.instance.post(ApiPath.addFriend, data: map);
      return result["data"] as int;
    } catch (error) {
      return null;
    }
  }
}
