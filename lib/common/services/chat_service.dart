import 'dart:convert';
import 'package:dacs_ha4/common/services/http_util.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ChatService{
  Future<Response> getUser() async {
    return await HttpUtil().get('api/user');

  }
  Future<Response> getMessage(int id) async {
    return await HttpUtil().get('api/message/$id');

  }
}