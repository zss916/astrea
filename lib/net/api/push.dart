import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';

///push
abstract class PushAPI {
  ///清除推送badge
  static Future<bool> cleanPushBadge() async {
    try {
      var result = await Http.instance.delete(ApiPath.cleanPushBadge);
      return true;
    } catch (error) {
      return false;
    }
  }

  ///更新推送token
  static Future<String> refreshPushToken() async {
    try {
      var result = await Http.instance.post(ApiPath.refreshPushToken);
      return result["push_token"];
    } catch (error) {
      return "";
    }
  }
}
