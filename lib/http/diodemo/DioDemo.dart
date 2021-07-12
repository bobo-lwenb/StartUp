import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class DioDemo {
  static DioDemo _demo = new DioDemo._internal();

  DioDemo._internal() {
    Dio _dio = new Dio(
      BaseOptions(
        baseUrl: '',
        connectTimeout: 5000,
        receiveTimeout: 10000,
        headers: {
          HttpHeaders.userAgentHeader: 'dio',
          "api": '1.0.0',
        },
        contentType: Headers.jsonContentType,
        responseType: ResponseType.plain,
      ),
    );

    _dio.interceptors.add(CookieManager(CookieJar()));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) {},
      onResponse: (
        Response e,
        ResponseInterceptorHandler handler,
      ) {},
      onError: (
        DioError e,
        ErrorInterceptorHandler handler,
      ) {},
    ));
    _dio.interceptors.add(LogInterceptor());
  }

  factory DioDemo() => _demo;
}

var dioDemo = new DioDemo();
