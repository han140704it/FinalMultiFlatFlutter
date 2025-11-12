import 'dart:convert';

import 'package:dacs_ha4/common/entities/entities.dart';
import 'package:dacs_ha4/common/services/http_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo{
  static Future<UserCredential> firebaseSignIn(String email, String password) async{
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    return credential;
  }

  static Future<UserLoginResponseEntity> login(String email, String password) async{
    print("given info $email , $password");
    var response = await HttpUtil().post(
      "login",
      queryParameters: {
        'email': email,
        'password': password,
      }

    );
    return UserLoginResponseEntity.fromJson(response);
  }
}