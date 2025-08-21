import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/utils/index.dart';
import 'package:flutter/material.dart';

AppRouteObserver appRouteObserver = AppRouteObserver();

///记录路由历史
class AppRouteObserver extends RouteObserver<PageRoute> {
  List<Route<dynamic>> history = <Route<dynamic>>[];

  List<String> historyPage = [];

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    history.remove(route);
    historyPage.remove(route.settings.name ?? "");

    Console.log("${previousRoute?.settings.name} <= ${route.settings.name}");
    Console.log(historyPage);
    if (historyPage.isNotEmpty) {
      AccountService.to.setCurrentRoute(route: historyPage.last);
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    history.add(route);
    historyPage.add(route.settings.name ?? "");

    Console.log("${previousRoute?.settings.name} => ${route.settings.name}");
    Console.log(historyPage);
    if (historyPage.isNotEmpty) {
      AccountService.to.setCurrentRoute(route: historyPage.last);
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    history.remove(route);
    historyPage.remove(route.settings.name ?? "");

    Console.log(
      "${previousRoute?.settings.name} remove ${route.settings.name}",
    );
    Console.log(historyPage);
    if (historyPage.isNotEmpty) {
      AccountService.to.setCurrentRoute(route: historyPage.last);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute != null) {
      history.remove(oldRoute);
      historyPage.remove(oldRoute.settings.name ?? "");
    }
    if (newRoute != null) {
      history.add(newRoute);
      historyPage.add(newRoute.settings.name ?? "");
    }

    Console.log(
      "${oldRoute?.settings.name} replace ${newRoute?.settings.name}",
    );
    Console.log(historyPage);

    if (historyPage.isNotEmpty) {
      AccountService.to.setCurrentRoute(route: historyPage.last);
    }
  }
}
