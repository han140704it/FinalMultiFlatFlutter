import '../entities/food.dart';
import '../services/http_util.dart';

class FoodAPI{
  static Future<FoodListResponseEntity> foodList() async{
    var response = await HttpUtil().get1(
        'foods'
    );
    return FoodListResponseEntity.fromJson(response);
  }
}