import 'package:flutter/material.dart';
import 'package:dacs_ha4/common/services/predict_service.dart';
import 'package:dacs_ha4/models/formdata.dart';

class PredictNotifier extends ChangeNotifier {
  PredictService _predictService = PredictService();
  Predict? _predict;

  // Trạng thái loading
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Predict? get predict => _predict;

  // Hàm gửi dữ liệu dự đoán đến server
  Future<void> sendPredictToServer() async {
    if (_predict == null) return; // Nếu chưa có dữ liệu dự đoán thì không gửi

    _isLoading = true;
    notifyListeners();

    try {
      // Gửi yêu cầu đến server và nhận kết quả
      double? predictedYield = await _predictService.predict(_predict!);


      if (predictedYield != null) {
        print("---------------------------------------------------------------");
        print('Predicted crop yield: $predictedYield');
      } else {
        print('Dự đoán không thành công');
      }
    } catch (error) {
      print('Lỗi khi gửi dữ liệu: $error');
    }

    _isLoading = false;
    notifyListeners();
  }

  void updatePredict(Predict newPredict) {
    _predict = newPredict;
    notifyListeners();
  }
}
