import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dacs_ha4/models/users.dart';
import 'package:dacs_ha4/common/services/api.dart';
import 'package:dacs_ha4/common/services/auth_service.dart';
import 'base_provider.dart';

class AuthProvider extends BaseProvider {
  final AuthService _authService = AuthService();
  final Api _api = Api();
  User _user = User(id: 0, name: '', password: '',email: '',imageUrl: '');

  User get user => _user;

  setUser(User user){
    _user = user;
  }
  String _token='';
  final  String _message='';

  String get token => _token;
  String get message => _message;


  Future<List<User>> getUser() async{
    setBusy(true);
    bool tokenExist = await getToken();
    if(tokenExist){
      var response = await _authService.getUser();
      if(response.statusCode == 200) {
        final List<dynamic> dataList = response.data['data'] as List;
        final users = dataList.map((item) => User.fromJson(item)).toList();
        return users;
      }else {
        setBusy(false);
        throw Exception('Failed to load subject data');

      }
    }
    setBusy(false);
    throw Exception('Failed to load subject data');
  }

  Future<bool> getToken() async{
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    var token = prefs.getString('access_token');
    print(token);
    if(token != null){
      _api.token = token;
      return true;
    }
    return false;
  }

  Future<void> saveToken(String token) async{
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    prefs.remove('access_token');
    prefs.setString('access_token', token);
    _api.token = token;
  }

  Future<bool> login(String email,password) async{
    var response = await _authService.login(email, password);
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    print(response);
    var data = jsonDecode(response.toString());
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    print(data);

    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxdata');
    print(data['data']);
    print('xxxxxxxxxxxxxxxxxxxxxx200000000000000');
    print(response.statusCode);
    if(response.statusCode == 200) {
      var accessToken = data['token'].toString();
      print("accessTokenaccessTokenaccessTokenaccessTokenaccessTokenaccessToken");
      print(accessToken);
      if (accessToken != null && accessToken is String) {
        saveToken(accessToken);
        print("OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
        _token = accessToken;
        notifyListeners();
        return true;
      } else {
        setMessage('Invalid access token');
        return false;
      }
    }else if (response.statusCode == 400) {
      print(data['error']);
      setMessage(data['error']);
      return false;
    }
    return false;
  }
  Future<bool> loginWithToken( String token) async {
    setBusy(true);
    try {
      var response = await _authService.login_with_token(token);
      var data = jsonDecode(response.data);

      if (response.statusCode == 200) {
        _user = User.fromJson(data['data']);
        // Assuming there's a method to store the token, e.g., in shared preferences
        await saveToken(token);
        setBusy(false);
        return true;
      } else {
        setMessage('Login with token failed');
        setBusy(false);
        return false;
      }
    } catch (e) {
      setMessage('An error occurred: $e');
      setBusy(false);
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    setBusy(true);
    var response = await _authService.register(email, password);
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    print(response);
    var data = jsonDecode(response.toString());
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    print(data);

    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxdata');
    print(data['data']);
    print('xxxxxxxxxxxxxxxxxxxxxx200000000000000');
    print(response.statusCode);
    if(response.statusCode == 200) {
      var accessToken = data['token'].toString();
      print("accessTokenaccessTokenaccessTokenaccessTokenaccessTokenaccessToken");
      print(accessToken);
      if (accessToken != null && accessToken is String) {
        saveToken(accessToken);
        print("OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
        _token = accessToken;
        notifyListeners();
        return true;
      } else {
        setMessage('Invalid access token');
        return false;
      }
    }else if (response.statusCode == 400) {
      print(data['error']);
      setMessage(data['error']);
      return false;
    }
    return false;
  }
  Future<void> logout() async{
    await _authService.logout();
    SharedPreferences prefs =  await SharedPreferences.getInstance();
    prefs.remove('access_token');
  }
}
