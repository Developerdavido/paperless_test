import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class HttpService {
  String? host;
  Dio? dio = Dio();
  int connectTimeout = 60000;
  int receiveTimeout = 60000;

  Future<Map<String, String>> getHeaders() async {
    return {
      HttpHeaders.acceptHeader: "application/json",
    };
  }

  HttpService();
  //get method
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters, CancelToken? token}) async {
    String uri = url;
    //print(uri);
    return dio!.get(
      uri,
      queryParameters: queryParameters,
    );
  }

  //post method
  Future<Response> post(String url, body, {CancelToken? token}) async {
    String uri = url;
    //print(uri);
    return dio!.post(
      uri,
      data: body,
      cancelToken: token,
    );
  }
}
