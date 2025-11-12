import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common/api/food_api.dart';
import '../../../common/entities/food.dart';

part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeList extends _$HomeCourseList{
  Future<List<FoodItem>?> fetchCourseList() async{
    var result = await FoodAPI.foodList();
    if(result.code==200){
      return result.data;
    }
    return null;
  }

  @override
  FutureOr<List<FoodItem>?> build() async{
    return fetchCourseList();
  }
}