import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://qms-application.herokuapp.com/api/',
        receiveDataWhenStatusError: true,

      ),
    );
  }

  static Future<Response> getData({
    @required String? url,
     Map<String, dynamic>? query,
    // @required Map<String, dynamic> ?data,

    String ?token,
  }) async {
    dio!.options.headers = {

      'Content-Type': 'application/json',
      'Accept-Encoding': 'gzip, deflate, br',
      'Connection':'keep-alive',


    };

    return await dio!.get(
      url!,
      queryParameters: query??null,
    );
  }

  // static Future<Response> postData({
  //   @required String ?url,
  //   Map<String, dynamic> ?query,
  //   @required Map<String, dynamic> ?data,
  //   String ?token,
  // }) async
  // {
  //   dio!.options.headers =
  //   {
  //     'Authorization': token??'',
  //     'Content-Type': 'application/json',
  //
  //   };
  //
  //   return dio!.post(
  //     url!,
  //     queryParameters: query?? null,
  //     data: data,
  //   );
  // }
}