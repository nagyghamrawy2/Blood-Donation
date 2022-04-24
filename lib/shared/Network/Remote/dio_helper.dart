import 'package:dio/dio.dart';
class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://blood-bank2022.herokuapp.com/api/v1/',
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String , dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers ={
      'Authorization' : 'bearer ${token}',
      'accept' : 'application/json' ,
    };
    return await dio!.get(url, queryParameters: query,);
  }
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio!.options.headers ={
      'Authorization' : 'Bearer ${token}',
    };
    return dio!.post(
        url,
        queryParameters: query,
        data: data,
    );
  }
}