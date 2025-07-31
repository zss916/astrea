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
        //"https://calbulk-prod.s3.amazonaws.com/user/250/138df4f4605b496ea31804bf971e42b5.jpeg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAW3MEB2JQW6I63QQQ%2F20250731%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250731T023559Z&X-Amz-Expires=86400&X-Amz-SignedHeaders=host&X-Amz-Signature=90f2d5bf0fcde3668ac379dac0d2c1619a68cf1cab5f1b271b082977b11af41d",
        url,
        //data: Stream.fromIterable(image.map((e) => [e])),
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
