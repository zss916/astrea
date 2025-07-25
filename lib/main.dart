import 'dart:async';
import 'dart:io';

//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/router/router_observer.dart';
import 'package:astrea/core/setting/app_common_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/translations/language.dart';
import 'net/http/httpClientAdapter.dart';

Future<void> main() async {
  await AppCommonSetting.init();

  ///解决证书验证问题
  HttpOverrides.global = MyHttpOverrides();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      enableScaleText: () => false,
      designSize: const Size(375.0, 812.0),
      builder: (context, _) => GetMaterialApp(
        title: "Astrea",
        debugShowCheckedModeBanner: false,
        locale: Get.deviceLocale,
        translations: AppTranslations(),
        fallbackLocale: const Locale("en"),
        getPages: APages.routes,
        navigatorObservers: [appRouteObserver],
        builder: (context, child) => MediaQuery.withNoTextScaling(
          child: EasyLoading.init()(context, child),
        ),
        defaultTransition: Transition.cupertino,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
          ),
          tabBarTheme: TabBarThemeData(dividerColor: Colors.transparent),
        ),
        routingCallback: (routing) {
          debugPrint("routing:${routing?.current}");
        },
        // home: PlaceOfBirthPage(),
        //initialRoute: APages.splash,
        initialRoute: APages.home,
        //initialRoute: APages.start,
      ),
    );
  }
}
