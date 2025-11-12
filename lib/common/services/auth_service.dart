
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:dacs_ha4/models/users.dart';
import 'base_api.dart';
import 'globals.dart';
import 'package:dacs_ha4/common/services/api.dart';

import 'http_util.dart';


// class AuthServices {
//   static Future<http.Response> register(
//       String email, String password) async {
//     Map data = {
//       "email": email,
//       "password": password,
//     };
//     var body = json.encode(data);
//     var url = Uri.parse(baseURL + 'auth/register');
//     http.Response response = await http.post(
//       url,
//       headers: headers,
//       body: body,
//     );
//     print(response.body);
//     return response;
//   }
//
//   static Future<http.Response> login(String email, String password) async {
//     Map data = {
//       "email": email,
//       "password": password,
//     };
//     var body = json.encode(data);
//     var url = Uri.parse(baseURL + 'auth/login');
//     http.Response response = await http.post(
//       url,
//       headers: headers,
//       body: body,
//     );
//     print(response.body);
//     return response;
//   }
// }
class AuthService extends BaseApi {

  Future<Response> getUser() async {
    return await HttpUtil().get('users');
  }

  Future<Response> login(String email,password) async {
    print("girdi - 2");
    return await api.httpPost("login", {'email': email,'password': password});
  }

  Future<Response> register(String email,password) async {
    return await api.httpPost("register", {'email': email,'password': password});
  }
  Future<Response> login_with_token(String token) async{
    return await api.httpPost("auth/login_with_token", {'token' : token});
  }

  Future<Response> logout() async {
    return await api.httpPost("auth/logout", {});
  }
}