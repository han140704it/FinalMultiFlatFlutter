import 'dart:async';
import 'package:dacs_ha4/models/message.dart';
import 'package:dacs_ha4/models/users.dart';
import 'package:dacs_ha4/provider/base_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/services/chat_service.dart';
import '../models/users.dart';
import '../models/message.dart';

class ChatProvider extends BaseProvider{
  final ChatService _chatService = ChatService();
  late int _selectedUserId;
  int get selectedUserId => _selectedUserId;
  void setSelectedUserId(int id){
    _selectedUserId=id;
    notifyListeners();
  }

  Future<List<User>> getUserData() async {
    setBusy(true);
    var response = await _chatService.getUser();
    if (response.statusCode == 200) {
      try {
        final List<dynamic> dataList = response.data['data'] as List;
        final users = dataList.map((item) => User.fromJson(item)).toList();
        return users;
      } catch (e) {
        print('rơi vào catch rồi: $e');
        throw Exception("");
      }
    } else {
      setBusy(false);
      throw Exception('Failed to load subject data');
    }
  }

  Future<List<Message>> getMessageData(int id) async {
    setBusy(true);
    var response = await _chatService.getMessage(id);
    if (response.statusCode == 200) {
      try {
        final List<dynamic> dataList = response.data['data'] as List;
        final messages = dataList.map((item) => Message.fromJson(item)).toList();
        return messages;
      } catch (e) {
        print('rơi vào catch rồi: $e');
        throw Exception("");
      }
    } else {
      setBusy(false);
      throw Exception('Failed to load subject data');
    }
  }

  Future<bool> getToken() async{
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    var token = prefs.getString('access_token');
    print(token);
    if(token != null){
      return true;
    }
    return false;
  }

  void notifyListenersAfterBuild() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}