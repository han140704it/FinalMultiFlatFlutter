import 'dart:convert';

import 'package:dacs_ha4/common/services/http_util.dart';

import '../../../common/entities/food.dart';

class FeatureFoodRepos{
  static Future<FoodListResponseEntity> featureFood() async {
    var response = await HttpUtil().get("foods/featured");
    if (response.statusCode == 200) {
      print("ở FeatureFoodRepos:");
      print(response);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load food data');
    }
  }

}