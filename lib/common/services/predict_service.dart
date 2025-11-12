import 'dart:convert';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:dacs_ha4/models/formdata.dart'; // Đảm bảo import lớp Predict
import 'http_util.dart';

class PredictService {
  Future<double?> predict(Predict predict) async {
    try {
      // Chuyển Predict thành JSON và gửi qua API
      var response = await HttpUtil().post2(
        "predict",
        data: jsonEncode(predict.toJson()),
      );
      print("***********************************************");
      print(response);

      if (response.statusCode == 200) {
        // Giải mã phản hồi nhận được từ server
        var responseData = jsonDecode(response.body);
        // Trả về giá trị predicted_crop_yield từ mảng
        return responseData['predicted_crop_yield'][0];
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (error) {
      print("Error while sending request: $error");
      return null;
    }
  }
}
