import 'package:astrea/core/toast/app_loading.dart';
import 'package:astrea/net/bean/upload_url_entity.dart';
import 'package:astrea/net/http/http.dart';
import 'package:astrea/net/path.dart';
import 'package:upload/app_upload_isolate.dart';

///system
abstract class SystemAPI {
  ///获取上传地址
  static Future<String?> getUploadUrl({
    required String fileName,
    required String filePath,
  }) async {
    try {
      var result = await Http.instance.get(
        ApiPath.getUploadUrl,
        query: {"file_name": fileName},
      );
      if (result["code"] == 0) {
        UploadUrlEntity upload = UploadUrlEntity.fromJson(result["data"]);
        if (upload.uploadUrl != null) {
          bool isSuccessful = await SystemAPI.upload(
            url: upload.uploadUrl ?? "",
            filePath: filePath,
          );
          return isSuccessful ? (upload.cdnUrl ?? "") : null;
        } else {
          return null;
        }
      } else {
        AppLoading.toast(result["msg"]);
        return null;
      }
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
      final value = await AppUploadIsolate().loadData(url, filePath);
      return (value == 200);
    } catch (error) {
      return false;
    }
  }
}
