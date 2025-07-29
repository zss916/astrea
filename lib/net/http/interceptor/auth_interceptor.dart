import 'package:astrea/core/storage/account_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("token=> ${AccountService.to.getAuthToken()}");
    /*if (options.method != "PUT") {

    }*/
    if (AccountService.to.getAuthToken().isNotEmpty) {
      options.headers["Authorization"] = AccountService.to.getAuthToken();
    }
    handler.next(options);
  }
}
