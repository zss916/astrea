import 'package:dio_http2_adapter/dio_http2_adapter.dart';

Http2Adapter proxyAdapter = Http2Adapter(
  ConnectionManager(
    idleTimeout: Duration(seconds: 30),
    onClientCreate: (_, config) {
      config.onBadCertificate = (_) => true;
      config.proxy = Uri.parse("http://login:password@192.168.2.112:9090");
    },
  ),
);
