//import 'package:notification_permissions/notification_permissions.dart' as notification;
import 'dart:io';

import 'package:astrea/core/translations/en.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      showPermissionSetting(permissions, cancelPermission);
      return false;
    }

    if (cameraStatus != PermissionStatus.granted) {
      permissions.add(Permission.camera);
    }
    // 有拒绝的，提示获取权限
    if (permissions.isNotEmpty && !hadTip) {
      showAskPermissionAlert(permissions, cancelPermission);
      return false;
    }
    return true;
  }

  /// 检查相册权限
  static Future<bool> checkPhotosPermission({
    Function? cancelPermission,
    bool hadTip = false,
  }) async {
    if (Platform.isIOS) {
      Map status = await [Permission.photos].request();
      var photosStatus = status[Permission.photos];
      List<Permission> permissions = [];
      if (photosStatus == PermissionStatus.permanentlyDenied) {
        permissions.add(Permission.photos);
      }
      // 有永久拒绝的，提示去设置页面
      if (permissions.isNotEmpty) {
        showPermissionSetting(permissions, cancelPermission);
        return false;
      }

      if (photosStatus != PermissionStatus.granted) {
        permissions.add(Permission.photos);
      }

      // 有拒绝的，提示获取权限
      if (permissions.isNotEmpty && !hadTip) {
        showAskPermissionAlert(permissions, cancelPermission);
        return false;
      }
    } else if (Platform.isAndroid) {
      // Android 13+使用READ_MEDIA_IMAGES，旧版使用STORAGE
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        Map status = await [Permission.photos].request();
        var photosStatus = status[Permission.photos];
        List<Permission> permissions = [];
        if (photosStatus == PermissionStatus.permanentlyDenied) {
          permissions.add(Permission.photos);
        }
        // 有永久拒绝的，提示去设置页面
        if (permissions.isNotEmpty) {
          showPermissionSetting(permissions, cancelPermission);
          return false;
        }

        if (photosStatus != PermissionStatus.granted) {
          permissions.add(Permission.photos);
        }

        // 有拒绝的，提示获取权限
        if (permissions.isNotEmpty && !hadTip) {
          showAskPermissionAlert(permissions, cancelPermission);
          return false;
        }
      } else {
        //低版本
        Map status = await [Permission.storage].request();
        var storageStatus = status[Permission.storage];
        List<Permission> permissions = [];
        if (storageStatus == PermissionStatus.permanentlyDenied) {
          permissions.add(Permission.storage);
        }
        // 有永久拒绝的，提示去设置页面
        if (permissions.isNotEmpty) {
          showPermissionSetting(permissions, cancelPermission);
          return false;
        }

        if (storageStatus != PermissionStatus.granted) {
          permissions.add(Permission.storage);
        }

        // 有拒绝的，提示获取权限
        if (permissions.isNotEmpty && !hadTip) {
          showAskPermissionAlert(permissions, cancelPermission);
          return false;
        }
      }
    }
    return true;
  }

  // 提示需要到设置页设置权限,
  static void showPermissionSetting(
    List<Permission> permissions,
    Function? cancelPermission,
  ) {
    if (permissions.isEmpty) {
      return;
    }

    String content = "";
    String camera = "Camera";
    String store = "Store";
    for (int i = 0; i < permissions.length; i++) {
      Permission permission = permissions[i];
      if (permission == Permission.camera) {
        content = (content.isNotEmpty) ? (content + "/") + camera : camera;
      } else if (permission == Permission.storage) {
        content = (content.isNotEmpty) ? (content + "/") + store : store;
      }
    }

    Get.defaultDialog(
      title: "You need to manually allow the necessary permissions in Settings",
      titleStyle: const TextStyle(fontSize: 16),
      middleText:
          "If you want to use it normally, please open %s permission first"
              .trArgs(["${content}"]),
      middleTextStyle: const TextStyle(fontSize: 14),
      contentPadding: const EdgeInsetsDirectional.only(
        start: 20,
        end: 20,
        top: 20,
        bottom: 20,
      ),
      radius: 12,
      cancel: TextButton(
        onPressed: () {
          Get.back();
          cancelPermission?.call();
        },
        child: Text(LanKey.cancel.tr, style: const TextStyle(fontSize: 16)),
      ),
      confirm: TextButton(
        onPressed: () {
          Get.back();
          openAppSettings();
        },
        child: Text(
          "Setting",
          style: const TextStyle(fontSize: 16, color: Color(0xFF585FC4)),
        ),
      ),
    );
  }

  /// 提示需要获取权限
  static void showAskPermissionAlert(
    List<Permission> permissions,
    Function? cancelPermission,
  ) {
    if (permissions.isEmpty) {
      return;
    }

    String content = "";
    String camera = "Camera";
    String store = "Store";
    for (int i = 0; i < permissions.length; i++) {
      Permission permission = permissions[i];
      if (permission == Permission.camera) {
        content = (content.isNotEmpty) ? ("$content/") + camera : camera;
      } else if (permission == Permission.storage) {
        content = (content.isNotEmpty) ? ("$content/") + store : store;
      }
    }

    Get.defaultDialog(
      title: "",
      titleStyle: const TextStyle(fontSize: 16),
      middleText:
          "If you want to use it normally, please open %s permission first"
              .trArgs([content]),
      middleTextStyle: const TextStyle(fontSize: 14),
      contentPadding: const EdgeInsetsDirectional.only(
        start: 20,
        end: 20,
        top: 20,
        bottom: 20,
      ),
      radius: 12,
      cancel: TextButton(
        onPressed: () {
          Get.back();
          cancelPermission?.call();
        },
        child: Text(LanKey.cancel.tr, style: const TextStyle(fontSize: 16)),
      ),
      confirm: TextButton(
        onPressed: () {
          Get.back();
          checkCameraPermission(hadTip: true);
        },
        child: Text(
          LanKey.confirm.tr,
          style: const TextStyle(fontSize: 16, color: Color(0xFF585FC4)),
        ),
      ),
    );
  }
}
