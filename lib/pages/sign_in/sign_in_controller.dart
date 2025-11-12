import 'dart:convert';

import 'package:dacs_ha4/common/entities/entities.dart';
import 'package:dacs_ha4/common/global_loader/global_loader.dart';
import 'package:dacs_ha4/common/utils/constants.dart';
import 'package:dacs_ha4/global.dart';
import 'package:dacs_ha4/pages/sign_in/notifier/sign_in_notifier.dart';
import 'package:dacs_ha4/pages/sign_in/repo/sign_in_repo.dart';
import 'package:dacs_ha4/screens/home/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:dacs_ha4/provider/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/widgets/popup_messages.dart';

class SignInController{
  WidgetRef ref;

  SignInController(this.ref);


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> handleSignIn() async{
    var state = ref.read(signInNotifierProvider);
    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if(state.email.isEmpty || email.isEmpty){
      toastInfo("Email chưa đc nhập");
      return;
    }

    if((state.password.isEmpty)||password.isEmpty){
      toastInfo("Mật khẩu chưa đc nhập");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    try{
      var result = await AuthProvider().login(email, password);
      if(result){
        try{
          var navigator = Navigator.of(ref.context);

          navigator.push(MaterialPageRoute(
              builder: (BuildContext context)=>const Home())
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

    }catch(e){print(e.toString());}

    // try{
    //   final credential = await SignInRepo.firebaseSignIn(email, password);
    //
    //   if(credential.user==null){
    //     toastInfo("Tài khoản không tìm thấy");
    //   }
    //   print("object=============================================");
    //   print(credential.user);
    //   if(!credential.user!.emailVerified){
    //     toastInfo("Bạn phải xác nhận email trước!");
    //     return;
    //   }
    //   var user = credential.user;
    //   if(user!=null){
    //     String? displayName = user.displayName;
    //     String? email = user.email;
    //     String? id = user.uid;
    //     String? photoUrl = user.photoURL;
    //
    //     LoginRequestEntity loginRequestEntity = LoginRequestEntity();
    //     loginRequestEntity.avatar = photoUrl;
    //     loginRequestEntity.name = displayName;
    //     loginRequestEntity.email = email;
    //     loginRequestEntity.open_id = id;
    //     loginRequestEntity.type = 1;
    //     asyncPostAllData(loginRequestEntity);
    //     print("***********************************");
    //     print(loginRequestEntity.avatar);
    //     print(loginRequestEntity.email);
    //     print(loginRequestEntity.name);
    //     if(kDebugMode){
    //       print("Tài khoản đã đăng nhập");
    //     }
    //   }else{
    //     toastInfo("Lỗi Đăng nhập");
    //   }
    //
    // }on FirebaseAuthException catch(e){
    //   if(e.code=='user-not-found'){
    //     toastInfo("Tài khoản không được tìm thấy!");
    //   }else if(e.code=='wrong-password'){
    //     toastInfo("Mật khẩu không đúng!");
    //   }
    //   print(e.code);
    // }catch(e){
    //   if(kDebugMode){
    //     print(e.toString());
    //   }
    // }



    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }



  // Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async{
  //   String email = state.email;
  //   String password = state.password;
  //
  //   emailController.text = email;
  //   passwordController.text = password;
  //
  //   var result = await SignInRepo.login(email, password);
  //   print(result);
  //   print("trar ve");
  //   if(result.code==200){
  //     try{
  //       var navigator = Navigator.of(ref.context);
  //
  //       Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));
  //       Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
  //
  //       navigator.push(MaterialPageRoute(
  //           builder: (BuildContext context)=>const CourseHome())
  //       );
  //
  //     }catch(e){
  //       if(kDebugMode){
  //         print("anh nhi=> nos lxoi roi");
  //         print(e.toString());
  //       }
  //     }
  //   }else{
  //     toastInfo("Lỗi đăng nhập");
  //   }
  //
  // }

}