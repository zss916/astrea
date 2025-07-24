import 'package:dio/dio.dart';
import 'package:astrea/core/utils/index.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Console.log(
      '[Method]:${options.method}\n[Request]:${options.uri}\n[Body]:${options.data}',
    );
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Console.log(
      '[Method]:${err.requestOptions.method}\n'
      '[Request]:${err.requestOptions.uri}\n'
      '[Type]:${err.type}\n'
      'msg:${err.message}\n'
      'response:${err.response}\n'
      'error:${err.error}\n '
      'stackTrace${err.stackTrace}',
    );
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        break;
      case DioExceptionType.sendTimeout:
        break;
      case DioExceptionType.receiveTimeout:
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.badResponse:
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionError:
        break;
      case DioExceptionType.unknown:
        //debugPrint("data => ${err.response?.data}");

        break;
    }
    super.onError(err, handler);
  }
}
