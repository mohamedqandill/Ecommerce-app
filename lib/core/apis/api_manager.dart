import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@injectable
class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args){
          // don't print requests with uris containing '/posts'
          if(options.path.contains('/posts')){
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }
    )
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

  Future<Response> deleteData(
      {required String endPoints,
        Map<String, dynamic>? body,
        Map<String, dynamic>? headers}) {
    return dio.delete(AppConstants.baseURL + endPoints,
        data: body, options: Options(headers: headers));
  }
  Future<Response> putData(
      {required String endPoints,
        Map<String, dynamic>? body,
        Map<String, dynamic>? headers}) {
    return dio.put(AppConstants.baseURL + endPoints,
        data: body, options: Options(headers: headers));
  }
}
