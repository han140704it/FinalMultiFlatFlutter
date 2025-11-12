import 'dart:convert';

import 'package:dacs_ha4/models/formdata.dart';

import '../../../common/services/http_util.dart';

class CropPreDictRepo{
  static Future<Predict> predict({Predict? params}) async{
    print("given info ${jsonEncode(params)}");
    var response = await HttpUtil().post2(
      "predict",
      data: jsonEncode(params?.toJson()),
      // queryParameters: {
      //   'name': "abc",
      //   'email': "abc456@gmail.com",
      //   'avatar': "xyz",
      //   'open_id': "asdfgh",
      //   'type': 1
      // }

    );
    return Predict.fromJson(response);
  }
}