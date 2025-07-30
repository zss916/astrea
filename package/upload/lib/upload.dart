import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class UploadFile {
  static Future<dynamic> put({
    required String url,
    required String filePath,
  }) async {
    try {
      File file = File(filePath);
      final image = file.readAsBytesSync();

      Dio dio = Dio();
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
        ),
      );
      Options options = Options(
        contentType: Headers.jsonContentType,
        headers: {
          'Accept': "*/*",
          'Content-Length': image.length,
          'Connection': 'keep-alive',
          'User-Agent': 'ClinicPlush',
        },
      );
      final result = await dio.put(
        url,
        data: file.openRead(),
        options: options,
        onSendProgress: (int sent, int total) {
          debugPrint("sent: ${sent / total}");
        },
        onReceiveProgress: (int received, int total) {
          debugPrint("received: ${received / total}l");
        },
      );
      return result.data ?? '{}';
    } catch (error) {
      rethrow;
    }
  }
}
