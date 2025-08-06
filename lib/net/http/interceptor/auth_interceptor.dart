import 'package:astrea/core/storage/account_service.dart';
import 'package:astrea/core/storage/app_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("token=> ${AccountService.to.getAuthToken()}");
    debugPrint("did=> ${AppService.to.deviceIdentifier}");
    if (AccountService.to.getAuthToken().isNotEmpty) {
      options.headers["Authorization"] = AccountService.to.getAuthToken();
    }
    if (AppService.to.deviceIdentifier != null) {
      options.headers["did"] = AppService.to.deviceIdentifier;
    }
    handler.next(options);
  }
}
