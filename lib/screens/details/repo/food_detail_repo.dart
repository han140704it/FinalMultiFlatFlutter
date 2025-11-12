
import 'dart:convert';

import 'package:dacs_ha4/common/entities/food.dart';
import 'package:dacs_ha4/common/entities/lesson.dart';
import 'package:dacs_ha4/common/services/http_util.dart';

class FoodDetailRepo{
  static Future<FoodDetailResponseEntity> foodDetail({FoodRequestEntity? params}) async {

    var response = await HttpUtil().post("food/detail",
      queryParameters: params?.toJson()
    );
    return FoodDetailResponseEntity.fromJson(response);
  }

  static Future<LessonListResponseEntity> foodLessonList({LessonRequestEntity? params}) async {
    var response = await HttpUtil().get("lessons", queryParameters: params?.toJson());

      return LessonListResponseEntity.fromJson(response.data);
  }

}