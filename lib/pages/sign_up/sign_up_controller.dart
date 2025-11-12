import 'dart:convert';

import 'package:dacs_ha4/common/global_loader/global_loader.dart';
import 'package:dacs_ha4/common/widgets/popup_messages.dart';
import 'package:dacs_ha4/pages/sign_in/sign_in.dart';
import 'package:dacs_ha4/pages/sign_up/notifier/register_notifier.dart';
import 'package:dacs_ha4/pages/sign_up/repo/sign_up_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:dacs_ha4/provider/auth_provider.dart';

import '../../common/entities/user.dart';
import '../../common/utils/constants.dart';
import '../../global.dart';
import '../sign_in/repo/sign_in_repo.dart';

class SignUpController{
  late WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async{

    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;

    String password = state.password;
    String rePassword = state.rePassword;

     bool isEmail(String em) {
      String p =
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      RegExp regExp = new RegExp(p);
      return regExp.hasMatch(em);
    }
    
    if(state.userName.isEmpty || name.isEmpty){
      toastInfo("Tên đang rỗng ");
      return;
    }

    if(state.userName.length<6 || name.length<6){
      toastInfo("Tên quá ngắn");
      return;
    }

    if( !email.isEmail){
      toastInfo("Email sai định dạng");
      return;

    }
    if(state.email.isEmpty || email.isEmpty ){
      toastInfo("Email đang rỗng");
      return;
    }

    if((state.password.isEmpty!=state.rePassword.isEmpty)||password.isEmpty!=rePassword.isEmpty){
      toastInfo("Mật khẩu đang rỗng");
      return;
    }

    if((state.password!=state.rePassword)||password!=rePassword){
      toastInfo("Mật khẩu không giống nhau");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    Future.delayed(const Duration(seconds: 10), () async {
      var context = Navigator.of(ref.context);

      try{

        final credential = await SignUpRepo.firebaseSignUp(email, password);

        if(kDebugMode){
          print(credential);
        }
        var user= credential.user;
        if(user!=null) {
          await user.sendEmailVerification();
          await user.updateDisplayName(name);
          String photoUrl = "uploads/default.png";
          await user.updatePhotoURL(photoUrl);
          toastInfo(
              "Asn email has been sent to verify your account, Please open that email and confirm your identity");
          context.pop();
          // String? displayName = user.displayName;
          String? email = user.email;
          String? id = user.uid;

          LoginRequestEntity loginRequestEntity = LoginRequestEntity();
          loginRequestEntity.avatar = photoUrl;
          loginRequestEntity.name = name;
          loginRequestEntity.email = email;
          loginRequestEntity.password= password;
          loginRequestEntity.open_id = id;
          loginRequestEntity.type = 1;
          asyncPostAllData(loginRequestEntity);
          print("***********************************");
          print(loginRequestEntity.avatar);
          print(loginRequestEntity.email);
          print(loginRequestEntity.name);
          print(loginRequestEntity.password);
          if(kDebugMode){
            print("Tài khoản đã đăng ki");
          }
          }else{
            toastInfo("Lỗi Đăng nhập");
          }


      }on FirebaseAuthException catch(e){
        if(e.code=='weak-password'){
          toastInfo("This password is too weak");
        }else if(e.code=='email-already-in-use'){
          toastInfo("This email address has already been registered");
        }else if(e.code=='user-not-found'){
          toastInfo("User not found");
        }




      }catch(e){
        if(kDebugMode){
          print(e.toString());
        }
      }
      ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
    });

  }
  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async{

    var result = await SignUpRepo.register(params: loginRequestEntity);

    print("trar ve");
    print("+++++++++++++++++++++++++");
    print(result);
    if(result.code==201){
      try{
        var navigator = Navigator.of(ref.context);

        Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));
        Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        print("Đã vào tới đây rổi nha");
        navigator.push(MaterialPageRoute(
            builder: (BuildContext context)=>const SignIn())
        );

      }catch(e){
        if(kDebugMode){
          print("anh nhi=> nos lxoi roi");
          print(e.toString());
        }
      }
    }else{
      toastInfo("Lỗi đăng nhập");
    }

  }
}
