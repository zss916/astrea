import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/storage/app_service.dart';
import 'package:astrea/core/storage/astrology_service.dart';
import 'package:astrea/core/storage/storage.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppCommonSetting {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    setSystemUi();
    await Future.wait([
      Get.put<StorageService>(StorageService()).init(),
    ]).whenComplete(() async {
      await Get.putAsync<AccountService>(() => AccountService().init());
      Get.put<AppService>(AppService());
      Get.put<AstrologyService>(AstrologyService());
      AppLoading();
    });
  }

  static void setSystemUi() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

SystemUiOverlayStyle barStyle = darkBarStyle;

///dark
SystemUiOverlayStyle darkBarStyle = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarDividerColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.dark,
);

///light
SystemUiOverlayStyle lightBarStyle = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.light,
  systemNavigationBarDividerColor: Colors.transparent,
  statusBarBrightness: Brightness.light,
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);

///当前设备的底部安全区域高度值
//double  bottomPadding(BuildContext context)  => MediaQuery.of(context).padding.bottom;
//double bottomPadding = MediaQuery.of(Get.context!).padding.bottom;
//double bottomPadding = 34.h;

double bottomPadding = Get.bottomBarHeight == 0 ? 34.h : Get.bottomBarHeight;
