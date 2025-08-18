import 'package:astrea/net/http/interceptor/error_interceptor.dart';
import 'package:dio/dio.dart';

//import 'package:get/get.dart' hide Response;
import 'base_options.dart';
import 'http_adpter/httpClientAdapter.dart';
import 'interceptor/auth_interceptor.dart';
import 'interceptor/logger_interceptor.dart';

class Http {
  static final Http _instance = Http._internal();
  static Http get instance => Http();
  factory Http() => _instance;

  late Dio _dio;
  CancelToken cancelToken = CancelToken();

  Http._internal() {
    _dio = Dio(baseDioOptions);
    _dio.httpClientAdapter = httpAdapter;

    /// 代理抓包
    //_dio.httpClientAdapter = ProxyTool.getProxyAdapter();

    ///auth
    _dio.interceptors.add(AuthInterceptor());

    /// 缓存
    // _dio.interceptors.add(cacheInterceptor);

    /// 日志
    _dio.interceptors.add(LoggerInterceptor());
    _dio.interceptors.add(prettyDioLogger);

    /// 错误拦截
    _dio.interceptors.add(ErrorInterceptor());
  }

  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  ///post
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool showLoading = false,
    bool showToast = true,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        //options: options,
        cancelToken: cancelToken,
      );
      return response.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }

  ///get
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? query,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final result = await _dio.get(
        url,
        queryParameters: query,
        data: data,
        //options: options,
        cancelToken: cancelToken,
      );
      return result.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }

  ///delete
  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? query,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final result = await _dio.delete(
        url,
        queryParameters: query,
        data: data,
        //options: options,
        cancelToken: cancelToken,
      );
      return result.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }

  ///patch
  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? query,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final result = await _dio.patch(
        url,
        queryParameters: query,
        data: data,
        //options: options,
        cancelToken: cancelToken,
      );
      return result.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }

  ///put
  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? query,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final result = await _dio.put(
        url,
        queryParameters: query,
        data: data,
        //options: options,
        cancelToken: cancelToken,
      );
      return result.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }
}
