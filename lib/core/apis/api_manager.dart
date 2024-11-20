import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:flutter/material.dart';

class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
    dio.interceptors.add(
      LogInterceptor(
        logPrint: (o) => debugPrint(o.toString()),
      ),
    );
  }

  Future<Response> getData(
      {required String endPoints,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers}) {
    return dio.get(AppConstants.baseURL + endPoints,
        queryParameters: params, options: Options(headers: headers));
  }

  Future<Response> postData(
      {required String endPoints,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) {
    return dio.post(AppConstants.baseURL + endPoints,
        data: body, options: Options(headers: headers));
  }
}
