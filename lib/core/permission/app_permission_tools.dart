//import 'package:notification_permissions/notification_permissions.dart' as notification;
import 'package:astrea/core/toast/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionTools {
  /// 检查通知权限
  static void checkNotification({Function? onGranted, Function? onToNext}) {
    Permission.notification.request().then((value) {
      ///ios 可用 出现弹窗
      /*if (value != PermissionStatus.granted) {
        notification.NotificationPermissions.requestNotificationPermissions();
      }*/

      if (value == PermissionStatus.granted) {
        onGranted?.call();
      } else {
        onToNext?.call();
      }
    });
  }

  /// 检查相机权限
  static Future<bool> checkCameraPermission({
    Function? cancelPermission,
    bool hadTip = false,
  }) async {
    Map status = await [Permission.camera].request();
    var cameraStatus = status[Permission.camera];

    List<Permission> permissions = [];
    if (cameraStatus == PermissionStatus.permanentlyDenied) {
      permissions.add(Permission.camera);
    }

    // 有永久拒绝的，提示去设置页面
    if (permissions.isNotEmpty) {
      AppLoading.toast("openAppSettings");
      //openAppSettings();
      // showPermissionSetting(permissions, cancelPermission);
      return false;
    }

    if (cameraStatus != PermissionStatus.granted) {
      permissions.add(Permission.camera);
      debugPrint("==>camera");
    }
    // 有拒绝的，提示获取权限
    if (permissions.isNotEmpty && !hadTip) {
      AppLoading.toast("showAskPermissionAlert => ");
      //showAskPermissionAlert(permissions, cancelPermission);
      return false;
    }
    return true;
  }

  static Future<bool> checkPhotosPermission({
    Function? cancelPermission,
    bool hadTip = false,
  }) async {
    Map status = await [Permission.storage, Permission.photos].request();
    var photosStatus = status[Permission.photos];
    var storageStatus = status[Permission.storage];

    List<Permission> permissions = [];
    if (photosStatus == PermissionStatus.permanentlyDenied) {
      permissions.add(Permission.photos);
    }
    if (storageStatus == PermissionStatus.permanentlyDenied) {
      permissions.add(Permission.storage);
    }

    // 有永久拒绝的，提示去设置页面
    if (permissions.isNotEmpty) {
      AppLoading.toast("openAppSettings");
      //openAppSettings();
      // showPermissionSetting(permissions, cancelPermission);
      return false;
    }

    if (photosStatus != PermissionStatus.granted) {
      permissions.add(Permission.photos);
      debugPrint("==>photos");
    }

    if (storageStatus != PermissionStatus.granted) {
      permissions.add(Permission.storage);
      debugPrint("==>storage");
    }

    // 有拒绝的，提示获取权限
    if (permissions.isNotEmpty && !hadTip) {
      AppLoading.toast("showAskPermissionAlert => ");
      //showAskPermissionAlert(permissions, cancelPermission);
      return false;
    }
    return true;
  }
}
