import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/auth_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';

///auth
abstract class AuthAPI {
  ///邮箱登录
  static Future<(bool, AuthEntity)> emailLogin({
    required String email,
    required String pwd,
  }) async {
    try {
      var result = await Http.instance.post(
        ApiPath.emailLogin,
        data: {"email": email, "pwd": pwd},
      );

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

  ///google登录
  static Future<AuthEntity> googleLogin({required String token}) async {
    try {
      var result = await Http.instance.post(
        ApiPath.googleLogin,
        data: {"id_token": token},
      );
      return AuthEntity.fromJson(result["data"]);
    } catch (error) {
      return AuthEntity();
    }
  }

  ///apple登录
  static Future<AuthEntity> appleLogin({
    required String code,
    String? token,
    String? thirdId,
  }) async {
    try {
      Map<String, dynamic> map = {"code": code};
      if (token != null) {
        map["id_token"] = token;
      }
      if (thirdId != null) {
        map["third_id"] = thirdId;
      }
      var result = await Http.instance.post(ApiPath.appleLogin, data: map);
      return AuthEntity.fromJson(result["data"]);
    } catch (error) {
      return AuthEntity();
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
  static Future<bool> logOut() async {
    try {
      var result = await Http.instance.post(ApiPath.logout);
      if (result["code"] != 0) {
        AppLoading.toast("${result["msg"]}");
      }
      return (result["code"] == 0);
    } catch (error) {
      return false;
    }
  }
}
