import 'package:astrea/core/storage/account_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("token=> ${AccountService.to.getAuthToken()}");
    if (AccountService.to.getAuthToken().isNotEmpty) {
      options.headers["Authorization"] = AccountService.to.getAuthToken();
    }

    options.headers["Authorization"] =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NTYwMTQ4NDMsImlhdCI6MTc1MzMzNjQ0MywicGxhdCI6MSwidXNlcklkIjozMX0.OPhzKm5pHHJ7TvuEJNhZHV0ZZd8WXH70dC2BMxx6mpk";
    handler.next(options);
  }
}
