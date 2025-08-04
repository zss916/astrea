import 'package:astrea/net/path.dart';
import 'package:dio/dio.dart';

BaseOptions baseDioOptions = BaseOptions(
  baseUrl: ApiPath.baseUrl,
  connectTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 50),
  headers: {},
  //contentType: 'application/json; charset=utf-8',
  contentType: Headers.jsonContentType,
  responseType: ResponseType.json,
);
