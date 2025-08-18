import 'dart:io';

import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:flutter/material.dart';
import 'package:http_proxy/http_proxy.dart';
import 'package:proxy/proxy_adapter.dart';

///抓包配置
class ProxyTool {
  ///代理init(在runApp() 之前)[给测试时候打开]
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpProxy httpProxy = await HttpProxy.createHttpProxy();
    HttpOverrides.global = httpProxy;
  }

  ///抓包适配器
  //_dio.httpClientAdapter = proxyAdapter;
  static Http2Adapter getProxyAdapter() => proxyAdapter;
}
