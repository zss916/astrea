import 'dart:io';

import 'package:dio/io.dart';

IOHttpClientAdapter httpAdapter = IOHttpClientAdapter(
  validateCertificate: (cert, host, port) {
    return true;
  },
);

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) {
        return host == 'api-test.theappastro.com';
      };
  }
}

class AppHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
