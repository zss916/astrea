//import 'package:notification_permissions/notification_permissions.dart' as notification;
import 'package:permission_handler/permission_handler.dart';

class AppPermissionTools {
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
}
