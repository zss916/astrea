import 'dart:io';

import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/upload_url_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';

///system
abstract class SystemAPI {
  ///获取上传地址
  static Future<String?> getUploadUrl({required String fileName}) async {
    try {
      var result = await Http.instance.upload(
        ApiPath.getUploadUrl,
        query: {"file_name": fileName},
      );
      if (result["code"] == 0) {
        return UploadUrlEntity.fromJson(result["data"]).uploadUrl;
      } else {
        AppLoading.toast(result["msg"]);
        return null;
      }
      return null;
    } catch (error) {
      return null;
    }
  }

  ///上传文件
  static Future<bool> upload({
    required String url,
    required String filePath,
  }) async {
    try {
      var result = await Http.instance.put(url, data: File(filePath));
      return true;
    } catch (error) {
      return false;
    }
  }
}
