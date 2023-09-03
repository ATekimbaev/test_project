import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/core/consts/app_consts.dart';

class DioSettings {
  DioSettings() {
    setup();
  }

  Dio dio = Dio(
    BaseOptions(
      // baseUrl: 'localhost:8080/api/v1/',
      contentType: 'application/json',
      headers: {
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  void setup() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Future<String> getNewToken() async {
      return 'New token';
    }

    final interceptors = dio.interceptors;

    interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = prefs.getString(AppConsts.token);

          options.headers['Authorization'] = 'Bearer $token';

          return handler.next(options);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            try {
              await getNewToken();
              final opts = Options(
                  method: e.requestOptions.method,
                  headers: e.requestOptions.headers);
              final response = await dio.request(e.requestOptions.path,
                  options: opts,
                  data: e.requestOptions.data,
                  queryParameters: e.requestOptions.queryParameters);
              handler.resolve(response);
            } on DioError catch (error) {
              handler.next(error);
            }
          } else {
            return handler.next(e);
          }
        },
      ),
    );

    final logInterceptor = LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );

    final headerInterceptors = QueuedInterceptorsWrapper(
      onRequest: (options, handler) => handler.next(options),
      onError: (DioError error, handler) {
        handler.next(error);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
    );
    interceptors.addAll([if (kDebugMode) logInterceptor, headerInterceptors]);
  }
}
