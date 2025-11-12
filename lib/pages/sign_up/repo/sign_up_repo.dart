import 'dart:convert';

import 'package:dacs_ha4/common/entities/entities.dart';
import 'package:dacs_ha4/common/services/http_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo{
  static Future<UserCredential> firebaseSignUp(String email, String password) async{
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password);
    return credential;
  }
  static Future<UserLoginResponseEntity> register({LoginRequestEntity? params}) async{
    print("given info ${jsonEncode(params)}");
    var response = await HttpUtil().post2(
        "register",
        data: jsonEncode(params?.toJson()),
      // queryParameters: {
      //   'name': "abc",
      //   'email': "abc456@gmail.com",
      //   'avatar': "xyz",
      //   'open_id': "asdfgh",
      //   'type': 1
      // }

    );
    return UserLoginResponseEntity.fromJson(response);
  }
}