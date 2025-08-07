import 'package:astrea/core/toast/app_loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        AppLoading.toast("Network Connection Timeout");
        break;
      case DioExceptionType.sendTimeout:
        AppLoading.toast("Network Send Timeout");
        break;
      case DioExceptionType.receiveTimeout:
        AppLoading.toast("Network Receive Timeout");
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.badResponse:
        debugPrint("服务器错误: ${err.response?.statusCode}, ${err.message}");
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
        break;
      case DioExceptionType.unknown:
        break;
    }
    super.onError(err, handler);
  }
}
