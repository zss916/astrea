import 'dart:async';

import 'package:astrea/core/router/app_pages.dart';
import 'package:astrea/core/router/router_observer.dart';
import 'package:astrea/core/setting/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proxy/proxy.dart';

import 'core/translations/language.dart';

Future<void> main() async {
  await Global.init();

  ///解决证书验证问题
  //HttpOverrides.global = AppHttpOverrides();

  /// 抓包初始化
  ProxyTool.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      enableScaleText: () => false,
      designSize: Size(designWidth, designHeight),
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
        //theme: CustomTheme.to.dark,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent,
          ),
          // textTheme: TextTheme(),
          tabBarTheme: TabBarThemeData(dividerColor: Colors.transparent),
        ),
        routingCallback: (routing) {
          debugPrint("routing:${routing?.current}");
        },
        initialRoute: APages.splash,
        //home: PersonalDataPage(),
      ),
    );
  }
}
