import 'package:dacs_ha4/common/services/http_util.dart';

import '../../../common/entities/food.dart';

class FoodsSearchRepos{
  static Future<FoodListResponseEntity> foodsDefaultSearch() async{
    var response = await HttpUtil().get1("foods/featured");
    return FoodListResponseEntity.fromJson(response);

  }
  static Future<FoodListResponseEntity> foodsSearch({SearchRequestEntity? params}) async{
    var response = await HttpUtil().post("foods/search", queryParameters: params?.toJson());
    return FoodListResponseEntity.fromJson(response);
  }
}