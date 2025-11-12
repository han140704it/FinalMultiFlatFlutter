import 'dart:convert';

import 'package:dio/dio.dart';

class Api {
  static final _api = Api._internal();

  factory Api() {
    return _api;
  }
  Api._internal();

  String? token;
  String baseUrl = 'http://0.0.0.0:8008';


  Future<Map<String, dynamic>> httpGet(String endPath, {Map<String, String>? query}) async {
    try {
      final dio = Dio();
      dio.options.headers['Content-Type']= 'application/json';
      dio.options.headers["Authorization"] = "Bearer $token";
      dio.options.headers['Accept'] = 'application/json';

      String url = '$baseUrl/$endPath';
      final response = await dio.get(url,queryParameters: query);
      return response.data; // Trả về dữ liệu của response trực
    } catch(e) {
      rethrow;
    }
  }


  Future<Response> httpPost(String endPath, Object body) {
    Dio dio = Dio();
    String uri = '$baseUrl/$endPath';
    print(uri);
    print("chán lắm rồi");
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    return dio.post(uri,data: jsonEncode(body));
  }

// Future<Response> httpPost(String endPath, dynamic data) async {
//   final dio = Dio();
//   dio.options.headers['Authorization'] = 'Bearer $token';
//   final response = await dio.post('$baseUrl/$endPath', data: data);
//   return response;
// }
}


// class Api {
//   static final _api = Api._internal();
//
//   factory Api() {
//     return _api;
//   }
//   Api._internal();
//
//   String? token;
//   String baseUrl = 'http://192.168.1.6:80/api';
//
//   Future<Response> httpGet(String endPath, {Map<String, String>? query}) async {
//     try {
//       final dio = Dio();
//       dio.options.headers['Authorization'] = 'Bearer $token';
//
//       String url = '$baseUrl/$endPath';
//       return await dio.get(url, queryParameters: query);
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<Response> httpPost(String endPath, dynamic data) async {
//     try {
//       final dio = Dio();
//       dio.options.headers['Authorization'] = 'Bearer $token';
//       dio.options.headers['Content-Type'] = 'application/json';
//
//       String url = '$baseUrl/$endPath';
//       return await dio.post(url, data: data);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }