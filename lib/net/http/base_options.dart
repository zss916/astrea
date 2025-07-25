import 'package:astrea/net/path.dart';
import 'package:dio/dio.dart';

BaseOptions baseDioOptions = BaseOptions(
  baseUrl: ApiPath.baseUrl,
  connectTimeout: const Duration(minutes: 1),
  receiveTimeout: const Duration(minutes: 1),
  headers: {},
  contentType: 'application/json; charset=utf-8',
  //contentType: Headers.jsonContentType,
  responseType: ResponseType.json,
);
