import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:invoice/constants/constants.dart';
import 'package:invoice/constants/singleton/UserSingleton.dart';

class NetworkingHelper {
  final String endPoint;
  late Dio _dio;
  late CookieJar _cookieJar;
  Map<String, dynamic> _headers = {};
  late Options _options;

  NetworkingHelper({required this.endPoint}) {
    _cookieJar = CookieJar();
    _dio = Dio();
    _dio.interceptors.add(CookieManager(_cookieJar));
    _cookieJar.loadForRequest(Uri.parse(kBaseUrlApi));
    _headers = UserSingleton().token != null
        ? {
            "Authorization": "Bearer " + UserSingleton().token!,
          }
        : {};
    _options = Options(
        followRedirects: false,
        headers: _headers,
        responseType: ResponseType.plain,
        validateStatus: (status) {
          return status! <= 500;
        });
  }

  Future<Map<String, dynamic>> getData({Map<String, dynamic>? headers}) async {
    try {
      print('header: ' + _headers.toString());
      print('endpoint: ' + endPoint);
      //print('token: ' +UserSingleton().token);
      Response response = await _dio.get(endPoint,
          options: _options.copyWith(headers: headers));
      print(response.data.toString());
      Map<String, dynamic> data = jsonDecode(response.toString());
      return data;
    } catch (e) {
      print('error in : ' + e.toString());
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> postData(
      {dynamic postRequest, Map<String, dynamic>? headers}) async {
    print('endpoint : ' + endPoint);

    try {
      Response response = await _dio.post(endPoint,
          data: postRequest, options: _options.copyWith(headers: headers));
      Map<String, dynamic> data = jsonDecode(response.toString());
      //print('response : '+data.toString());
      return data;
    } catch (e) {
      print('error : ' + e.toString());
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> patchData(
      {dynamic postRequest, Map<String, dynamic>? headers}) async {
    try {
      //print('endPoint : ' + endPoint);
      Response response = await _dio.patch(endPoint,
          data: postRequest, options: _options.copyWith(headers: headers));
      Map<String, dynamic> data = jsonDecode(response.toString());
      //print('data : ' + data.toString());
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> deleteData(
      {Map<String, dynamic>? postRequest,
      Map<String, dynamic>? headers}) async {
    try {
      print('endpoint: ' + endPoint);
      Response response = await _dio.delete(endPoint,
          data: postRequest, options: _options.copyWith(headers: headers));
      Map<String, dynamic> data = jsonDecode(response.toString());
      //print('data delete : ' + data.toString());
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
