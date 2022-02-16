import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
 
  static const String baseUrl = 'https://student.valuxapps.com/api/';
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  //===============================================================
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

//===============================================================
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
    };
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}