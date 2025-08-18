import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/storage/app_service.dart';
import 'package:astrea/core/storage/astrology_service.dart';
import 'package:astrea/core/storage/storage.dart';
import 'package:astrea/core/toast/app_loading.dart';
import 'package:auto_hyphenating_text/auto_hyphenating_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Global {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    setSystemUi();
    await initHyphenation();
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

SystemUiOverlayStyle barStyle = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  // iOS配置
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarDividerColor: Colors.transparent,
  // Android配置
  statusBarBrightness: Brightness.light,
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);

///当前设备的底部安全区域高度值
//double  bottomPadding(BuildContext context)  => MediaQuery.of(context).padding.bottom;
//double bottomPadding = MediaQuery.of(Get.context!).padding.bottom;
//double bottomPadding = 34.h;

double bottomPadding = Get.bottomBarHeight == 0 ? 34.h : Get.bottomBarHeight;

const double designWidth = 402.0;
const double designHeight = 874.0;
