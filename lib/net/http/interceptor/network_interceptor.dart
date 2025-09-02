import 'package:astrea/core/toast/app_loading.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetWorkInterceptor extends Interceptor {
  NetWorkInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    debugPrint("connectivityResult =>${connectivityResult.toString()}");
    if (connectivityResult.contains(ConnectivityResult.none)) {
      AppLoading.toast("Network connection failed");
      /*return handler.reject(
        DioException(
          requestOptions: options,
          error: 'Network connection failed',
          type: DioExceptionType.connectionError,
        ),
      );*/
    } else {
      handler.next(options);
    }
  }
}
