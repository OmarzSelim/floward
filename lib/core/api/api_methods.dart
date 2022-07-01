import 'dart:convert';
import 'package:dio/dio.dart';
import '../utils/helpers.dart';
import 'api_exception.dart';
import 'package:dio_logger/dio_logger.dart';

class DefaultApi {
  final Map<String, dynamic> _defaultHeaders = {};

  final Map<String, dynamic> _defaultQueryParameters = {};
  // final dio = Dio();

  // Using interceptor to log all API calls
  final dio = Dio()..interceptors.add(dioLoggerInterceptor);
  DefaultApi() {
    dio.options.baseUrl = domain;
    dio.options.headers = _defaultHeaders;
  }

  Future<Response> getData({
    required String path,
    int version = 1,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic>? headers,
    String domain = domain,
  }) async {
    dio.options.headers = headers ?? _defaultHeaders;
    try {
      final response = dio.get(
        "$domain/$path",
        queryParameters: Map<String, dynamic>.from(_defaultQueryParameters)
          ..addAll(queryParameters),
      );
      return response;
    } on DioError catch (e) {
      throw ExceptionApi(code: null, message: e.message);
    }
  }

  Future<Response> postData({
    dynamic data,
    required String path,
    int version = 1,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic>? headers,
    String domain = domain,
  }) async {
    dio.options.headers = headers ?? _defaultHeaders;
    try {
      final response = dio.post("$domain/$path",
          queryParameters: Map<String, dynamic>.from(_defaultQueryParameters)
            ..addAll(queryParameters),
          data: jsonEncode(data));
      return response;
    } on DioError catch (e) {
      throw ExceptionApi(code: null, message: e.message);
    }
  }

  Future<Response> putData(
    dynamic data, {
    required String path,
    int version = 1,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic>? headers,
    String domain = domain,
  }) async {
    dio.options.headers = headers ?? _defaultHeaders;
    try {
      final response = dio.put("$domain/$path",
          queryParameters: Map<String, dynamic>.from(_defaultQueryParameters)
            ..addAll(queryParameters),
          data: jsonEncode(data));
      return response;
    } on DioError catch (e) {
      throw ExceptionApi(code: null, message: e.message);
    }
  }

  Future<Response> deleteData({
    dynamic data,
    required String path,
    int version = 1,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic>? headers,
    String domain = domain,
  }) async {
    dio.options.headers = headers ?? _defaultHeaders;
    try {
      final response = dio.delete(
        "$domain/$path",
        data: jsonEncode(data),
        queryParameters: Map<String, dynamic>.from(_defaultQueryParameters)
          ..addAll(queryParameters),
      );
      return response;
    } on DioError catch (e) {
      throw ExceptionApi(code: null, message: e.message);
    }
  }
}
