import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/auth_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

///auth
abstract class AuthAPI {
  ///邮箱登录
  static Future<(bool, AuthEntity?, int)> emailLogin({
    required String email,
    required String pwd,
    required int loginType,
    CancelToken? cancelToken,
  }) async {
    try {
      var result = await Http.instance.post(
        ApiPath.emailLogin,
        cancelToken: cancelToken,
        //data: {"email": email, "pwd": pwd, "login_type": loginType},
        data: {"email": email, "pwd": pwd, "login_type": loginType},
      );

      if (result["code"] == 0) {
        AuthEntity value = await compute(
          (dynamic jsonStr) => AuthEntity.fromJson(jsonStr),
          result["data"],
        );
        return (true, value, 0);
      } else {
        switch (result["code"]) {
          case 1005:
            AppLoading.toast("Account does not exist or password is incorrect");
            break;
          case 1006:
            AppLoading.toast("The password you entered is incorrect");
            break;
          case 1007:
            debugPrint("Account already exists!");
            break;
          default:
            AppLoading.toast("${result["msg"]}");
        }
        return (false, null, (result["code"] as int));
      }
    } catch (error) {
      return (false, null, -1);
    }
  }

  ///google登录
  static Future<AuthEntity?> googleLogin({
    required String token,
    CancelToken? cancelToken,
  }) async {
    try {
      var result = await Http.instance.post(
        ApiPath.googleLogin,
        cancelToken: cancelToken,
        data: {"id_token": token},
      );
      if (result["code"] == 0) {
        AuthEntity value = await compute(
          (dynamic jsonStr) => AuthEntity.fromJson(jsonStr),
          result["data"],
        );
        return value;
      } else {
        AppLoading.toast("${result["msg"]}");
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///apple登录
  static Future<AuthEntity?> appleLogin({
    required String code,
    String? token,
    String? thirdId,
    CancelToken? cancelToken,
  }) async {
    try {
      Map<String, dynamic> map = {"code": code};
      if (token != null) {
        map["id_token"] = token;
      }
      if (thirdId != null) {
        map["third_id"] = thirdId;
      }
      var result = await Http.instance.post(
        ApiPath.appleLogin,
        cancelToken: cancelToken,
        data: map,
      );
      if (result["code"] == 0) {
        AuthEntity value = await compute(
          (dynamic jsonStr) => AuthEntity.fromJson(jsonStr),
          result["data"],
        );
        return value;
      } else {
        AppLoading.toast("${result["msg"]}");
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  ///刷新登录token
  static Future<(bool, AuthEntity)> refreshLoginToken({
    required String code,
    String? token,
    String? thirdId,
  }) async {
    try {
      var result = await Http.instance.post(ApiPath.refreshToken);
      if (result["code"] == 0) {
        return (true, AuthEntity.fromJson(result["data"]));
      } else {
        AppLoading.toast("${result["msg"]}");
        return (false, AuthEntity());
      }
    } catch (error) {
      return (false, AuthEntity());
    }
  }

  ///退出登录
  static Future<bool> logOut({CancelToken? cancelToken}) async {
    try {
      var result = await Http.instance.post(
        ApiPath.logout,
        cancelToken: cancelToken,
      );
      if (result["code"] != 0) {
        AppLoading.toast("${result["msg"]}");
      }
      return (result["code"] == 0);
    } catch (error) {
      return false;
    }
  }
}
