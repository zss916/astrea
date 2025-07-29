import 'package:astrea/net/http/interceptor/logger_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//import 'package:get/get.dart' hide Response;
import 'base_options.dart';
import 'httpClientAdapter.dart';
import 'interceptor/auth_interceptor.dart';

class Http {
  static final Http _instance = Http._internal();
  static Http get instance => Http();
  factory Http() => _instance;

  late Dio _dio;
  CancelToken cancelToken = CancelToken();

  Http._internal() {
    _dio = Dio(baseDioOptions);
    _dio.httpClientAdapter = httpAdapter;
    _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(LoggerInterceptor());
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        /* filter: (RequestOptions options, FilterArgs args) {
          return (options.path == ApiPath.getStateList) ||
              (options.path == ApiPath.getCountryList) ||
              (options.path == ApiPath.getCityList);
        },*/
      ),
    );
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
        options: options,
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
        options: options,
        cancelToken: cancelToken,
      );
      return result.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }

  ///upload
  /*  Future<dynamic> upload(
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
        options: options,
        cancelToken: cancelToken,
      );
      // https://api-test.theappastro.com/v1/global/uploadurl?file_name=scaled_8bcbaca7-6f57-4b19-9209-23925d86a39c9079525850921131112.jpg
      //String path = result.requestOptions.uri.path;
      // result.toString();
      //debugPrint("result ${result.requestOptions.queryParameters.}");
      //String path = "https://${result.realUri.authority}${result.realUri.path}?file_name=";
      //debugPrint("code ${result.statusCode}, data ${result.data}");
      return result.data ?? {};
    } catch (error) {
      rethrow;
    }
  }*/

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
        options: options,
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
        options: options,
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
        options: options,
        cancelToken: cancelToken,
      );
      return result.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }
}
